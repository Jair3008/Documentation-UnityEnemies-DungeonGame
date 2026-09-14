param(
    [Parameter(Mandatory = $true)]
    [string]$XmlPath,

    [Parameter(Mandatory = $true)]
    [string]$OutputPath
)

$ErrorActionPreference = "Stop"
$xml = [xml](Get-Content -Raw -Encoding UTF8 -Path $XmlPath)
$members = $xml.doc.members.member
$types = @{}

function Get-SummaryText($member) {
    if ($null -eq $member.summary) { return "" }

    if ($member.summary -is [string]) {
        return (($member.summary -replace "\s+", " ").Trim())
    }

    return (($member.summary.InnerText -replace "\s+", " ").Trim())
}

foreach ($member in $members) {
    $name = $member.name
    $summary = Get-SummaryText $member
    if ([string]::IsNullOrWhiteSpace($summary)) { continue }

    if ($name.StartsWith("T:")) {
            $typeName = $name.Substring(2).Replace('`1', '<T>').Replace('`2', '<T1,T2>')
        $types[$typeName] = [ordered]@{
            Summary = $summary
            Members = [System.Collections.Generic.List[object]]::new()
        }
    }
}

foreach ($member in $members) {
    $name = $member.name
    if ($name.StartsWith("T:")) { continue }

    $separator = $name.IndexOf(":")
    if ($separator -lt 0) { continue }
    $memberName = $name.Substring($separator + 1).Replace('`1', '<T>').Replace('`2', '<T1,T2>')
    $typeName = ($memberName -split "\.")[0]
    if (-not $types.Contains($typeName)) { continue }

    $summary = Get-SummaryText $member
    if ([string]::IsNullOrWhiteSpace($summary)) { continue }

    $types[$typeName].Members.Add([pscustomobject]@{
        Name = $memberName
        Summary = $summary
    })
}

$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add("---")
$lines.Add("title: Referencia API")
$lines.Add("uid: api-index")
$lines.Add("---")
$lines.Add("")
$lines.Add("# Referencia API")
$lines.Add("")
$lines.Add("Referencia generada automaticamente desde los comentarios XML del ensamblado `Isai.Enemies`.")
$lines.Add("")
$lines.Add("> Esta pagina se regenera con `Documentation/build-docs.ps1`; no edites su contenido manualmente.")

foreach ($typeName in ($types.Keys | Sort-Object)) {
    $type = $types[$typeName]
    $lines.Add("")
    $lines.Add("## ``$typeName``")
    $lines.Add("")
    $lines.Add($type.Summary)

    if ($type.Members.Count -gt 0) {
        $lines.Add("")
        $lines.Add("| Miembro | Descripcion |")
        $lines.Add("|---|---|")
        foreach ($item in ($type.Members | Sort-Object Name)) {
            $safeName = $item.Name.Replace("|", "\\|")
            $safeSummary = $item.Summary.Replace("|", "\\|")
            $lines.Add("| ``$safeName`` | $safeSummary |")
        }
    }
}

$parent = Split-Path -Parent $OutputPath
New-Item -ItemType Directory -Force -Path $parent | Out-Null
[System.IO.File]::WriteAllLines($OutputPath, $lines, [System.Text.UTF8Encoding]::new($false))