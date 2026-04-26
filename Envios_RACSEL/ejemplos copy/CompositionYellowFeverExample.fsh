// Composición de documento de vacunación
Instance: CompositionYellowFeverExample
InstanceOf: LACCompositionICVP
Usage: #example
Description: "Composición de documento de resumen de vacunación de fiebre amarilla"

* title = "Resumen de Vacunación contra Fiebre Amarilla"
* status = #final
* type.coding.system = "http://loinc.org"
* type.coding.code = #60591-5
* type.coding.display = "Patient summary Document"
* subject = Reference(PatientYellowFeverExample)
* date = 2025-03-15T10:30:00Z
* author = Reference(OrganizationHealthCenterExample)
* custodian = Reference(OrganizationHealthCenterExample)
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h1>Resumen de Vacunación ICVP</h1><p>Paciente: Carla López Rodríguez</p><p>Vacuna: Fiebre Amarilla</p><p>Fecha: 15/03/2025</p><p>Incluye: Inmunizaciones, Medicamentos, Alergias y Diagnósticos</p></div>"

* section[sectionImmunizations].title = "Immunizations"
* section[sectionImmunizations].code.coding.system = "http://loinc.org"
* section[sectionImmunizations].code.coding.code = #11369-6
* section[sectionImmunizations].code.coding.display = "Immunizations"
* section[sectionImmunizations].text.status = #generated
* section[sectionImmunizations].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Registro de administración de vacuna contra fiebre amarilla</p></div>"
* section[sectionImmunizations].entry = Reference(ImmunizationYellowFeverExample)

* section[sectionProblems].title = "Problem List"
* section[sectionProblems].code.coding.system = "http://loinc.org"
* section[sectionProblems].code.coding.code = #11450-4
* section[sectionProblems].code.coding.display = "Problem list - Reported"
* section[sectionProblems].text.status = #generated
* section[sectionProblems].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Diagnóstico registrado: Hipertensión arterial</p></div>"
* section[sectionProblems].entry = Reference(ConditionHypertensionExample)

* section[sectionAllergies].title = "Allergies and Intolerances"
* section[sectionAllergies].code.coding.system = "http://loinc.org"
* section[sectionAllergies].code.coding.code = #48765-2
* section[sectionAllergies].code.coding.display = "Allergies and intolerances Document"
* section[sectionAllergies].text.status = #generated
* section[sectionAllergies].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Alergia documentada a Penicilina - Severidad: Alta</p></div>"
* section[sectionAllergies].entry = Reference(AllergyIntolerancePenicillinExample)

* section[sectionMedications].title = "Medications"
* section[sectionMedications].code.coding.system = "http://loinc.org"
* section[sectionMedications].code.coding.code = #10160-0
* section[sectionMedications].code.coding.display = "History of Medication use"
* section[sectionMedications].text.status = #generated
* section[sectionMedications].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Medicamento en uso: Enalapril 10 mg una vez al día para control de presión arterial</p></div>"
* section[sectionMedications].entry = Reference(MedicationStatementEnalaprilExample)
