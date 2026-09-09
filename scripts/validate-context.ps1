[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path $RepositoryRoot).Path
$errors = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()

$requiredFiles = @(
    'README.md',
    'START_HERE.md',
    'BOOTSTRAP.md',
    'AGENTS.md',
    'CLAUDE.md',
    'AI.md',
    'STATE.md',
    'SECURITY.md',
    '.ai/bootstrap-manifest.json',
    'docs/PRODUCT.md',
    'docs/REQUIREMENTS.md',
    'docs/REFERENCE_ARCHITECTURE.md',
    'docs/SYSTEMS_AND_CAPABILITIES.md',
    'docs/ACCESS_AND_APPROVALS.md',
    'docs/DECISIONS.md',
    'foundry/AGENT_INSTRUCTIONS.md',
    'foundry/CAPABILITY_PROBE.md',
    'foundry/LOCAL_AGENT_PROFILE.md',
    'foundry/KNOWLEDGE_MANIFEST.txt',
    'foundry/generated/FOUNDRY_CONTEXT.md',
    'transfer/PERSONAL_TO_WORK.md',
    'transfer/SANITIZATION_CHECKLIST.md'
)

foreach ($relativePath in $requiredFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $root $relativePath) -PathType Leaf)) {
        $errors.Add("Missing required file: $relativePath")
    }
}

$manifestPath = Join-Path $root '.ai/bootstrap-manifest.json'
if (Test-Path -LiteralPath $manifestPath -PathType Leaf) {
    try {
        $bootstrap = Get-Content -Raw -LiteralPath $manifestPath | ConvertFrom-Json
        if ($bootstrap.status -notin @('NOT_STARTED', 'IN_PROGRESS', 'COMPLETE')) {
            $errors.Add("Invalid bootstrap status: $($bootstrap.status)")
        }

        foreach ($relativePath in $bootstrap.populateFiles) {
            $target = Join-Path $root $relativePath
            if (-not (Test-Path -LiteralPath $target -PathType Leaf)) {
                $errors.Add("Bootstrap populate file does not exist: $relativePath")
            }
        }
    }
    catch {
        $errors.Add("Bootstrap manifest is not valid JSON: $($_.Exception.Message)")
    }
}

$decisionFiles = Get-ChildItem -LiteralPath (Join-Path $root 'docs/decisions') -Filter 'ADR-*.md' -File
foreach ($decisionFile in $decisionFiles) {
    $content = Get-Content -Raw -LiteralPath $decisionFile.FullName
    $match = [regex]::Match($content, '(?m)^Status:\s+(PROPOSED|ACCEPTED|SUPERSEDED|REJECTED)\s*$')
    if (-not $match.Success) {
        $errors.Add("Decision has missing or invalid status: docs/decisions/$($decisionFile.Name)")
    }
}

$repositoryRelativeFiles = @(& git -C $root ls-files --cached --others --exclude-standard)
if ($LASTEXITCODE -ne 0) {
    throw 'Unable to enumerate repository files with Git.'
}

$repositoryFiles = $repositoryRelativeFiles |
    ForEach-Object { Get-Item -LiteralPath (Join-Path $root $_) }

$forbiddenFiles = $repositoryFiles | Where-Object {
    ($_.Name -match '^\.env($|\.)' -and $_.Name -ne '.env.example') -or
    $_.Extension -in @('.pfx', '.p12', '.pem', '.key') -or
    $_.Name -in @('id_rsa', 'id_ed25519')
}

foreach ($file in $forbiddenFiles) {
    $relative = [System.IO.Path]::GetRelativePath($root, $file.FullName)
    $errors.Add("Potential secret file is present: $relative")
}

$tempBundle = [System.IO.Path]::GetTempFileName()
try {
    & (Join-Path $root 'scripts/build-foundry-context.ps1') -RepositoryRoot $root -OutputPath $tempBundle | Out-Null
    $trackedBundle = Join-Path $root 'foundry/generated/FOUNDRY_CONTEXT.md'
    if (Test-Path -LiteralPath $trackedBundle -PathType Leaf) {
        $expectedHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $tempBundle).Hash
        $actualHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $trackedBundle).Hash
        if ($expectedHash -ne $actualHash) {
            $errors.Add('Generated Foundry context is stale. Run scripts/build-foundry-context.ps1.')
        }
    }
}
finally {
    if (Test-Path -LiteralPath $tempBundle) {
        Remove-Item -LiteralPath $tempBundle -Force
    }
}

$trackedCandidates = $repositoryFiles

foreach ($file in $trackedCandidates) {
    if ($file.Extension -ne '.md') { continue }
    $repositoryRelativePath = [System.IO.Path]::GetRelativePath($root, $file.FullName)
    if ($repositoryRelativePath -eq 'foundry\generated\FOUNDRY_CONTEXT.md') { continue }
    $content = Get-Content -Raw -LiteralPath $file.FullName
    $matches = [regex]::Matches($content, '\[[^\]]+\]\(([^)]+)\)')
    foreach ($match in $matches) {
        $targetText = $match.Groups[1].Value
        if ($targetText -match '^(https?://|mailto:|#)') { continue }
        $targetText = ($targetText -split '#')[0]
        if ([string]::IsNullOrWhiteSpace($targetText)) { continue }
        $decoded = [System.Uri]::UnescapeDataString($targetText)
        $targetPath = Join-Path $file.DirectoryName $decoded
        if (-not (Test-Path -LiteralPath $targetPath)) {
            $errors.Add("Broken relative link in ${repositoryRelativePath}: $targetText")
        }
    }
}

if ($warnings.Count -gt 0) {
    $warnings | ForEach-Object { Write-Warning $_ }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host "Context validation passed: $($requiredFiles.Count) required files, $($decisionFiles.Count) decision records, generated bundle, secret-file names, and relative links checked."
