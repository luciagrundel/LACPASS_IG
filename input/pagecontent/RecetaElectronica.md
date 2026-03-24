### **Introducción**

En esta página, se documenta todos los recursos involucrados para representar la información de un consulta ambulatoria de un paciente.

---

### **Perfiles**

1️⃣ Perfil de **Bundle Document** Document de RDA Consulta Externa:  
[Bundle Document Consulta Externa](StructureDefinition-BundleDOCConsultaExterna.html).

2️⃣ Perfil de **Composition** Documento de RDA Consulta Externa: [Composition Consulta Externa](StructureDefinition-CompositionConsultaExternaCo.html).

---

### **Detalle de Secciones:**

En este apartado se describen las diferentes secciones incluidas en el documento **Compostion** para poder representar tanto de antecedendentes del paciente, asi como detalles de la atención:

1️⃣ Seccion que contiene todos los antecedentes de salud del paciente:

| **Entrada** | **Link** | **Descripción** |
| --- | --- | --- |
| ✅ **Antecedentes Diagnósiticos** | [Condition Co](StructureDefinition-Conditionco.html) | Representa los antecedentedes diagnósticos del paciente. |
| ✅ **Medicación Actual** | [Medication Statement](StructureDefinition-MedicationStatementCo.html). | Representa la información de la medicación actual que toma el paciente. |
| ✅ **Alergias Conocidas** | [Alergias](StructureDefinition-AlergiaCo.html). | Representa las alergias que tiene el paciente. |
| ✅ **Antecedentes Familiares** | [Antecedentes Familiares](StructureDefinition-AntecedentesFamiliaresCo.html) | Representa los antecedentes familiares. |
| ✅ **Riesgos** | [Riesgos](StructureDefinition-ObservationCoRiesgo.html) | Representa los riesgos de salud del paciente. |

---

2️⃣ Seccion que contiene información especpifica de la atención:

| **Entrada** | **Link** | **Descripción** |
| --- | --- | --- |
| **✅Consulta Externa** | [Encounter -Consulta Externa-](StructureDefinition-EncounterAmbulatorioCo.html) | Representa toda la informacion de la atención. |
| **✅ Diagnóstico Principal** | [Condition Co](StructureDefinition-ConditioncoPrincipal.html). | Representa el diagnóstico princial de la atención, los demas diagnósticos, se encuentran en Encounter. |

---

3️⃣ Sección con detalle de las órdenes realizadas durante la atención:

| **Entrada** | **Link** | **Descripción** |
| --- | --- | --- |
| ✅ **Medicamentos Ordenados** | [Medication Request Co](StructureDefinition-MedicationRequestCo.html). | Solicitudes de medicamentos indicados por el profesional de salud. |
| ✅ **Procedimientos Indicados** | [Service Request ProcedureCo](StructureDefinition-ServiceRequestProcedureCo.html) | Requerimientos de procedimientos médicos específicos. |
| ✅ **Otras solicitudes Indicadas** | [Service Request Co](StructureDefinition-ServiceRequestCo.html) | Otras solicitudes clínicas como estudios o interconsultas. |

---

4️⃣ Otras Secciones:

| **Entrada** | **Link** | **Descripción** |
| --- | --- | --- |
| ✅ **Doc Ref PDF** | [DocumentoPDF](StructureDefinition-DocumentReferencePDF.html) | Incluir documento PDF leible (capa de texto) sin clave del documento pdf de la epicrisis de atención por Consulta Exteran. La epicrisis debe cumplir con los contenidos establecidos en el Decreto 780 de 2016 Artículo 2.6.1.4.3.5 |
| ✅**Datos Incapacidad** | [Observation Incapacidad](StructureDefinition-ObservationCoIncapacidad.html) | Representa la información asociada a la incapacidad de la persona. |

---

---

### **Documento de Referencia**

✅ Archivo Referencia: [RDA\_Consulta\_Externa.xlsx](RDA_Consulta_Externa.xlsx)

✅ Diagrama de Estructura de Documento RDA Consulta Externa: [Ambulatorio.png](ambulatorio.png)