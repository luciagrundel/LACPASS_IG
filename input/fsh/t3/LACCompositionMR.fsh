
// ===========================================================================================
// Perfil para el Documento de Respuesta de Interconsulta
// ===========================================================================================


Profile: LACCompositionMR
Parent: Composition
Title: "Perfil de Composition para Respuesta de Interconsulta"
Description: "Este perfil define la estructura del documento clínico enviado como respuesta a una interconsulta transfronteriza."

* status = #final
* type = http://loinc.org#56445-0 "Medication summary"

* subject 1..1 MS
* subject only Reference(LACPatient)

* date MS
* author 1..* MS
* title MS

* section 1..* MS
* section.title 1..1 MS
* section.code 1..1 MS
* section.text 1..1 MS


// Slicing de la sección principal
* section ^slicing.discriminator[0].type = #pattern
* section ^slicing.discriminator[=].path = "code"
* section ^slicing.ordered = false
* section ^slicing.rules = #open

* section contains
    Medicamentos 1..1 MS


* section[Medicamentos].code = $loinc#55112-7 "Document summary"
* section[Medicamentos].title = "Medicamentos"
* section[Medicamentos].text 1..1

// AGREGAR UNA SECCION : 


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

