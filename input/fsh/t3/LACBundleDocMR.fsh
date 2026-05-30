// ===========================================================================================
// Perfil para el Bundle que contiene la respuesta
// ===========================================================================================


Profile: LACBundleDocMR
Parent: Bundle
Title: ""
Description: "."

* type = #document (exactly)
* timestamp 1..1 MS // La fecha de creación es obligatoria


//------Entradas
* entry MS
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.description = "Corresponde a cada una de las entradas del Bundle-Document."
* entry ^slicing.rules = #closed
* entry.resource MS


* entry contains
    Composition 1..1 and
    Patient 1..1  
  
* entry[Composition] ^short = "Documento Consulta Externa"
* entry[Composition] ^definition = "Representa un documento de consulta externa del paciente."

* entry[Composition].resource 1..1
* entry[Composition].resource only LACCompositionMR

* entry[Patient] ^short = "Paciente"
* entry[Patient] ^definition = "Información del paciente"
* entry[Patient].resource 1..
* entry[Patient].resource only LACPatient



// Instance: comp-resp-simple
// InstanceOf: InterconsultaRespuestaComposition
// Usage: #inline

// * status = #final
// * type = http://loinc.org#11488-4 "Consultation note"
// * subject = Reference(PacienteEjemplo)
// * date = "2026-04-21T17:30:00-03:00"
// * author[0].display = "Dra. María García - Especialista Dermatología Panamá"
// * title = "Respuesta de Interconsulta Transfronteriza"
// * section[0].title = "Resultado de la Evaluación"
// * section[0].code = http://loinc.org#55112-7 "Document summary"
// * section[0].text.status = #generated
// * section[0].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Respuesta Clínica. Tras revisar los antecedentes enviados, se concluye que el paciente presenta una dermatitis por contacto. No se observan signos de malignidad.</p></div>"