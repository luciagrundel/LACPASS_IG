---
title: "QA Decisions & Issues Tracker"
---

# QA Decisions Tracker - LACPASS IG

Documento para registrar decisiones sobre problemas encontrados en el QA del IG, y rastrear qué se arregló, ignoró o pospuso.

## Formato

Para cada problema identificado:
1. **Descripción**: Qué es
2. **Categoría**: Tipo de problema
3. **Severidad**: Crítica / Alta / Media / Baja
4. **Decisión**: ARREGLAR / IGNORAR / POSPONER
5. **Justificación**: Por qué
6. **Status**: ⏳ TODO / 🔧 IN-PROGRESS / ✅ DONE
7. **Fecha**: Cuándo se decidió

---

## Problemas Actuales

### 1. FHIR Version Mismatch (IHE Pharm MDP)

| Campo | Valor |
|-------|-------|
| **Descripción** | IG basado en FHIR 4.0.1, pero paquete `ihe.pharm.mpd#1.0.0-comment-2` es FHIR 5.0.0 |
| **Ubicación** | output/qa.txt, línea: "IG is version 4.0.1...while...is from version 5.0.0" |
| **Categoría** | Versionado / Dependencias |
| **Severidad** | 🔴 **CRÍTICA** — Bloquea validación en algunos validadores |
| **Decisión** | ⏳ EVALUAR |
| **Acciones** | 1. Revisar si es necesaria la dependencia `ihe.pharm.mpd`<br/>2. Si sí: actualizar IG a FHIR 5.0<br/>3. Si no: remover de `sushi-config.yaml` |
| **Status** | ⏳ TODO |
| **Asignado a** | - |
| **Fecha** | 27-03-2026 |

**Notas**: 
- Revisar `sushi-config.yaml` línea de `dependencies`
- Comarcial en: input/fsh/ si se usa sintaxis de la dependencia

---

### 2. Semantic Versioning (IG Version)

| Campo | Valor |
|-------|-------|
| **Descripción** | `version: 0.2` no es semántica válida (debe ser 0.2.0) |
| **Categoría** | Versionado |
| **Severidad** | 🟠 **ALTA** — No será válida en NPM |
| **Decisión** | ✅ ARREGLAR |
| **Solución** | Cambiar en `sushi-config.yaml`: `version: 0.2.0` |
| **Status** | ⏳ TODO |
| **Fecha** | 27-03-2026 |

---

### 3. Canonical Link Version Safety (Múltiple - 48x)

