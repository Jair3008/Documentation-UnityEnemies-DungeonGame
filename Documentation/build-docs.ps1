$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot
$documentationRoot = Join-Path $projectRoot "Documentation"
$sourceRoot = Join-Path $documentationRoot "source\generated"
$xmlPath = Join-Path $projectRoot "Assets\Documentation\Isai.Enemies.xml"
$dllPath = Join-Path $projectRoot "Library\ScriptAssemblies\Isai.Enemies.dll"
$unityManagedRoot = "C:\Program Files\Unity\Hub\Editor\6000.4.5f1\Editor\Data\Managed\UnityEngine"
$netStandardPath = "C:\Program Files\dotnet\packs\NETStandard.Library.Ref\2.1.0\ref\netstandard2.1\netstandard.dll"

New-Item -ItemType Directory -Force -Path $sourceRoot | Out-Null

Write-Host "Generando XML de documentacion..."
dotnet build (Join-Path $projectRoot "Isai.Enemies.csproj") --no-restore `
    -p:GenerateDocumentationFile=true `
    -p:DocumentationFile=Assets/Documentation/Isai.Enemies.xml

if (-not (Test-Path $dllPath)) {
    throw "No se encontro el ensamblado compilado: $dllPath"
}

if (-not (Test-Path $xmlPath)) {
    throw "No se encontro el XML de documentacion: $xmlPath"
}

Copy-Item $dllPath (Join-Path $sourceRoot "Isai.Enemies.dll") -Force
Copy-Item $xmlPath (Join-Path $sourceRoot "Isai.Enemies.xml") -Force

if (-not (Test-Path $unityManagedRoot)) {
    throw "No se encontro la carpeta de referencias de Unity: $unityManagedRoot"
}

Get-ChildItem $unityManagedRoot -Filter "UnityEngine*.dll" | Copy-Item -Destination $sourceRoot -Force

if (Test-Path $netStandardPath) {
    Copy-Item $netStandardPath $sourceRoot -Force
}

Write-Host "Generando referencia API desde XML..."
& (Join-Path $documentationRoot "generate-api-md.ps1") `
    -XmlPath (Join-Path $sourceRoot "Isai.Enemies.xml") `
    -OutputPath (Join-Path $documentationRoot "api\index.md")

Push-Location $documentationRoot
try {
    Write-Host "Generando sitio estatico..."
    docfx build docfx.json
}
finally {
    Pop-Location
}

Write-Host "Documentacion generada en Documentation/_site"
