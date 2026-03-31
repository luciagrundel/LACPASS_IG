// Vacuna de fiebre amarilla administrada
Instance: ImmunizationYellowFeverExample
InstanceOf: Immunization
Usage: #example
Description: "Registro de administración de vacuna contra fiebre amarilla"

* status = #completed
* vaccineCode.coding.system = "http://snomed.info/sct"
* vaccineCode.coding.code = #81223
* vaccineCode.coding.display = "Yellow fever vaccine"
* patient = Reference(PatientYellowFeverExample)
* occurrenceDateTime = "2025-03-15"
* primarySource = true
* location.display = "Centro de Salud Regional Quito"
* performer.actor = Reference(OrganizationHealthCenterExample)
* doseQuantity.value = 1
* doseQuantity.unit = "mL"
* doseQuantity.system = "http://unitsofmeasure.org"
* doseQuantity.code = #mL
* route.coding.system = "http://snomed.info/sct"
* route.coding.code = #34206005
* route.coding.display = "Subcutaneous route"
* note.text = "Dosis única de vacuna de fiebre amarilla para viajero internacional"