| Campo | Valor |
|-------|-------|
| **Descripción** | "The link 'http://racsel.org' is a canonical link...unsafe with regard to versions" |
| **Ejemplos** | ContinuidadAtencion.html, Patient-LACPatientExample.html, etc. (afecta ~60 archivos) |
| **Categoría** | HTML / Canónicos |
| **Severidad** | 🟡 **BAJA** — Solo aplica si se publica en HL7 ci-build |
| **Decisión** | ✅ **IGNORAR** (si no es ci-build oficial) / 🔧 ARREGLAR (si lo es) |
| **Justificación** | HL7 ci-build requiere versiones en URLs canónicas (ej: http://racsel.org/1.0). Para servidor propio: no requerido. |
| **Status** | ✅ DOCUMENTADO |
| **Fecha** | 27-03-2026 |

**Acción si necesario**:
```
// En template o layout:
Cambiar: <a href="http://racsel.org">RACSEL</a>
Por:     <a href="http://racsel.org/{{version}}">RACSEL</a>
```

---

### 4. HTML Duplicate Anchor IDs

| Campo | Valor |
|-------|-------|
| **Descripción** | `StructureDefinition-LACBundleTransactionMHD.html`, `LACOrganization.html`, `LACPatient.html`: múltiples IDs de anclaje duplicados |
| **Ejemplo** | "Bundle,Bundle.entry,Bundle.entry.2,Bundle.entry.resource,..." |
| **Categoría** | Generación HTML / Templates |
| **Severidad** | 🟡 **MEDIA** — Afecta navegación en HTML pero no conformidad FHIR |
| **Decisión** | 📋 EVALUAR |
| **Acciones** | 1. Revisar si IG Publisher 2.2.3 es versión latest<br/>2. Si hay actualización: actualizar Publisher<br/>3. Si no: revisar template_RACSEL para conflictos de variables |
| **Status** | ⏳ TODO |
| **Notas** | Típicamente auto-generado. Revisar `_updatePublisher.bat` para versión actual |
| **Fecha** | 27-03-2026 |

---

### 5. Resource Description Missing (Patient-LACPatientExample)

| Campo | Valor |
|-------|-------|
| **Descripción** | "Unable to find ImplementationGuide.definition.resource.description for the resource Patient/LACPatientExample" |
| **Categoría** | Documentación / Ejemplos |
| **Severidad** | 🟡 **BAJA** — Mejora UX pero no es requerido |
| **Decisión** | ✅ ARREGLAR (próximo sprint) |
| **Solución** | Agregar descripción en FSH al recurso ejemplo |
| **Archivo** | input/fsh/ (buscar Patient-LACPatientExample) |
| **Status** | ⏳ TODO |
| **Fecha** | 27-03-2026 |

**Ejemplo FSH**:
```
* Patient-LACPatientExample 
  "Ejemplo de recurso Patient validado contra el perfil LAC Patient"
```

---

### 6. Invalid OID URLs (Patient Identifiers)

| Campo | Valor |
|-------|-------|
| **Descripción** | `Patient/LACPatientExample: Patient.identifier[0].system: 'urn:oid.2.16.152' no puede resolverse` |
| **Severidad** | 🔴 **CRÍTICA** — Falla validación de terminología |
| **Decisión** | 🔧 ARREGLAR INMEDIATO |
| **Solución** | Cambiar formato OID de `urn:oid.2.16.152` a `urn:oid:2.16.152` (revisar RFC 3611) |
| **Alternativa** | Usar URL canónica: `http://example.org/identifier/chilean-rut` |
| **Archivos** | fsh-generated/resources/Patient-LACPatientExample.json |
| **Status** | 🔧 IN-PROGRESS |
| **Fecha** | 27-03-2026 |

**Test**:
```powershell
# Validar OID después de cambio:
Select-String -Path fsh-generated\resources\Patient-LACPatientExample.json -Pattern "urn:oid"
```

---

### 7. Deprecated Dependency Versions

| Campo | Valor |
|-------|-------|
| **Dependencia** | `hl7.fhir.uv.ips` — usando 1.1.0, última es 2.0.0 (release 2022-11-22) |
| **Otra** | `ihe.iti.mhd` — usando 4.2.2, última es 5.0.0 (release 2024-05-18) |
| **Categoría** | Versionado / Dependencias |
| **Severidad** | 🟠 **ALTA** — Posibles incompatibilidades futuras |
| **Decisión** | 📋 EVALUAR EN PRÓXIMO SPRINT |
| **Checklist** | - [ ] Leer changelog de cada paquete<br/>- [ ] Verificar breaking changes<br/>- [ ] Probar actualización en rama feature<br/>- [ ] Ejecutar validación completa |
| **Status** | ⏳ TODO |
| **Fecha** | 27-03-2026 |

---

## Resumen de Decisiones

| Problema | Decisión | Prioridad | Status |
|----------|----------|-----------|--------|
| Version Mismatch FHIR | EVALUAR | CRÍTICA | ⏳ TODO |
| Semantic Versioning | ARREGLAR | ALTA | ⏳ TODO |
| Canonical Link Warnings | IGNORAR* | BAJA | ✅ DONE |
| Duplicate HTML IDs | EVALUAR | MEDIA | ⏳ TODO |
| Missing Resource Desc | ARREGLAR | BAJA | ⏳ TODO |
| Invalid OID URLs | ARREGLAR | CRÍTICA | 🔧 IN-PROGRESS |
| Deprecated Dependencies | EVALUAR | ALTA | ⏳ TODO |

*Ignorar si no se publica en HL7 ci-build; de lo contrario, arreglar vía template.

---

## Próximas Acciones (Roadmap)

### Esta semana
- [ ] Arreglar OID URLs en Patient example
- [ ] Actualizar versión a 0.2.0 en sushi-config.yaml
- [ ] Evaluar si se necesita ihe.pharm.mpd

### Próxima iteración
- [ ] Revisar/actualizar dependencias (hl7.fhir.uv.ips, ihe.iti.mhd)
- [ ] Agregar descripciones a ejemplos (Patient-LACPatientExample, etc.)
- [ ] Revisar IG Publisher para duplicate anchor IDs

### Largo plazo
- [ ] Decidir si publicar en HL7 ci-build (afecta decisiones de canonical links y scripts)
- [ ] Establecer ciclo regular de QA (ej: post-cada-build, semanal)

---

## Historial de Cambios

| Fecha | Cambio | Quién |
|-------|--------|-------|
| 27-03-2026 | Creación inicial del tracker | Agent |
| | | |

