[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path,
    [string]$OutputPath
)

$ErrorActionPreference = 'Stop'

$root = (Resolve-Path $RepositoryRoot).Path
$manifestPath = Join-Path $root 'foundry/KNOWLEDGE_MANIFEST.txt'

if (-not (Test-Path -LiteralPath $manifestPath -PathType Leaf)) {
    throw "Knowledge manifest not found: $manifestPath"
}

if ([string]::IsNullOrWhiteSpace($OutputPath)) {
    $OutputPath = Join-Path $root 'foundry/generated/FOUNDRY_CONTEXT.md'
}

$sourceFiles = Get-Content -LiteralPath $manifestPath |
    ForEach-Object { $_.Trim() } |
    Where-Object { $_ -and -not $_.StartsWith('#') }

$builder = [System.Text.StringBuilder]::new()
[void]$builder.AppendLine('# Generated Microsoft Foundry Context')
[void]$builder.AppendLine()
[void]$builder.AppendLine('> GENERATED FILE — DO NOT EDIT. Update the canonical source files and run `scripts/build-foundry-context.ps1`.')
[void]$builder.AppendLine()
[void]$builder.AppendLine('The Git repository is authoritative if this bundle differs from repository files.')

foreach ($relativePath in $sourceFiles) {
    $candidate = Join-Path $root $relativePath
    if (-not (Test-Path -LiteralPath $candidate -PathType Leaf)) {
        throw "Manifest source does not exist: $relativePath"
    }

    $resolved = (Resolve-Path -LiteralPath $candidate).Path
    if (-not $resolved.StartsWith($root, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Manifest source escapes repository root: $relativePath"
    }

    [void]$builder.AppendLine()
    [void]$builder.AppendLine('---')
    [void]$builder.AppendLine()
    [void]$builder.AppendLine("## Source: ``$relativePath``")
    [void]$builder.AppendLine()
    [void]$builder.AppendLine((Get-Content -Raw -LiteralPath $resolved).TrimEnd())
}

$outputDirectory = Split-Path -Parent $OutputPath
if (-not (Test-Path -LiteralPath $outputDirectory -PathType Container)) {
    New-Item -ItemType Directory -Path $outputDirectory | Out-Null
}

$normalizedOutput = $builder.ToString().Replace("`r`n", "`n").Replace("`r", "`n").TrimEnd() + "`n"

[System.IO.File]::WriteAllText(
    $OutputPath,
    $normalizedOutput,
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host "Generated $OutputPath from $($sourceFiles.Count) canonical files."
