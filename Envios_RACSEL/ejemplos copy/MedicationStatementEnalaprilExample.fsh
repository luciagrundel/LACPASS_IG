// Medicamento Statement - Uso de Enalapril
Instance: MedicationStatementEnalaprilExample
InstanceOf: MedicationStatement
Usage: #inline
Description: "Registro del uso actual de medicamento antihipertensivo"

* status = #active

* medicationReference = Reference(MedicationAntihypertensiveExample)

* subject = Reference(PatientYellowFeverExample)

* effectiveDateTime = "2025-03-10T09:30:00Z"

* dosage.timing.repeat.frequency = 1
* dosage.timing.repeat.period = 1
* dosage.timing.repeat.periodUnit = #d

* dosage.route.coding.system = "http://snomed.info/sct"
* dosage.route.coding.code = #26643006
* dosage.route.coding.display = "Oral route"

* dosage.doseAndRate.doseQuantity.value = 10
* dosage.doseAndRate.doseQuantity.unit = "mg"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg

* note.text = "Tomar una dosis diaria de 10 mg de Enalapril para control de presión arterial"
