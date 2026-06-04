**Descripción:**
El propósito es validar la portabilidad de información de medicamentos de una persona,  a partir de un reporte histórico de estos.  Si bien las farmacias podrán leer esta lista de medicamentos, que pueda ser presentada en un país distinto,  se encuentran pendientes los procesos de dispensación y administración de los mismos. 


**Escenario:**
El proceso inicia a partir de un tipo de reporte de medicamentos el cual forma parte de la historia de una persona.  A partir de este reporte, y utilizando su APP, la persona puede seleccionar la información de los medicamentos que decide portar para un viaje trasfronterizo, generando un QR valido con esta información.  Cuando la persona viaja, a otro país puede presentar este QR y la farmacia va a interpretar la lista de medicamentos seleccionados que forman parte de su historia.


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