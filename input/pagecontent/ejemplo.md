# Ejemplo: BundleTransactionMHDMinimalExample

## ✅ Descripción General

Ejemplo completo de una **Transacción ITI-65 MHD-Minimal** que implementa el perfil `LACBundleTransactionMHD`. 

**Caso de Uso:** Centro de Salud en Chile enviando resumen de paciente (International Patient Summary - IPS) con perfil MHD.

---

## 📋 Estructura del Ejemplo

### Bundle Transaction Principal (tipo #transaction)

```
BundleTransactionMHDMinimalExample
├── Entry[0]: SubmissionSet (List) 
│             └─ Metadatos del envío
├── Entry[1]: Bundle IPS 
│             └─ Documento completo del paciente
└── Entry[2]: Patient 
              └─ Datos demográficos para validación
```

### Bundle IPS Anidado (Documento)

```
IPSBundleMariaGonzalezExample (tipo #document)
├── Entry[0]: Composition IPS 
│             └─ Documento estructurado con secciones clínicas
├── Entry[1]: Patient 
│             └─ Datos demográficos del paciente
├── Entry[2]: Organization 
│             └─ Centro de Salud que origina el documento
├── Entry[3]: Condition 
│             └─ Hipertensión arterial esencial
├── Entry[4]: AllergyIntolerance 
│             └─ Alergia a Penicilina
├── Entry[5]: Immunization 
│             └─ Vacuna Influenza 2025
└── Entry[6]: MedicationStatement 
              └─ Medicamento en uso (Enalapril)
```

---

## 📊 Instancias FSH Definidas (Total: 10)

| # | Instancia | Tipo FHIR | Descripción |
|---|-----------|-----------|-------------|
| 1 | `BundleTransactionMHDMinimalExample` | Bundle | Bundle principal de transacción MHD |
| 2 | `SubmissionSetMariaGonzalezExample` | List | SubmissionSet con metadatos de envío |
| 3 | `IPSBundleMariaGonzalezExample` | Bundle | Bundle IPS documento completo |
| 4 | `CompositionMariaGonzalezExample` | Composition | Composición IPS con 4 secciones |
| 5 | `PatientMariaIPSExample` | Patient | Patient en el documento IPS |
| 6 | `PatientMariaGonzalezMHDExample` | Patient | Patient de validación en transacción |
| 7 | `OrganizationHealthCenterChileExample` | Organization | Centro de Salud |
| 8 | `ConditionHypertensionMariaExample` | Condition | Hipertensión arterial esencial |
| 9 | `AllergyPenicillinMariaExample` | AllergyIntolerance | Alergia a Penicilina |
| 10 | `ImmunizationInfluenzaMariaExample` | Immunization | Vacuna Influenza 2025 |

---

## 👤 Datos del Paciente

**Nombre:** María González Silva  
**Edad:** 57 años  
**Género:** Femenino  
**Fecha de Nacimiento:** 15 de marzo de 1967  
**País:** Chile  

### Identificadores

| Tipo | Valor | Sistema |
|------|-------|---------|
| **Internacional (PPN)** | E12345678 | `urn:oid.2.16.840.1.113883.4.330.4` |
| **Nacional (RUT Chile)** | 12765432-8 | `urn:oid.2.16.840.1.113883.3.239` |

### Contacto

- **Teléfono:** +56912345678 (móvil)
- **Email:** maria.gonzalez@example.com
- **Dirección:** Calle Los Andes 456, Santiago, Chile

---

## 🏥 Centro de Salud

**Nombre:** Centro de Salud Familiar La Florida  
**Tipo:** Healthcare Provider  
**Teléfono:** +56222222222  
**Ubicación:** Av. Concha y Toro 1500, Santiago, Chile

---

## 📋 Datos Clínicos

### Condiciones (Diagnósticos)

- **Hipertensión Arterial Esencial**
  - Código SNOMED: 59621000
  - Estado: Activo, confirmado
  - Desde: 15 de enero de 2020
  - Nota: Control farmacológico con antihipertensivos

### Alergias e Intolerancias

- **Alergia a Penicilina**
  - Tipo: Alergia medicamentosa
  - Manifestación: Urticaria (reacción cutánea)
  - Severidad: Leve
  - Desde: 10 de junio de 2005
  - Nota: Evitar beta-lactámicos

### Inmunizaciones

- **Vacuna contra Influenza 2025**
  - Código SNOMED: 28581000
  - Fecha: 15 de marzo de 2025
  - Lote: INF-2025-S-00123
  - Administrador: Centro de Salud Familiar La Florida
  - Estado: Completada sin incidentes

