// =========================================================
// PERFILES PARA TRANSACCIÓN DE RESPUESTA (MHD)
// =========================================================

Profile: LACDocReferenceMR
Parent: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference

//Parent: DocumentReference
Title: "DocumentReference para Contra-referencia"
Description: "Metadatos para el registro y envío de la respuesta de interconsulta."

* status = #current
* docStatus = #final
* type = http://loinc.org#56445-0 "Medication summary"
// "code": "56445-0",
   //           "display": "Medication summary"

* subject only Reference(LACPatient)
* subject 1..1 MS

* date MS
* author 1..* MS
* content.attachment.contentType = #application/fhir+json
* context.related MS
* context.related ^short = "Referencia a la solicitud original (Traza) y al IPS de soporte"

// // =========================================================
// // INSTANCIA DE TRANSACCIÓN (EJEMPLO COMPLETO)
// // =========================================================

// Instance: EjemploLACDocReferenceIT
// InstanceOf: LACDocReferenceIT
// Usage: #example
// Title: "Transacción de Respuesta de Interconsulta (MHD)"
// Description: "Bundle de tipo transaction que incluye el DocumentReference y el Bundle de respuesta clínica."

// * type = #transaction

// // Entrada 1: DocumentReference
// * entry[0].fullUrl = "urn:uuid:documentreference-001"
// * entry[0].resource = docref-ejemplo
// * entry[0].request.method = #POST
// * entry[0].request.url = "DocumentReference"

// // Entrada 2: Bundle Documento (Contenido)
// * entry[1].fullUrl = "urn:uuid:bundle-documento-respuesta"
// * entry[1].resource = EjemploBundleRespuestaPA-UY // Referencia al ejemplo anterior
// * entry[1].request.method = #POST
// * entry[1].request.url = "Bundle"

// // Definición interna del DocumentReference para el ejemplo
// Instance: docref-ejemplo
// InstanceOf: InterconsultaDocumentReference
// Usage: #inline
// * status = #current
// * docStatus = #final
// * type = http://loinc.org#57133-1 "Referral note"
// * type.text = "Contra-referencia de Especialidad"
// * subject = Reference(PacienteEjemplo)
// * date = "2026-04-21T17:35:00-03:00"
// * author[0].display = "Especialista Consultor - Panamá"
// * description = "Respuesta a interconsulta - Caso Dermatología"

// * content[0].attachment.contentType = #application/fhir+json
// * content[0].attachment.url = "urn:uuid:bundle-documento-respuesta"

// * context.related[0].identifier.system = "https://salud.gub.uy/interconsultas"
// * context.related[0].identifier.value = "UY-PA-2026-998877"
// * context.related[0].display = "Referencia a Solicitud Original (Traza)"

// * context.related[1].reference = "http://NODO_pais_origen/Bundle/2313"
// * context.related[1].display = "IPS original utilizado para la evaluación" 