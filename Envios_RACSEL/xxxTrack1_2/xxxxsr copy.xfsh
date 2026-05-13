
// ===========================================================================================
// PERFILES PARA LA SOLICITUD DE INTERCONSULTA Transfronteriza ServiceRequest
// ===========================================================================================

Profile: LACInterconsultaServiceRequest
Parent: ServiceRequest
Title: "Perfil de ServiceRequest para Interconsulta Transfronteriza"
Description: "Perfil del recurso ServiceRequest adaptado para el flujo de derivaciones entre Uruguay y Panamá, integrando referencias a IPS."

// Restricciones de cardinalidad y Must Support
* identifier 1..* MS
* identifier ^short = "Identificador de la solicitud (Ej: UY-PA-2026-998877)"

* status MS
* intent = #order

* category 1..1 MS
* category.text 1..1 MS

* code 1..1 MS
* code.text 1..1 MS

* subject 1..1 MS
* subject only Reference(LACPatient)

* requester 1..1 MS
* requester only Reference(LACOrganization)
* requester ^short = "Pais-Organización que solicita la interconsulta"

* performer 1..1 MS
* performer only Reference(LACOrganization)
* performer ^short = "Pais-Organización que realiza la interconsulta"

* reasonCode MS
* reasonCode.text MS
* reasonCode.text 1..1
* reasonCode ^short = "Motivo de la interconsulta (Ej: Evaluación de lesión sospechosa)"

* supportingInfo MS
* supportingInfo only Reference(LACBundleIPS)
* supportingInfo ^short = "Referencia al IPS que respalda la solicitud"

* note MS   
* note.text 1..1 MS
* note ^short = "Notas adicionales para la interconsulta"

// =========================================================
// Ejemplo de instancia para el caso Uruguay -> Panamá
// =========================================================
Instance: EjemploServiceRequestUY-PA
InstanceOf: LACInterconsultaServiceRequest
Usage: #example
Title: "Ejemplo de ServiceRequest: Derivación de Uruguay a Panamá"
Description: "Instancia de ejemplo que representa una solicitud de interconsulta en dermatología."

* identifier[0].system = "https://salud.gub.uy/interconsultas"
* identifier[0].value = "UY-PA-2026-998877"
* identifier[0].use = #official

* status = #active
* intent = #order

* category.coding = http://snomed.info/sct#103696004 "Patient referral to specialist"
* category.text = "Derivación a especialista"

* code.coding = http://snomed.info/sct#308430006 "Dermatology"
* code.text = "Dermatología"

* subject.reference = "http://MPI/fhir/Patient/525"
* subject.display = "Juan Pérez"

* authoredOn = "2026-05-03T10:00:00-03:00"

* requester = Reference(HospitalUY)
* requester.display = "Hospital de Clínicas (Uruguay)"

* performer = Reference(MinisterioPanama)
* performer.display = "Ministerio de Salud - Panamá"

* reasonCode.text = "Evaluación de lesión pigmentada en piel (posible melanoma)"

* supportingInfo[0].reference = "http://servidor_pais/fhir/Bundle/21"
* supportingInfo[0].display = "International Patient Summary (IPS) - Uruguay"

* note.text = "Se solicita evaluación especializada por evolución tórpida de lesión en flanco izquierdo."



// =========================================================
// Recursos de apoyo para que el ejemplo sea válido en Sushi
// =========================================================

Instance: PacienteEjemplo
InstanceOf: Patient
Usage: #example
* name.family = "Pérez"
* name.given = "Juan"

Instance: HospitalUY
InstanceOf: Organization
Usage: #example
* name = "Hospital de Clínicas (Uruguay)"

Instance: MinisterioPanama
InstanceOf: Organization
Usage: #example
* name = "Ministerio de Salud - Panamá"
