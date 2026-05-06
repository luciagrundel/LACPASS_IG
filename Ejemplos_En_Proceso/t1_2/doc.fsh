// ===========================================================================================
// Perfil para el Bundle que contiene la respuesta
// ===========================================================================================


Profile: LACBundleInterconsultaRespuesta
Parent: Bundle
Title: "Bundle de Respuesta de Interconsulta"
Description: "Bundle tipo Document que contiene la Composition de respuesta y los recursos relacionados."

* type = #document (exactly)
* timestamp 1..1 MS

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
* entry[Composition].resource only LACBundleInterconsultaRespuesta

* entry[Patient] ^short = "Paciente"
* entry[Patient] ^definition = "Información del paciente"
* entry[Patient].resource 1..
* entry[Patient].resource only LACPatient





// ===========================================================================================
// Perfil para el Documento de Respuesta de Interconsulta
// ===========================================================================================

Profile: LACInterconsultaRespuestaComposition
Parent: Composition
Title: "Perfil de Composition para Respuesta de Interconsulta"
Description: "Este perfil define la estructura del documento clínico enviado como respuesta a una interconsulta transfronteriza."

* status = #final
* type = http://loinc.org#11488-4 "Consultation note"

* subject 1..1 MS
* subject only Reference(Patient)

* date MS

* author 1..* MS

* title MS


* section 1..* MS
* section.title 1..1 MS
* section.code 1..1 MS
* section.text 1..1 MS






// ===========================================================================================
// Ejemplos - instance 
// ===========================================================================================

// // Instancia de Ejemplo de Respuesta (Panamá -> Uruguay)
// Instance: EjemploBundleRespuestaPA-UY
// InstanceOf: InterconsultaRespuestaBundle
// Usage: #example
// Title: "Ejemplo de Bundle de Respuesta desde Panamá"

// * timestamp = "2026-04-21T17:30:00-03:00"
// * entry[0].fullUrl = "http://ejemplo.org/Composition/comp-resp-simple"
// * entry[0].resource = comp-resp-simple


// ===========================================================================================
// Ejemplos - instance 
// ===========================================================================================

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