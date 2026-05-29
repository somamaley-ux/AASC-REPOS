param(
    [string]$OutputCsv = "zenodo_dois.csv",
    [string]$OutputJson = "zenodo_dois.json"
)

$ErrorActionPreference = "Stop"

$token = $env:ZENODO_TOKEN
if (-not $token) {
    $token = Read-Host "Zenodo token"
}

if (-not $token) {
    throw "No Zenodo token was provided."
}

$headers = @{
    Authorization = "Bearer $token"
    Accept        = "application/json"
}

$baseUrl = "https://zenodo.org/api"
$page = 1
$size = 100
$depositions = @()

Write-Host "Fetching Zenodo uploads..."

while ($true) {
    $uri = "$baseUrl/deposit/depositions?page=$page&size=$size&sort=mostrecent"
    $items = Invoke-RestMethod -Method Get -Uri $uri -Headers $headers

    if (-not $items -or $items.Count -eq 0) {
        break
    }

    $depositions += $items
    Write-Host "Fetched page $page ($($items.Count) records)"

    if ($items.Count -lt $size) {
        break
    }

    $page += 1
}

$rows = foreach ($dep in $depositions) {
    $record = $null

    if ($dep.record_id) {
        try {
            $record = Invoke-RestMethod -Method Get -Uri "$baseUrl/records/$($dep.record_id)" -Headers $headers
        }
        catch {
            Write-Warning "Could not fetch public record $($dep.record_id); using deposition metadata only."
        }
    }

    $versionDoi = $null
    $conceptDoi = $null

    if ($record) {
        $versionDoi = $record.doi
        if (-not $versionDoi -and $record.metadata) {
            $versionDoi = $record.metadata.doi
        }
        $conceptDoi = $record.conceptdoi
        if (-not $conceptDoi -and $record.metadata) {
            $conceptDoi = $record.metadata.conceptdoi
        }
    }

    if (-not $versionDoi) {
        $versionDoi = $dep.doi
    }
    if (-not $versionDoi -and $dep.metadata) {
        $versionDoi = $dep.metadata.doi
    }
    if (-not $conceptDoi) {
        $conceptDoi = $dep.conceptdoi
    }
    if (-not $conceptDoi -and $dep.metadata) {
        $conceptDoi = $dep.metadata.conceptdoi
    }

    [pscustomobject]@{
        deposition_id = $dep.id
        record_id     = $dep.record_id
        state         = $dep.state
        submitted     = $dep.submitted
        title         = $dep.title
        version_doi   = $versionDoi
        concept_doi   = $conceptDoi
        doi_url       = if ($versionDoi) { "https://doi.org/$versionDoi" } else { $null }
        record_url    = if ($dep.record_id) { "https://zenodo.org/records/$($dep.record_id)" } else { $null }
    }
}

$rows |
    Sort-Object -Property deposition_id -Descending |
    Export-Csv -Path $OutputCsv -NoTypeInformation -Encoding UTF8

$rows |
    Sort-Object -Property deposition_id -Descending |
    ConvertTo-Json -Depth 10 |
    Set-Content -Path $OutputJson -Encoding UTF8

$doiCount = ($rows | Where-Object { $_.version_doi }).Count
$conceptDoiCount = ($rows | Where-Object { $_.concept_doi }).Count

Write-Host ""
Write-Host "Done."
Write-Host "Uploads found: $($rows.Count)"
Write-Host "Version DOIs found: $doiCount"
Write-Host "Concept DOIs found: $conceptDoiCount"
Write-Host "CSV: $((Resolve-Path $OutputCsv).Path)"
Write-Host "JSON: $((Resolve-Path $OutputJson).Path)"
