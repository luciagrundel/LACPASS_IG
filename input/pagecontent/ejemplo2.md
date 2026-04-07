
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
│                └─ Referencia a DocumentReference
├── Entry[1]: DocumentReference
│             └─ Metadatos del documento IPS
│                └─ Referencia al Bundle (content)
├── Entry[2]: Bundle IPS 
│             └─ Documento completo del paciente
└── Entry[3]: Patient 
              └─ Datos demográficos para validación
```

**Arquitectura MHD:**
- **1 (SubmissionSet):** SubmissionSet (List) - agrupa los DocumentReferences
- **2 (Document Metadata):** DocumentReference - metadatos clínicos/administrativos del documento
- **3 (Document Content):** Bundle IPS - contenido real del documento
- **4 (Subject):** Patient - datos demográficos para validación

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

## 📊 Instancias FSH Definidas (Total: 11)

| # | Instancia | Tipo FHIR | Descripción |
|---|-----------|-----------|-------------|
| 1 | `BundleTransactionMHDMinimalExample` | Bundle | Bundle principal de transacción MHD |
| 2 | `SubmissionSetMariaGonzalezExample` | List | SubmissionSet con metadatos de envío |
| 3 | `DocumentReferenceMariaGonzalezExample` | DocumentReference | Referencia al documento IPS con metadatos |
| 4 | `IPSBundleMariaGonzalezExample` | Bundle | Bundle IPS documento completo |
| 5 | `CompositionMariaGonzalezExample` | Composition | Composición IPS con 4 secciones |
| 6 | `PatientMariaIPSExample` | Patient | Patient en el documento IPS |
| 7 | `PatientMariaGonzalezMHDExample` | Patient | Patient de validación en transacción |
| 8 | `OrganizationHealthCenterChileExample` | Organization | Centro de Salud |
| 9 | `ConditionHypertensionMariaExample` | Condition | Hipertensión arterial esencial |
| 10 | `AllergyPenicillinMariaExample` | AllergyIntolerance | Alergia a Penicilina |
| 11 | `ImmunizationInfluenzaMariaExample` | Immunization | Vacuna Influenza 2025 |

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


## 💡 Notas Importantes

1. **DocumentReference:** Contiene los metadatos clínicos y administrativos del documento IPS (creador, tipo, fecha, descripción) y referencia al Bundle que contiene el documento real.

2. **SubmissionSet (List):** Es un recurso obligatorio en el Bundle Transaction MHD que contiene metadatos sobre el envío del documento. Referencia a los DocumentReferences incluidos en la transacción.

3. **Arquitectura en Capas:** La estructura MHD sigue un diseño jerárquico con capas de metadatos (SubmissionSet → DocumentReference → Bundle) que permite diferentes niveles de estándares y seguridad.

4. **Bundle Anidado:** El Bundle IPS se incluye como recurso dentro del Bundle Transaction, encapsulando el documento completo con su composición y recursos clínicos.

5. **Patient Duplicado:** La presencia de dos recursos Patient es intencional:
   - En el Bundle IPS: parte del documento
   - En el Bundle Transaction: para validación de concordancia

6. **UUIDs Standard:** Todas las referencias fullUrl usan identificadores UUID siguiendo el estándar FHIR (`urn:uuid:...`).


---

Descarga el ejemplo completo en formato JSON: [BundleTransactionMHDMinimalExample.json (Bundle-BundleTransactionMHDMinimalExample.json)](BundleTransactionMHDMinimalExample.json)
