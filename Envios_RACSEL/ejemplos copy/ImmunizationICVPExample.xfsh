// Inmunización 1: Vacuna contra Fiebre Amarilla
// Administrada el 10/02/2024 en Centro de Salud Internacional Lima
// Dosis: 0.5 mL IM

Instance: ImmunizationYellowFeverICVPExample
InstanceOf: Immunization
Usage: #example
Description: "Vacuna contra Fiebre Amarilla administrada en Centro de Salud Internacional - Certificado ICVP"

* status = #completed
* vaccineCode.coding.system = "http://snomed.info/sct"
* vaccineCode.coding.code = #398589009
* vaccineCode.coding.display = "Yellow Fever vaccine"
* patient = Reference(PatientICVPVaccinationExample)
* occurrenceDateTime = "2024-02-10T09:00:00Z"
* primarySource = true
* performer[0].actor = Reference(OrganizationICVPVaccinationExample)
* doseQuantity.value = 0.5
* doseQuantity.unit = "mL"
* doseQuantity.system = "http://unitsofmeasure.org"
* doseQuantity.code = #mL
* route.coding.system = "http://snomed.info/sct"
* route.coding.code = #78421000
* route.coding.display = "Intramuscular route"
* note.text = "Vacuna contra Fiebre Amarilla administrada en Centro de Salud Internacional. Documentada para certificado ICVP."


// Inmunización 2: COVID-19 Dosis 1
// Administrada el 15/05/2023
// Serie de 2 dosis

Instance: ImmunizationCOVID19Dose1ICVPExample
InstanceOf: Immunization
Usage: #example
Description: "Primera dosis de COVID-19 completada - Serie de vacunación 2 dosis"

* status = #completed
* vaccineCode.coding.system = "http://snomed.info/sct"
* vaccineCode.coding.code = #1119305005
* vaccineCode.coding.display = "COVID-19 vaccine"
* patient = Reference(PatientICVPVaccinationExample)
* occurrenceDateTime = "2023-05-15T10:30:00Z"
* primarySource = true
* performer[0].actor = Reference(OrganizationICVPVaccinationExample)
* doseQuantity.value = 0.5
* doseQuantity.unit = "mL"
* doseQuantity.system = "http://unitsofmeasure.org"
* doseQuantity.code = #mL
* protocolApplied.series = "2 dosis COVID-19"
* protocolApplied.doseNumberPositiveInt = 1
* route.coding.system = "http://snomed.info/sct"
* route.coding.code = #78421000
* route.coding.display = "Intramuscular route"
* note.text = "Primera dosis de COVID-19 en serie de 2 dosis"


// Inmunización 3: COVID-19 Dosis 2
// Administrada el 20/06/2023 (36 días después de dosis 1)
// Serie completa

Instance: ImmunizationCOVID19Dose2ICVPExample
InstanceOf: Immunization
Usage: #example
Description: "Segunda dosis de COVID-19 completada - Serie de vacunación completa"

* status = #completed
* vaccineCode.coding.system = "http://snomed.info/sct"
* vaccineCode.coding.code = #1119305005
* vaccineCode.coding.display = "COVID-19 vaccine"
* patient = Reference(PatientICVPVaccinationExample)
* occurrenceDateTime = "2023-06-20T10:30:00Z"
* primarySource = true
* performer[0].actor = Reference(OrganizationICVPVaccinationExample)
* doseQuantity.value = 0.5
* doseQuantity.unit = "mL"
* doseQuantity.system = "http://unitsofmeasure.org"
* doseQuantity.code = #mL
* protocolApplied.series = "2 dosis COVID-19"
* protocolApplied.doseNumberPositiveInt = 2
* route.coding.system = "http://snomed.info/sct"
* route.coding.code = #78421000
* route.coding.display = "Intramuscular route"
* note.text = "Segunda dosis de COVID-19 - Serie de vacunación completa"


// Inmunización 4: Rabia (Post-exposición)
// Administrada el 22/03/2024 como profilaxis post-exposición
// Dosis: 1.0 mL IM

Instance: ImmunizationRabiesICVPExample
InstanceOf: Immunization
Usage: #example
Description: "Vacuna contra Rabia administrada post-exposición para profilaxis"

* status = #completed
* vaccineCode.coding.system = "http://snomed.info/sct"
* vaccineCode.coding.code = #396451003
* vaccineCode.coding.display = "Rabies vaccine"
* patient = Reference(PatientICVPVaccinationExample)
* occurrenceDateTime = "2024-03-22T14:00:00Z"
* primarySource = true
* performer[0].actor = Reference(OrganizationICVPVaccinationExample)
* doseQuantity.value = 1.0
* doseQuantity.unit = "mL"
* doseQuantity.system = "http://unitsofmeasure.org"
* doseQuantity.code = #mL
* route.coding.system = "http://snomed.info/sct"
* route.coding.code = #78421000
* route.coding.display = "Intramuscular route"
* note.text = "Vacuna contra Rabia administrada como profilaxis post-exposición"
