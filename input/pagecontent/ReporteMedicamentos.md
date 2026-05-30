**Descripción:**

......

**Escenario:**

.....

**Perfiles y Proceso**

1️⃣. [Generación y Guardado de Reporte] 

> POST >> [BaseServidor] {(LACList , LACDocReferenceMR, LACBundleDocMR, LACPatient)}

- Perfil Completo MHD **LACBundleTransactionMHDMR** -: [LACBundleTransactionMHDMR](StructureDefinition-LACBundleTransactionMHDMR.html).

  - Perfil de **LAC List** -: [LAC List](StructureDefinition-LACList.html).
  - Perfil de **LACDocReference Reporte Medicamentos** -: [LACDocReferenceMR](StructureDefinition-LACDocReferenceMR.html).
  - Perfil de **LAC Bundle Document -MR-** -: [LACBundleDocMR](StructureDefinition-LACBundleDocMR.html).
  - Perfil de **LAC Patient** -: [LAC Patient](StructureDefinition-LACPatient.html).


📌 IMPORTANTE:
* La esctructura de bundle-doc contiene: 
  - El recurso de tipo **Composition** debe contener un solo recurso de tipo **MedicationStatement**
  - Perfil de **LAC CompositionMR** -: [LACCompositionMR](StructureDefinition-LACCompositionMR.html).
  - Perfil de **LAC MedicationStatement** -: [LACMedicationStatement](StructureDefinition-LACMedicationStatement.html).