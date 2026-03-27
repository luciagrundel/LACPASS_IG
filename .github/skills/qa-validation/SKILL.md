---
name: ig-qa-validation
description: "Use when: reviewing quality reports after building the IG, analyzing errors/warnings, deciding which issues need fixing, or planning validation iterations. Multi-step workflow for QA triage, impact assessment, and remediation planning."
---

# Implementation Guide QA & Validation

**Para**: Analizar reportes de calidad, priorizar problemas y planificar correcciones en la Implementation Guide FHIR LACPASS IPS.

## Cuándo Usar Esta Skill

- Después de ejecutar `_genonce.bat` o `_gencontinuous.bat`
- Necesitas entender qué significa cada error/warning
- Quieres priorizar qué arreglar primero
- Buscas documentar decisiones de validación
- Necesitas rastrear problemas recurrentes

## Flujo de Trabajo Completo

### 1. **RECOLECTAR** — Análisis Inicial (5 min)
Examina los reportes de QA generados en `output/`:

- **qa.txt** — Resumen legible (errores, warnings, infos)
- **qa.json** — Datos estructurados para análisis
- **qa-eslintcompact.txt** — Issues de linting
- **qa-tx.html** — Problemas de terminología (si está online)

```powershell
# En terminal, revisar resumen rápido:
type output\qa.txt | Select-Object -First 50
```

**Salida esperada:**
```
err = X, warn = Y, info = Z
Build Errors : E / W / I
```

---

### 2. **CLASIFICAR** — Mapear Problemas (10 min)
Agrupa issues por categoría y saca cuenta de frecuencia:

| Categoría | Patrón | Acción Típica |
|-----------|--------|--------------|
| **Versión/Dependencias** | `version X is not valid semantic version` | Actualizar en `sushi-config.yaml` |
| **Canónicos Inseguros** | `canonical link is unsafe with regard to versions` | Ignorar (es una advertencia de HL7) |
| **IDs Duplicados en HTML** | `duplicate anchor Ids` | Revisar templates (generación automática) |
| **Recursos Faltantes** | `Unable to find ImplementationGuide.definition.resource` | Añadir descripciones en FSH |
| **HTML Inseguro** | `javascript is illegal...HL7 ci-build` | Mover scripts a `.js` files trusted |
| **Dependencias Obsoletas** | `more recent version is X` | Evaluar actualizar en `sushi-config.yaml` |
| **URLs Inválidas** | `URL cannot be resolved` | Verificar URIs (OID, systems, etc.) |

---

### 3. **EVALUAR** — Impacto y Prioridad (10 min)
Para cada problema, responde:

**¿Es crítico?** (Bloquea build o conformidad)
- ✅ **SÍ** → Arreglar antes de publicar
- ❌ **NO** → Documentar para futuro

**¿Es configuración o código?**
- 🔧 **Configuración** → Cambiar `sushi-config.yaml`, `ig.ini`, o templates
- 📝 **Código FSH** → Editar perfiles en `input/fsh/`
- 🎨 **Templates/HTML** → Revisar `template_RACSEL/` o assets

**¿Es recurrente?**
- 🔁 **Sí** → Crear issue tracking o regla de ignorar
- 🔔 **No** → One-off, bajo prioridad

---

### 4. **DOCUMENTAR** — Plan de Acción (5 min)
Crea o actualiza `.github/qa-decisions.md` con:

```markdown
## QA Report: [FECHA]

**Resumen**: err={count}, warn={count}, info={count}

### Problemas Críticos
- [ ] [Problema 1] — [Archivo] — Ver output/qa.txt:123
  - Causa: 
  - Solución: 
  - Status: ⏳ TODO / 🔧 IN-PROGRESS / ✅ DONE

### Advertencias Documentadas (no bloquean)
- [Problema 2] — Decisión: IGNORAR (razón: ...)

### Seguimiento
- Último build: [fecha]
- Próxima revisión: [fecha]
```

---

### 5. **REMEDIAR** — Ejecutar Correcciones
Según tipo de problema:

#### **Versiones Semánticas** (sushi-config.yaml)
```yaml
version: 0.2.0   # Cambiar de 0.2 a 0.2.0 (formato válido)
```

#### **Recursos sin Descripción** (input/fsh/*.fsh)
```
* Patient-LACPatientExample 
  "Ejemplo de paciente para pruebas del perfil LAC Patient"
```

#### **URLs OID Inválidas**
```
// Antes (incorrecto):
identifier.system = "urn:oid.2.16.152"

// Después (correcto, si es válido):
identifier.system = "urn:oid:2.16.152"
// O mejor, usar URIs con namespace:
identifier.system = "http://example.org/identifier/patient-rut"
```

#### **Dependencias Obsoletas**
Evaluar riesgo antes de actualizar. En `sushi-config.yaml`:
```yaml
dependencies:
  hl7.fhir.r4.core: 4.0.1
  hl7.fhir.uv.ips: 
    uri: http://hl7.org/fhir/uv/ips
    version: 2.0.0  # Actualizar desde 1.1.0 si es compatible
```

---

## Checklist Rápido Post-Build

- [ ] Revisar `err` count: ¿Error crítico?
- [ ] Notar `warn` count: ¿Mayor de 40 warnings?
- [ ] Revisar líneas 1-10 de qa.txt (prioridad alta)
- [ ] Filtrar por "ERROR" o "invalid" en qa.txt
- [ ] Identificar 3-5 problemas para siguiente sprint
- [ ] Actualizar `qa-decisions.md`
- [ ] Documentar qué se ignoró y por qué

---

## Herramientas y Comandos

```powershell
# Contar problemas por tipo:
(Get-Content output\qa.txt) -join "`n" | 
  Select-String "WARNING|ERROR" | 
  Group-Object { $_ -replace '^.*: ', '' } |
  Sort-Object Count -Descending

# Buscar problema específico:
Select-String -Path output\qa.txt -Pattern "duplicate anchor"

# Ver timeline de builds:
Get-Item output\qa.txt | Select-Object LastWriteTime
```

---

## Decisiones de Diseño Documentadas

### ✅ IGNORAR (Seguro)
- **Canonical version warnings**: HL7 exige estos chequeos. Ignorar si no planeamos publicar en ci-build oficial.
- **Duplicate HTML anchors en StructureDefinitions**: Generados automáticamente por IG Publisher. No afecta conformidad FHIR.
- **Script warnings en HTML output**: Solo afecta si se publica en HL7 ci-build. Para servidor propio: ignorar.

### 🔧 SIEMPRE ARREGLAR
- **Build errors** (`err > 0`): Bloquean publicación.
- **Semantic version** invalida: Necesaria para NPM package.
- **Dependencias de versión incompatible**: FHIR 4.0.1 vs 5.0.0 causa problemas de validación.
- **URLs inválidas en ejemplos**: Fallan en validación por terminal servers.

### 📋 EVALUAR CASO A CASO
- Warnings recurrentes (>10 veces): Considerar arreglar plantilla global.
- Dependencias obsoletas: Revisar changelog antes de actualizar.
- Recursos sin descripción: Bajo prioridad, mejora UX.

