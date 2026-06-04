**Descripción:**


**Perfiles y Proceso**

1️⃣. [Generación y Guardado de Reporte] 

> POST >> [BaseServidor] {(LACList , LACDocReferenceMeOw, LACBundleDocMeOw, LACPatient)}

- Perfil Completo MHD **LACBundleTransactionMHDMeOw** -: [LACBundleTransactionMHDMeOw](StructureDefinition-LACBundleTransactionMHDMeOw.html).

  - Perfil de **LAC List** -: [LAC List](StructureDefinition-LACList.html).
  - Perfil de **LACDocReference Reporte Medicamentos** -: [LACDocReferenceMeOw](StructureDefinition-LACDocReferenceMeOw.html).
  - Perfil de **LAC Bundle Document -MeOw-** -: [LACBundleDocMeOw](StructureDefinition-LACBundleDocMeOw.html).
  - Perfil de **LAC Patient** -: [LAC Patient](StructureDefinition-LACPatient.html).


📌 IMPORTANTE:
* La esctructura de bundle-doc contiene: 
  - El recurso de tipo **Composition** debe contener un solo recurso de tipo **MedicationStatement**
  - Perfil de **LAC CompositionMeOw** -: [LACCompositionMeOw](StructureDefinition-LACCompositionMeOw.html).
  - Perfil de **LAC MedicationStatementMeOw** -: [LACMedicationStatementMeOw](StructureDefinition-LACMedicationStatementMeOw.html).