// Condición/Enfermedad - Hipertensión arterial
Instance: ConditionHypertensionExample
InstanceOf: Condition
Usage: #inline
Description: "Diagnóstico de hipertensión arterial en paciente vacunada"

* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* clinicalStatus.coding.code = #active
* clinicalStatus.coding.display = "Active"

* verificationStatus.coding.system = "http://terminology.hl7.org/CodeSystem/condition-ver-status"
* verificationStatus.coding.code = #confirmed
* verificationStatus.coding.display = "Confirmed"

* category.coding.system = "http://terminology.hl7.org/CodeSystem/condition-category"
* category.coding.code = #problem-list-item
* category.coding.display = "Problem List Item"

* code.coding.system = "http://snomed.info/sct"
* code.coding.code = #38341003
* code.coding.display = "Hypertension"

* subject = Reference(PatientYellowFeverExample)
* onsetDateTime = "2018-01-01T00:00:00Z"
* recordedDate = "2025-01-20T10:00:00Z"


