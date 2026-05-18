
// ===========================================================================================
// Perfil para el Documento de Respuesta de Interconsulta
// ===========================================================================================


Profile: LACCompositionIT
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


// Slicing de la sección principal
* section ^slicing.discriminator[0].type = #pattern
* section ^slicing.discriminator[=].path = "code"
* section ^slicing.ordered = false
* section ^slicing.rules = #open

* section contains
    ResultadoEvaluacion 1..1 MS


* section[ResultadoEvaluacion].code = $loinc#55112-7 "Document summary"
* section[ResultadoEvaluacion].title = "Resultado de la Evaluación"
* section[ResultadoEvaluacion].text 1..1

// AGREGAR UNA SECCION : 

  /*      "section": [
          {
            "title": "Resultado de la Evaluación",
            "code": {
              "coding": [
                {
                  "system": "http://loinc.org",
                  "code": "55112-7",
                  "display": "Document summary"
                }
              ]
            },
            "text": {
              "status": "generated",
              "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h3>Respuesta Clínica</h3><p>Tras revisar los antecedentes enviados en el Bundle/2313, se concluye que el paciente presenta una dermatitis por contacto. No se observan signos de malignidad. Se recomienda tratamiento tópico.</p></div>"
            }
          }
        ] */


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
