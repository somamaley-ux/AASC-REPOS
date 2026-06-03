Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$prohibitedPattern = "^\s*(axiom|unsafe)\b|\b(sorry|admit)\b"
$scanRoots = @(
    "MaleyLean\Papers\YangMills",
    "Checks\Axiom"
)

$auditFiles = @(
    "Checks\Axiom\YangMillsLatticeGapObligationAudit.lean",
    "Checks\Axiom\YangMillsSharpLocalObligationAudit.lean",
    "Checks\Axiom\YangMillsContinuumTransportObligationAudit.lean",
    "Checks\Axiom\YangMillsOSWightmanObligationAudit.lean",
    "Checks\Axiom\YangMillsMinkowskiGapObligationAudit.lean",
    "Checks\Axiom\YangMillsEndpointExactnessObligationAudit.lean",
    "Checks\Axiom\YangMillsClayExtensionObligationAudit.lean",
    "Checks\Axiom\YangMillsAPlusFullAudit.lean",
    "Checks\Axiom\YangMillsAPlusObligationLedgerAudit.lean",
    "Checks\Axiom\YangMillsAPlusSubobligationLedgerAudit.lean",
    "Checks\Axiom\YangMillsAPlusClosureProtocolAudit.lean",
    "Checks\Axiom\YangMillsAPlusStemToSternTargetAudit.lean",
    "Checks\Axiom\YangMillsAPlusSourceCrosswalkAudit.lean",
    "Checks\Axiom\YangMillsAPlusProgressLedgerAudit.lean"
)

if ($auditFiles.Count -ne 14) {
    throw "Expected 14 Yang-Mills A+ audit files, found $($auditFiles.Count)."
}

$uniqueAuditFiles = $auditFiles | Select-Object -Unique
if ($uniqueAuditFiles.Count -ne $auditFiles.Count) {
    throw "Yang-Mills A+ audit file list contains duplicates."
}

foreach ($auditFile in $auditFiles) {
    if (-not (Test-Path -LiteralPath $auditFile -PathType Leaf)) {
        throw "Missing Yang-Mills A+ audit file: $auditFile"
    }
}

Write-Host "Lean toolchain:"
Get-Content -LiteralPath "lean-toolchain"

Write-Host "Mathlib manifest entry:"
$manifest = Get-Content -LiteralPath "lake-manifest.json" -Raw | ConvertFrom-Json
$mathlib = $manifest.packages | Where-Object { $_.name -eq "mathlib" } | Select-Object -First 1
if ($null -eq $mathlib) {
    throw "Could not locate mathlib in lake-manifest.json."
}
Write-Host ("mathlib rev: " + $mathlib.rev)

$rgArgs = @(
    "-n",
    "--glob",
    "*.lean",
    $prohibitedPattern
) + $scanRoots

$prohibitedMatches = & rg @rgArgs
if ($LASTEXITCODE -eq 0) {
    $prohibitedMatches | ForEach-Object { Write-Host $_ }
    throw "Prohibited Lean placeholder or escape found in Yang-Mills audit surface."
}
if ($LASTEXITCODE -ne 1) {
    throw "Prohibited-token scan failed with exit code $LASTEXITCODE."
}
Write-Host "No live axiom/sorry/admit/unsafe declarations found in Yang-Mills audit surface."

lake build MaleyLean.Papers.YangMills
foreach ($auditFile in $auditFiles) {
    lake env lean $auditFile
}
