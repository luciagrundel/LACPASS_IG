// ===========================================================================================
// Perfil para el Bundle que contiene la respuesta
// ===========================================================================================


Profile: LACBundleDocIT
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
* entry[Composition].resource only LACCompositionIT

* entry[Patient] ^short = "Paciente"
* entry[Patient] ^definition = "Información del paciente"
* entry[Patient].resource 1..
* entry[Patient].resource only LACPatient