### Medicamentos en Uso

- **Enalapril 10mg**
  - Forma: Tabletas orales
  - Dosis: 10 mg una vez por la mañana
  - Frecuencia: Diaria
  - Indicación: Control de hipertensión arterial
  - Desde: 15 de enero de 2020

---

## 📄 Estructura de la Composición IPS

La Composición IPS incluye **4 secciones obligatorias:**

### 1. Sección: Immunizations (Inmunizaciones)
- **LOINC Code:** 11369-6
- **Contenido:** Registro de vacuna contra Influenza 2025
- **Referencia:** ImmunizationInfluenzaMariaExample

### 2. Sección: Problem List (Lista de Problemas)
- **LOINC Code:** 11450-4
- **Contenido:** Diagnóstico de hipertensión arterial esencial
- **Referencia:** ConditionHypertensionMariaExample

### 3. Sección: Allergies and Intolerances (Alergias e Intolerancias)
- **LOINC Code:** 48765-2
- **Contenido:** Alergia documentada a Penicilina
- **Referencia:** AllergyPenicillinMariaExample

### 4. Sección: Medications (Medicamentos)
- **LOINC Code:** 10160-0
- **Contenido:** Medicamento en uso (Enalapril)
- **Referencia:** MedicationStatementEnalaprilMariaExample

---

## ✨ Características Destacadas

### Conformidad con Perfiles

- ✅ **LACBundleTransactionMHD** - Perfil principal de transacción MHD
- ✅ **LACBundleIPS** - Perfil de Bundle IPS personalizado
- ✅ **LACPatient** - Perfil de paciente LAC con identificadores internacionales y nacionales
- ✅ **LACCompositionIPS** - Composición IPS personalizada para LAC

### Validación

- ✅ Compilación exitosa con SUSHI v3.18.1 (0 errores, 0 advertencias)
- ✅ Todas las cardinalidades respetadas
- ✅ Invariantes de paciente cumplidas:
  - `lac-pat-1`: Solo 1 identificador official
  - `lac-pat-2`: Sistema de identificador comienza con `urn:oid.2.16.`

### Completitud

- ✅ Identificadores internacionales y nacionales
- ✅ Datos demográficos completos (nombre, género, fecha de nacimiento)
- ✅ Información de contacto (teléfono, email)
- ✅ Dirección con detalles (calle, ciudad, código postal, país)
- ✅ Datos clínicos realistas y coherentes
- ✅ Referencias cruzadas consistentes entre recursos

---

## 📁 Ubicación del Archivo

```
d:\24.IG_RACSEL\input\fsh\ejemplos\BundleTransactionMHDMinimalExample.fsh
```

**Tamaño:** 15.6 KB  
**Instancias:** 10  
**Instancias inline:** 9  
**Instancias example:** 1  

---

## 🔗 Referencias Relacionadas

- **Especificación MHD (Medical Document Handling):** IHE ITI-65 Minimal Provide Document Bundle
- **Especificación IPS:** [International Patient Summary HL7 FHIR](https://build.fhir.org/ig/HL7/fhir-ips/)
- **FHIR Version:** R4 (4.0.1)
- **Estándar LACPASS:** Implementation Guide para Latinoamérica

---

## 💡 Notas Importantes

1. **SubmissionSet (List):** Es un recurso obligatorio en el Bundle Transaction MHD que contiene metadatos sobre el envío del documento.

2. **Bundle Anidado:** El Bundle IPS se incluye como recurso dentro del Bundle Transaction, creando una estructura jerárquica.

3. **Patient Duplicado:** La presencia de dos recursos Patient es intencional para validar concordancia entre el Patient del documento y el Patient de transacción en protocolos MHD.

4. **UUIDs Standard:** Todas las referencias fullUrl usan identificadores UUID siguiendo el estándar FHIR (`urn:uuid:...`).

5. **Identificadores de País:** Los sistemas OID utilizan prefijos de país:
   - `urn:oid.2.16.840.1.113883.4.330.4` para identificadores internacionales
   - `urn:oid.2.16.840.1.113883.3.239` para identificadores chilenos

---

## 📖 Cómo Usar Este Ejemplo

Este ejemplo puede ser utilizado como:

1. **Referencia de Implementación:** Para entender cómo estructurar transacciones MHD con documentos IPS
2. **Plantilla:** Como base para crear nuevos ejemplos de transacciones
3. **Validación:** Para pruebas de conformidad con perfiles LAC
4. **Documentación:** Como ejemplo para la specification del IG

---

*Ejemplo creado: 4 de abril de 2026*  
*Última compilación exitosa con SUSHI v3.18.1*
