---
title: Perfiles del Proyecto
layout: default
---

# Descripción de Perfiles - LACPass Implementation Guide

Esta página describe en detalle cada uno de los perfiles de recursos definidos en la guía de implementación LACPass, incluyendo sus restricciones, características y ejemplos.

**Tabla de Contenidos**
- [Introducción](#introducción)
- [Perfil LAC_Patient](#perfil-lac_patient)
- [Perfil LAC_Organization](#perfil-lac_organization)
- [Perfil LAC_Immunization](#perfil-lac_immunization)
- [Perfil LAC_Composition](#perfil-lac_composition)
- [Perfil LAC_Composition_DDCC](#perfil-lac_composition_ddcc)
- [Perfil LAC_Bundle](#perfil-lac_bundle)
- [Perfil LAC_Bundle_DDCC](#perfil-lac_bundle_ddcc)
- [Relaciones entre Perfiles](#relaciones-entre-perfiles)

---

## Introducción

Los perfiles definidos en LACPass extienden los estándares FHIR del **International Patient Summary (IPS)** con restricciones y extensiones específicas para Latinoamérica y el Caribe (LAC), incluyendo soporte para el estándar **DDCC (Digital Documentation of COVID-19 Certificates)** de la OMS.

### Jerarquía de Perfiles

```
FHIR Base Resources
    ├── Patient (FHIR R4)
    │   └── Patient-uv-ips (IPS)
    │       └── LAC_Patient ← Identificadores nacionales
    │
    ├── Organization (FHIR R4)
    │   └── Organization-uv-ips (IPS)
    │       └── LAC_Organization ← País obligatorio
    │
    ├── Immunization (FHIR R4)
    │   └── Immunization-uv-ips (IPS)
    │       └── LAC_Immunization ← Extensiones DDCC
    │
    ├── Composition (FHIR R4)
    │   └── Composition-uv-ips (IPS)
    │       ├── LAC_Composition ← Resumen estándar
    │       └── LAC_Composition_DDCC ← Resumen DDCC
    │
    └── Bundle (FHIR R4)
        └── Bundle-uv-ips (IPS)
            ├── LAC_Bundle ← Resumen estándar
            └── LAC_Bundle_DDCC ← Resumen DDCC
```

---

## Perfil LAC_Patient

### Identificación

| Propiedad | Valor |
|-----------|-------|
| **ID** | `lac-patient` |
| **URL Canónica** | `http://lacpass.racsel.org/StructureDefinition/lac-patient` |
| **Padre** | `Patient-uv-ips` |
| **Status** | active |
| **FHIR Version** | 4.0.1 |

### Descripción

**LAC_Patient** es un perfil que extiende el estándar IPS para pacientes, añadiendo restricciones para la identificación de pacientes en Latinoamérica y el Caribe.

El propósito principal es **enforcar el uso de identificadores internacionales y nacionales** de forma estructurada, con reglas específicas sobre:
- Qué tipo de ID se usa para cada propósito
- Cuál puede ser el ID oficial
- Validación de formatos de sistema

### Restricciones Principales

#### 1. **Slicing de Identificadores**

Los identificadores se dividen en dos categorías mutuamente exclusivas:

```
Slice: international
├─ Cardinalidad: 1..*  (obligatorio, uno o más)
├─ MustSupport: true
└─ Restricciones:
   ├─ Tipo: PPN (Passport Number)
   ├─ Uso: official (fijo)
   └─ Sistema: URN OID del país (ej: urn:oid.2.16.152)

Slice: national
├─ Cardinalidad: 1..*  (obligatorio, uno o más)
├─ MustSupport: true
└─ Restricciones:
   ├─ Tipo: Cualquiera EXCEPTO PPN (ValueSet "National_Identifier_Type")
   ├─ Sistema: URN OID del país (ej: urn:oid.2.16.152)
   └─ Ejemplos: TAX, DriverLicense, SocialSecurityNumber, etc.
```

#### 2. **Invariantes**

**Invariante: lac-pat-1**
```
Expression: "Patient.identifier.where(use='official').count() >= 1"
Severity: #error
Description: "A patient must have at least one official identifier"
```

**Invariante: lac-pat-2**
```
Expression: "Patient.identifier.where(use='official')[0].system.startsWith('urn:oid.2.16.')"
Severity: #error
Description: "The official identifier system must be a URN OID (urn:oid.2.16.*)"
```

### Ejemplo: LACPatientExample

```fsh
Instance: LACPatientExample
InstanceOf: LAC_Patient
Usage: #example

// Identificador Internacional (Passport)
* identifier[international].use = #official
* identifier[international].type = $v2-0203#PPN
* identifier[international].system = "urn:oid.2.16.152"  // OID Chile
* identifier[international].value = "CL/F12-1234123-2"

// Identificador Nacional (Cédula/RUT)
* identifier[national].system = "urn:oid.2.16.152"       // OID mismo país
* identifier[national].type = $v2-0203#TAX
* identifier[national].value = "CL/18922652-7"

// Datos Demográficos
* active = true
* name.use = #official
* name.text = "Sergio Penafiel"
* name.family = "Penafiel"
* name.given = "Sergio"
* gender = #male
* birthDate = "1994-10-13"
```

### Mapeo de Campos

| Campo FHIR | Uso en LAC | Ejemplo |
|------------|-----------|---------|
| `identifier[international]` | Documento de viaje (Passport) | Pasaporte Chileno |
| `identifier[national]` | Documento nacional | RUT/Cédula |
| `active` | Estado del paciente | true |
| `name` | Nombre completo | "Sergio Penafiel" |
| `gender` | Género biológico | male, female, other, unknown |
| `birthDate` | Fecha de nacimiento | YYYY-MM-DD |

### Consideraciones de Seguridad

⚠️ **Importante:** El identificador nacional (RUT, cédula, etc.) es información **altamente sensible**. Al compartir documentos que contienen este perfil:
- Considere anonimizar o enmascarar parcialmente
- Implemente controles de acceso robustos
- Asegure cumplimiento con leyes de protección de datos locales

### Relaciones

- **Utilizado en:** `LAC_Composition`, `LAC_Composition_DDCC`, `LAC_Bundle`, `LAC_Bundle_DDCC`
- **Referenciado por:** `LAC_Immunization`, Recursos clínicos

---

## Perfil LAC_Organization

### Identificación

| Propiedad | Valor |
|-----------|-------|
| **ID** | `lac-organization` |
| **URL Canónica** | `http://lacpass.racsel.org/StructureDefinition/lac-organization` |
| **Padre** | `Organization-uv-ips` |
| **Status** | active |

### Descripción

**LAC_Organization** extiende el perfil IPS para organizaciones de salud, enfatizando la **ubicación geográfica clara** mediante la identificación del país.

Esto es crucial en LAC para:
- Identificar la jurisdicción de salud responsable
- Cumplir con regulaciones nacionales
- Trazar trazabilidad de vacunaciones y documentos
- Identificar autoridades competentes

### Restricciones Principales

#### 1. **Dirección Obligatoria**

```
address
├─ Cardinalidad: 1..1  (obligatorio)
├─ Elementos requeridos:
│   ├─ country (obligatorio)
│   ├─ text (recomendado)
│   └─ Otros campos opcionales
└─ Binding: ValueSet "iso3166-1" (Códigos ISO 3166-1)
```

**Códigos de País Válidos (Ejemplos):**
- `CL` = Chile
- `AR` = Argentina
- `BR` = Brasil
- `CO` = Colombia
- `MX` = México
- `PE` = Perú

### Ejemplo: LACOrganizationExample

```fsh
Instance: LACOrganizationExample
InstanceOf: LAC_Organization
Usage: #example

* name = "Ministerio de Salud"
* address.text = "Enrique Mac Iver 541, Santiago, Región Metropolitana"
* address.country = "CL"  // Código ISO 3166-1
```

### Mapeo de Campos

| Campo FHIR | Uso en LAC | Descripción |
|------------|-----------|-------------|
| `name` | Nombre de la organización | "Ministerio de Salud", "Hospital Central" |
| `address.text` | Dirección completa | Descripción libre de ubicación |
| `address.country` | País (OBLIGATORIO) | Código ISO de 2 letras |
| `telecom` | Contacto | Teléfono, email (opcional) |
| `identifier` | ID de la organización | RUT institucional, código FONASA, etc. |

### Casos de Uso

#### 1. **Custodian de Composición**
```fsh
* custodian only Reference(LAC_Organization)
```
Identifica la organización responsable del resumen de paciente.

#### 2. **Performer en Immunization**
```fsh
* performer.actor only Reference(Practitioner or LAC_Organization)
```
Registra quién administró la vacunación.

#### 3. **Authority en Immunization.protocolApplied**
```fsh
* protocolApplied[protocolAppliedAuthority].authority only Reference(LAC_Organization)
```
Identifica la autoridad sanitaria que definió el protocolo.

### Relaciones

- **Utilizado en:** `LAC_Composition`, `LAC_Composition_DDCC`, `LAC_Immunization`
- **Referenciado por:** Recursos clínicos donde se requiere organización

---

## Perfil LAC_Immunization

### Identificación

| Propiedad | Valor |
|-----------|-------|
| **ID** | `lac-immunization` |
| **URL Canónica** | `http://lacpass.racsel.org/StructureDefinition/lac-immunization` |
| **Padre** | `Immunization-uv-ips` |
| **Status** | active |

### Descripción

**LAC_Immunization** es el perfil más complejo, diseñado para registrar **eventos de vacunación** con soporte para múltiples enfermedades (no solo COVID-19) y extensiones del estándar DDCC de la OMS.

Propósito:
- Registrar vacunaciones con datos clínicamente relevantes
- Soportar DDCC para certificados digitales
- Trazar lote, fabricante y fechas de validez
- Vincular con protocolos de inmunización nacionales

### Extensiones Requeridas

#### 1. **DDCCEventBrand** (Marca de Vacuna)

| Propiedad | Valor |
|-----------|-------|
| **Cardinalidad** | 1..1 MS (obligatoria) |
| **Tipo de Valor** | Coding |
| **Contexto** | Immunization, Observation |
| **Ejemplo** | `XM4YL8` (Moderna COVID-19) |

**Propósito:** Identificar la marca específica de vacuna administrada.

```fsh
* extension[vaccineBrand].url = "http://lacpass.racsel.org/StructureDefinition/DDCCEventBrand"
* extension[vaccineBrand].valueCoding = $ICD11#XM4YL8 "Moderna"
```

#### 2. **DDCCVaccineMarketAuthorization** (Autorización de Comercialización)

| Propiedad | Valor |
|-----------|-------|
| **Cardinalidad** | 0..1 MS (opcional pero informativo) |
| **Tipo de Valor** | Coding |
| **Propósito** | Identificar el titular de autorización de comercialización |

```fsh
* extension[vaccineMarketAuthorization].url = "http://lacpass.racsel.org/StructureDefinition/DDCCVaccineMarketAuthorization"
* extension[vaccineMarketAuthorization].valueCoding = $DDCC-Example-Test-CodeSystem#TEST
```

#### 3. **DDCCCountryOfEvent** (País del Evento)

| Propiedad | Valor |
|-----------|-------|
| **Cardinalidad** | 1..1 MS (obligatoria) |
| **Tipo de Valor** | code (ISO 3166-1 alpha-3) |
| **Binding** | `iso3166-1-3` (preferred) |

```fsh
* extension[country].url = "http://lacpass.racsel.org/StructureDefinition/DDCCCountryOfEvent"
* extension[country].valueCode = #CHL  // Chile
```

#### 4. **DDCCVaccineValidFrom** (Válida Desde)

| Propiedad | Valor |
|-----------|-------|
| **Cardinalidad** | 0..1 MS (opcional) |
| **Tipo de Valor** | date |
| **Propósito** | Fecha a partir de la cual la vacunación es válida |

```fsh
* extension[validFrom].url = "http://lacpass.racsel.org/StructureDefinition/DDCCVaccineValidFrom"
* extension[validFrom].valueDate = "2020-12-15"  // 14 días después de vacunación
```

### Restricciones Principales

#### 1. **Código de Vacuna**

```
vaccineCode
├─ Cardinalidad: 1..1 MS (obligatorio)
├─ Binding: DDCC_Vaccines (preferred)
├─ Estructura:
│   ├─ coding.system: 1..1 MS
│   ├─ coding.code: 1..1 MS
│   └─ Ejemplo: urn:iso:std:iso:20775:-1:2003:codSystem:icd11:mms / XM9QW8
└─ Válidos: DDCC_Vaccines ValueSet
```

**Ejemplos de Códigos de Vacuna:**
| Código | Sistema | Descripción |
|--------|--------|-------------|
| XM9QW8 | ICD11 MMS | COVID-19 vaccine, non-replicating viral vector |
| XM4YL8 | ICD11 MMS | Moderna COVID-19 |
| XM0GQ8 | ICD11 MMS | Pfizer-BioNTech COVID-19 |
| XM1NJ1 | ICD11 MMS | Janssen COVID-19 |

#### 2. **Ubicación (Administering Centre)**

```
location
├─ Cardinalidad: 1..1 MS (obligatoria)
├─ Tipo: Reference(Location)
├─ Elementos requeridos:
│   └─ display 1..1 MS (nombre del centro)
└─ Ejemplo: "Vacunatorio Hospital Central"
```

#### 3. **Ocurrencia (Fecha de Vacunación)**

```
occurrence[x]
├─ Cardinalidad: 1..1 MS (obligatorio)
├─ Tipo permitido: dateTime
├─ Formato: ISO 8601
└─ Ejemplo: "2020-11-15T14:30:00+00:00"
```

#### 4. **Protocolo Aplicado**

```
protocolApplied
├─ Cardinalidad: 1.. MS (uno o más)
├─ Slicing: por tipo de autoridad
├─ Elementos requeridos:
│   ├─ authority: Reference(LAC_Organization) 1..1 MS
│   ├─ targetDisease: code (DDCC_Disease_Targeted) 1..1 MS
│   ├─ doseNumber[x]: positiveInt 1..1 MS
│   ├─ seriesDoses[x]: positiveInt 0..1
│   └─ Ejemplo:
│       ├─ targetDisease: RA01 (COVID-19)
│       ├─ doseNumber: 1
│       └─ seriesDoses: 2 (total de dosis planeadas)
└─ Propósito: Vincular con autoridades sanitarias
```

### Ejemplo: LACImmunizationExample

```fsh
Instance: LACImmunizationExample
InstanceOf: LAC_Immunization
Usage: #example

// Identificación del recurso
* meta.profile = "http://lacpass.racsel.org/StructureDefinition/lac-immunization"

// Extensiones DDCC
* extension[vaccineBrand].url = "http://lacpass.racsel.org/StructureDefinition/DDCCEventBrand"
* extension[vaccineBrand].valueCoding = $ICD11#XM4YL8  // Moderna

* extension[vaccineMarketAuthorization].url = "http://lacpass.racsel.org/StructureDefinition/DDCCVaccineMarketAuthorization"
* extension[vaccineMarketAuthorization].valueCoding = $DDCC-Example-Test-CodeSystem#TEST

* extension[country].url = "http://lacpass.racsel.org/StructureDefinition/DDCCCountryOfEvent"
* extension[country].valueCode = #CL  // Chile

* extension[validFrom].url = "http://lacpass.racsel.org/StructureDefinition/DDCCVaccineValidFrom"
* extension[validFrom].valueDate = "2020-11-29"  // 14 días después

// Datos Clínicos
* status = #completed
* vaccineCode = $mms#XM9QW8 "COVID-19 vaccine, non-replicating viral vector"
* patient = Reference(LACPatientExample)
* occurrenceDateTime = "2020-11-15T14:30:00+00:00"
* location.display = "Vacunatorio Central"
* lotNumber = "A1234"

// Protocolo de Inmunización
* protocolApplied[protocolAppliedAuthority].authority = Reference(LACOrganizationExample)
* protocolApplied[protocolAppliedAuthority].targetDisease = $ICD11#RA01  // COVID-19
* protocolApplied[protocolAppliedAuthority].doseNumberPositiveInt = 1
* protocolApplied[protocolAppliedAuthority].seriesDosesPositiveInt = 2
```

### Desglose Línea por Línea

```
status = #completed
└─ Indica que la vacunación se completó correctamente

vaccineCode = $mms#XM9QW8 "COVID-19 vaccine, non-replicating viral vector"
└─ Código ICD-11 MMS para tipo de vacuna (vector viral no replicante)

patient = Reference(LACPatientExample)
└─ Referencia al paciente vacunado

occurrenceDateTime = "2020-11-15T14:30:00+00:00"
└─ Fecha y hora exacta de la administración

location.display = "Vacunatorio Central"
└─ Centro o sala donde se administró

lotNumber = "A1234"
└─ Número de lote para trazabilidad

protocolApplied[protocolAppliedAuthority].targetDisease = $ICD11#RA01
└─ Enfermedad contra la que protege: RA01 = COVID-19

protocolApplied[protocolAppliedAuthority].doseNumberPositiveInt = 1
└─ Número actual de dosis: primera dosis

protocolApplied[protocolAppliedAuthority].seriesDosesPositiveInt = 2
└─ Dosis totales planeadas en el protocolo: 2 dosis
```

### Casos de Uso

#### 1. **Certificado Digital de Vacunación**
Registrar vacunaciones para emitir certificados DDCC compatibles con normas OMS.

#### 2. **Historial de Inmunización**
Mantener registro histórico completo de all vacunaciones de un paciente.

#### 3. **Trazabilidad de Lotes**
Registrar lote específico para identificar rápidamente en caso de problemas de calidad.

### Relaciones

- **Utilizado en:** `LAC_Composition`, `LAC_Composition_DDCC`, `LAC_Bundle`, `LAC_Bundle_DDCC`
- **Referencia a:** `LAC_Patient`, `LAC_Organization`

---

## Perfil LAC_Composition

### Identificación

| Propiedad | Valor |
|-----------|-------|
| **ID** | `lac-composition` |
| **URL Canónica** | `http://lacpass.racsel.org/StructureDefinition/lac-composition` |
| **Padre** | `Composition-uv-ips` |
| **Status** | active |

### Descripción

**LAC_Composition** es el perfil para composiciones de **resumen clínico estándar** sin extensiones DDCC específicas.

Una Composición es un documento FHIR que actúa como **contenedor estructurado** de información clínica, similar a un PDF médico pero en formato legible por máquinas.

Propósitos:
- Crear documentos estructurados de resumen de paciente
- Oorganiza información clínica en secciones
- Punto de entrada en un Bundle de tipo document

### Restricciones Principales

```
subject
├─ Cardinalidad: 1..1 MS (obligatorio)
├─ Tipo: Reference(LAC_Patient)
└─ Propósito: Identificar el paciente del documento

custodian
├─ Cardinalidad: 1..1 (obligatorio)
├─ Tipo: Reference(LAC_Organization)
└─ Propósito: Organización responsable de mantener el documento
```

### Estructura Típica de Composición

```
Composition (LAC_Composition)
├─ status: #final | #preliminary | #amended | #entered-in-error
├─ type: LOINC#60591-5 "Patient Summary Document"
├─ subject: Reference(LAC_Patient)
├─ date: dateTime (cuando se creó)
├─ author: Reference(Practitioner | Organization) (quién lo escribió)
├─ title: string (ej: "Patient Summary as of 01/15/2023")
├─ confidentiality: #N | #R | #V
├─ custodian: Reference(LAC_Organization)
│
└─ section (múltiples, cada una con:)
    ├─ title: string (ej: "Active Problems", "Medications")
    ├─ code: LOINC (tipo de sección)
    ├─ text: Narrative (descripción legible)
    └─ entry: Reference[] (recursos clínicos relacionados)
```

### Ejemplo Conceptual

```fsh
Instance: LACCompositionExample
InstanceOf: LAC_Composition
Usage: #example

* status = #final
* type = $loinc#60591-5 "Patient Summary Document"
* subject = Reference(LACPatientExample)  // Sergio Penafiel
* date = "2023-01-15T17:26:43+00:00"
* author = Reference(LACOrganizationExample)
* title = "Patient Summary as of 01/15/2023"
* confidentiality = #N
* custodian = Reference(LACOrganizationExample)

// Sección de Problemas Activos
* section[sectionProblems].title = "Active Problems"
* section[sectionProblems].code = $loinc#11450-4 "Problem list Reported"
* section[sectionProblems].text.status = #generated
* section[sectionProblems].text.div = "<div>Hypertension (ICD10: I10)</div>"
* section[sectionProblems].entry = Reference(Condition/hypertension-example)

// Sección de Medicamentos
* section[sectionMedications].title = "Medication"
* section[sectionMedications].code = $loinc#10160-0 "History of Medication use Narrative"
* section[sectionMedications].text.status = #generated
* section[sectionMedications].text.div = "<div>Anastrozole 1mg daily</div>"
* section[sectionMedications].entry = Reference(MedicationStatement/anastrozole-example)
```

### Relaciones

- **Utilizado en:** `LAC_Bundle`
- **Referencia a:** `LAC_Patient`, `LAC_Organization`, Recursos clínicos
- **Complemento:** `LAC_Composition_DDCC` para soporte DDCC completo

---

## Perfil LAC_Composition_DDCC

### Identificación

| Propiedad | Valor |
|-----------|-------|
| **ID** | `lac-composition-ddcc` |
| **URL Canónica** | `http://lacpass.racsel.org/StructureDefinition/lac-composition-ddcc` |
| **Padre** | `Composition-uv-ips` |
| **Status** | active |

### Descripción

**LAC_Composition_DDCC** extiende `LAC_Composition` para incluir **secciones específicas requeridas por DDCC**, particularmente para certificados de vacunación digitales.

Diferencias con `LAC_Composition`:
- Soporta secciones DDCC específicas
- Enfoque en información de vacunación
- Compatible con estándares de certificados digitales OMS

### Estructura de Secciones DDCC

En un documento DDCC típico, se esperaría:

```
Composition (LAC_Composition_DDCC)
├─ section[sectionImmunizations]
│   ├─ title: "History of Immunizations"
│   ├─ code: $loinc#11369-6
│   ├─ entry: Reference(LAC_Immunization)
│   └─ (secciones específicas para cada vacuna)
│
├─ section[sectionProblems] (Opcional, comorbilidades)
│   └─ entry: Reference(Condition)
│
└─ section[sectionAllergies] (Recomendado)
    └─ entry: Reference(AllergyIntolerance)
```

### Ejemplo Conceptual

```fsh
Instance: LACCompositionDDCCExample
InstanceOf: LAC_Composition_DDCC
Usage: #example

* status = #final
* type = $loinc#60591-5 "Patient Summary Document"
* subject = Reference(LACPatientExample)
* date = "2023-01-15T17:26:43+00:00"
* author = Reference(LACOrganizationExample)
* title = "COVID-19 Vaccination Certificate as of 01/15/2023"
* confidentiality = #N
* custodian = Reference(LACOrganizationExample)

// Sección Principal: Inmunizaciones DDCC
* section[sectionImmunizations].title = "History of Immunizations"
* section[sectionImmunizations].code = $loinc#11369-6 "History of Immunization Narrative"
* section[sectionImmunizations].text.status = #generated
* section[sectionImmunizations].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>COVID-19 Vaccination completed</div>"
* section[sectionImmunizations].entry[immunization] = Reference(LACImmunizationExample)

// Sección Secundaria: Alergias (Recomendado)
* section[sectionAllergies].title = "Allergies and Intolerances"
* section[sectionAllergies].code = $loinc#48765-2 "Allergies and adverse reactions Document"
* section[sectionAllergies].text.status = #generated
* section[sectionAllergies].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>No known allergies</div>"
```

### Nota Importante: Estado Actual

⚠️ **Este perfil se encuentra parcialmente implementado**. Muchas restricciones y secciones están comentadas en el código. Consulte [ANALISIS_PROYECTO.md](../ANALISIS_PROYECTO.md#32-composición-ddcc-incompleta) para detalles de los problemas conocidos.

### Relaciones

- **Utilizado en:** `LAC_Bundle_DDCC`
- **Referencia a:** `LAC_Patient`, `LAC_Organization`, `LAC_Immunization`
- **Alternativa a:** `LAC_Composition` para casos DDCC

---

## Perfil LAC_Bundle

### Identificación

| Propiedad | Valor |
|-----------|-------|
| **ID** | `lac-bundle` |
| **URL Canónica** | `http://lacpass.racsel.org/StructureDefinition/lac-bundle` |
| **Padre** | `Bundle-uv-ips` |
| **Status** | active |

### Descripción

**LAC_Bundle** es el contenedor de **resumen de paciente en formato estándar IPS**. Un Bundle es una colección de recursos FHIR que se envían juntos como una unidad lógica.

Tipo de Bundle: `document`
- Similar a un documento PDF
- Contiene una Composición como primer elemento (obligatorio)
- Los demás elementos son recursos referenciados en la Composición

### Estructura

```
Bundle (LAC_Bundle, type: document)
│
├─ Entry 0: Composition (LAC_Composition)
│   └─ Actúa como "tabla de contenidos" del documento
│
├─ Entry 1..N: Recursos Clínicos
│   ├─ Patient (LAC_Patient)
│   ├─ Organization (LAC_Organization)
│   ├─ Condition
│   ├─ MedicationStatement
│   ├─ Immunization (LAC_Immunization)
│   ├─ AllergyIntolerance
│   └─ ... otros recursos necesarios
│
└─ Metadata
    ├─ identifier: UUID único del bundle
    ├─ timestamp: cuándo se creó
    └─ signature: (opcional) para firmar digitalmente
```

### Restricciones Principales

```
entry[composition]
├─ Cardinalidad: 1..1 MS (OBLIGATORIO EXACTAMENTE UNO)
├─ Posición: Debe ser el primer entry (entry[0])
├─ Tipo de recurso: LAC_Composition
└─ Propósito: Punto de entrada al documento
```

### Mapeo de Campos

| Campo | Valor | Propósito |
|-------|-------|----------|
| `type` | `document` | Indica que es un documento clínico |
| `identifier` | UUID (ej: `urn:uuid:f50a5146-...`) | ID único del documento |
| `timestamp` | ISO 8601 datetime | Cuándo se generó |
| `entry[0]` | LAC_Composition | Tabla de contenidos |
| `entry[1+]` | Otros recursos | Contenido del documento |

### Ejemplo Conceptual

```fsh
Instance: LACBundleExample
InstanceOf: LAC_Bundle
Usage: #example

* identifier.system = "urn:ietf:rfc:4122"
* identifier.value = "f50a5146-7d08-4f4d-b7a9-eb8a05d513a0"
* type = #document
* timestamp = "2023-01-15T17:26:43.023+00:00"

// ENTRY 0: Composición (REQUERIDA)
* entry[0].fullUrl = "urn:uuid:428e9bed-1f16-4595-91b9-80ae6ac12421"
* entry[0].resource = LACCompositionExample

// ENTRY 1: Paciente
* entry[+].fullUrl = "urn:uuid:ef333870-0a3a-4ab3-b0ff-6bc191a738c6"
* entry[=].resource = LACPatientExample

// ENTRY 2: Organización
* entry[+].fullUrl = "urn:uuid:9d5f17f6-6537-4bbb-a883-a5937a79d10c"
* entry[=].resource = LACOrganizationExample

// ENTRY 3: Situación Clínica (ejemplo)
* entry[+].fullUrl = "urn:uuid:73670837-417b-422f-9f99-46fb28d30985"
* entry[=].resource = Condition-example

// ... más entries según necesidad
```

### Relaciones

- **Contenedor de:** Todos los perfiles LAC
- **Inicio de:** Un resumen de paciente completo
- **Derivado de:** IPS Bundle-uv-ips

---

## Perfil LAC_Bundle_DDCC

### Identificación

| Propiedad | Valor |
|-----------|-------|
| **ID** | `lac-bundle-ddcc` |
| **URL Canónica** | `http://lacpass.racsel.org/StructureDefinition/lac-bundle-ddcc` |
| **Padre** | `Bundle-uv-ips` |
| **Status** | active |

### Descripción

**LAC_Bundle_DDCC** es el contenedor para **resúmenes de paciente con soporte DDCC completo**, incluyendo información de vaccination y certificados digitales.

Diferencia principal con `LAC_Bundle`:
- Requiere `LAC_Composition_DDCC` en lugar de `LAC_Composition`
- Optimizado para certificados de vacunación digitales
- Compatible con flujos de verificación DDCC

### Restricciones Principales

```
entry[composition]
├─ Cardinalidad: 1..1 MS (OBLIGATORIO EXACTAMENTE UNO)
├─ Tipo de recurso: LAC_Composition_DDCC (no LAC_Composition)
└─ Restricción más estricta que LAC_Bundle
```

### Estructura Típica DDCC

```
Bundle (LAC_Bundle_DDCC, type: document)
│
├─ Entry 0: Composition (LAC_Composition_DDCC)
│   └─ Sección principal: Inmunizaciones
│
├─ Entry 1: Patient (LAC_Patient)
│   └─ Con identificadores internacionales/nacionales
│
├─ Entry 2: Organization (LAC_Organization)
│   └─ Autoridad de salud responsable
│
├─ Entry 3..N: Immunization (LAC_Immunization)
│   ├─ Extensiones DDCC (Brand, MarketAuth, Country, ValidFrom)
│   └─ Protocolo vinculado a autoridad
│
└─ Metadata DDCC
    ├─ Timestamp
    └─ (Opcionalmente) Firma digital
```

### Ejemplo Actual: LACBundleIPSExample

⚠️ **NOTA:** El ejemplo actual tiene un error crítico - la Composición está comentada. Vea [ANALISIS_PROYECTO.md](../ANALISIS_PROYECTO.md#31-error-de-compilación-crítico).

Estructura prevista:
```fsh
Instance: LACBundleIPSExample
InstanceOf: LAC_Bundle_DDCC
Usage: #example

* identifier.system = "urn:ietf:rfc:4122"
* identifier.value = "f50a5146-7d08-4f4d-b7a9-eb8a05d513a0"
* type = #document
* timestamp = "2023-01-15T17:26:43.023+00:00"

// ENTRY 0: Composición DDCC (OBLIGATORIA, actualmente comentada)
* entry[0].fullUrl = "urn:uuid:428e9bed-1f16-4595-91b9-80ae6ac12421"
* entry[0].resource = LACCompositionDDCCExample  // ← DEBE DESCOMENTAR

// ENTRY 1: Paciente
* entry[+].fullUrl = "urn:uuid:ef333870-0a3a-4ab3-b0ff-6bc191a738c6"
* entry[=].resource = LACPatientExample

// ENTRY 2: Organización
* entry[+].fullUrl = "urn:uuid:9d5f17f6-6537-4bbb-a883-a5937a79d10c"
* entry[=].resource = LACOrganizationExample

// ENTRY 3: Inmunización DDCC
* entry[+].fullUrl = "urn:uuid:73670837-417b-422f-9f99-46fb28d30985"
* entry[=].resource = LACImmunizationExample

// ... más entries según DDCC
```

### Relaciones

- **Contenedor de:** Perfiles DDCC (LC_Composition_DDCC, LAC_Immunization)
- **Caso de uso:** Certificados digitales de vacunación
- **Alternativa a:** `LAC_Bundle` para escenarios DDCC

---

## Relaciones entre Perfiles

### Diagrama de Composición

```
┌─────────────────────────────────────────┐
│  BUNDLE (Contenedor)                    │
│  LAC_Bundle o LAC_Bundle_DDCC           │
│  ├─ type: document                      │
│  └─ uuid: identificador único           │
└────────────────┬────────────────────────┘
                 │
         ┌───────▼─────────┐
         │  COMPOSITION    │
         │  (Entry 0)      │
         │ ┌─────────────┐ │
         │ │ Paciente    │ │
         │ │ ────────    │ │
         │ │ LAC_Patient │ │
         │ └─────────────┘ │
         │                 │
         │ ┌─────────────┐ │
         │ │ Custodian   │ │
         │ │ ────────    │ │
         │ │ LAC_Org     │ │
         │ └─────────────┘ │
         │                 │
         │ ┌─────────────┐ │
         │ │ Secciones   │ │
         │ │ ────────    │ │
         │ │ Referencias │ │
         │ │ a recursos  │ │
         │ └─────────────┘ │
         └────────┬────────┘
                  │
        ┌─────────┼─────────┐
        │         │         │
    ┌───▼───┐ ┌──▼──┐ ┌───▼───┐
    │Patient│ │Immun│ │AllergyI│
    │ Resources│Entries│ │────────│
    │ ┌─────┐ │ LAC_ │
    │ │Other││Immun │
    │ │Cond ││ization│
    │ │────────│ ┌──────┐
    │ │Med  │   │ Ext ││
    │ │ ────│   │DDCC ││
    │ │Stmt │   └──────┘
    │ └─────┘
    └───────────┘
```

### Flujo de Referencias

```
LAC_Bundle_DDCC
└─ entry[0]: LAC_Composition_DDCC
   ├─ subject: Reference(LAC_Patient)
   │  └─ identifier[international]: PPN (Passport)
   │  └─ identifier[national]: RUT/Cédula
   │
   ├─ custodian: Reference(LAC_Organization)
   │  └─ address.country: ISO 3166
   │
   ├─ section[Immunization]
   │  └─ entry: Reference(LAC_Immunization)
   │     ├─ patient: Reference(LAC_Patient)
   │     ├─ location.display: Centro de vacunación
   │     └─ protocolApplied[authority]: Reference(LAC_Organization)
   │        └─ targetDisease: DDCC Disease Targeted
   │
   └─ section[Allergies]
      └─ entry: Reference(AllergyIntolerance)
```

### Casos de Uso Típicos

#### Caso 1: Resumen Clínico Estándar (IPS)
```
Flujo: Médico → Paciente
Bundle: LAC_Bundle
├─ Composition: LAC_Composition
├─ Sections: Problemas, Medicaciones, Alergias
└─ Propósito: Intercambio clínico general
```

#### Caso 2: Certificado Digital de Vacunación (DDCC)
```
Flujo: Centro de Salud → Paciente / Verificador
Bundle: LAC_Bundle_DDCC
├─ Composition: LAC_Composition_DDCC
├─ Immunization: LAC_Immunization (con extensiones DDCC)
└─ Propósito: Prueba de vacunación
```

#### Caso 3: Intercambio Regional LAC
```
Flujo: País 1 → País 2 (vía portal regional)
Bundle: LAC_Bundle o LAC_Bundle_DDCC
├─ Patient: Identificadores nacionales normalizados
├─ Organization: País identificado por ISO 3166
└─ Propósito: Interoperabilidad transnacional
```

---

## Tabla Resumen de Perfiles

| Perfil | Padre | Uso Principal | Ejemplos | Estado |
|--------|-------|-------|----------|--------|
| **LAC_Patient** | Patient-uv-ips | Identidad de paciente | LACPatientExample | ✅ Completo |
| **LAC_Organization** | Organization-uv-ips | Organ. de salud | LACOrgExample | ✅ Completo |
| **LAC_Immunization** | Immunization-uv-ips | Registro vacunación | LACImmunExample | ✅ Completo |
| **LAC_Composition** | Composition-uv-ips | Documento clínico | LACCompExample | ⚠️ Parcial |
| **LAC_Composition_DDCC** | Composition-uv-ips | Documento DDCC | Comentado | ⚠️ Incompleto |
| **LAC_Bundle** | Bundle-uv-ips | Contenedor estándar | No existe | ⚠️ Falta |
| **LAC_Bundle_DDCC** | Bundle-uv-ips | Contenedor DDCC | LACBundleExample | ⚠️ Errores |

---

## Referencias y Enlaces

- [FHIR R4 Patient Resource](http://hl7.org/fhir/R4/patient.html)
- [FHIR R4 Organization Resource](http://hl7.org/fhir/R4/organization.html)
- [FHIR R4 Immunization Resource](http://hl7.org/fhir/R4/immunization.html)
- [FHIR R4 Composition Resource](http://hl7.org/fhir/R4/composition.html)
- [FHIR R4 Bundle Resource](http://hl7.org/fhir/R4/bundle.html)
- [IPS International Patient Summary](https://build.fhir.org/ig/HL7/fhir-ips/)
- [DDCC Digital Documentation of COVID-19](https://worldhealthorganization.github.io/ddcc/)

---

**Última Actualización:** 26 de febrero de 2026

**Estado del Documento:** En revisión - Consulte [ANALISIS_PROYECTO.md](../ANALISIS_PROYECTO.md) para problemas conocidos
