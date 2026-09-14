# Documentacion del sistema de enemigos

Esta carpeta contiene el sitio DocFX del sistema modular de enemigos.

## Generar localmente

Desde la raiz del proyecto Unity:

```powershell
.\Documentation\build-docs.ps1
```

El sitio final se genera en `Documentation/_site`.

Para previsualizarlo con el servidor integrado de DocFX:

```powershell
Push-Location Documentation
docfx docfx.json --serve
Pop-Location
```

La carpeta `source` contiene copias locales de la DLL y el XML generados por Unity. Se regeneran con `build-docs.ps1`.
