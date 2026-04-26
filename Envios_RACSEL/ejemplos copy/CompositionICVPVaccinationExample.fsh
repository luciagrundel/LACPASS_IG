// Composición ICVP para certificado de vacunación internacional
// Incluye sección de inmunizaciones con datos de vacunas
// Secciones de problemas, alergias y medicamentos están vacías con emptyReason según IPS-ICVP
// Paciente: Carlos Eduardo Sánchez López (Perú)

Instance: CompositionICVPVaccinationExample
InstanceOf: LACCompositionICVP
Usage: #example
Description: "Composición ICVP para certificado de vacunación. Incluye sección de inmunizaciones con múltiples vacunas. Secciones de problemas, alergias y medicamentos son vacías con emptyReason según IPS-ICVP constraints."

* title = "Certificado Internacional de Vacunación (ICVP)"
* status = #final
* type.coding.system = "http://loinc.org"
* type.coding.code = #60591-5
* type.coding.display = "Patient summary Document"
* subject = Reference(PatientICVPVaccinationExample)
* date = 2025-04-04T10:00:00Z
* author = Reference(OrganizationICVPVaccinationExample)
* custodian = Reference(OrganizationICVPVaccinationExample)
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h1>Certificado Internacional de Vacunación (ICVP)</h1><p><strong>Paciente:</strong> Carlos Eduardo Sánchez López</p><p><strong>Documento generado:</strong> 04/04/2025</p><p><strong>Vacunas registradas:</strong> Fiebre Amarilla, COVID-19 (serie completa), Rabia (post-exposición)</p><p>Este documento contiene antecedentes de inmunización disponibles. Secciones de problemas de salud, alergias y medicamentos no tienen información registrada en esta oportunidad.</p></div>"

// ===== SECCIÓN DE INMUNIZACIONES (CON ENTRIES) =====
* section[sectionImmunizations].title = "Immunizations"
* section[sectionImmunizations].code.coding.system = "http://loinc.org"
* section[sectionImmunizations].code.coding.code = #11369-6
* section[sectionImmunizations].code.coding.display = "Immunizations"
* section[sectionImmunizations].text.status = #generated
* section[sectionImmunizations].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Registro de administración de vacuna contra fiebre amarilla</p></div>"
* section[sectionImmunizations].entry = Reference(ImmunizationYellowFeverExample)

// ===== SECCIÓN PROBLEMAS (VACÍA CON emptyReason) =====
// Constraint ips-comp-1: Either section.entry or emptyReason are present
// Constraint cmp-2: A section can only have an emptyReason if it is empty
* section[sectionProblems].title = "Problem List"
* section[sectionProblems].code.coding.system = "http://loinc.org"
* section[sectionProblems].code.coding.code = #11450-4
* section[sectionProblems].code.coding.display = "Problem list - Reported"
* section[sectionProblems].text.status = #generated
* section[sectionProblems].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Sin información de problemas de salud conocidos registrados en este momento.</p></div>"
* section[sectionProblems].emptyReason.coding.system = "http://terminology.hl7.org/CodeSystem/list-empty-reason"
* section[sectionProblems].emptyReason.coding.code = #nilknown
* section[sectionProblems].emptyReason.coding.display = "Nothing known"

// ===== SECCIÓN ALERGIAS (VACÍA CON emptyReason) =====
// Constraint ips-comp-1: Either section.entry or emptyReason are present
// Constraint cmp-2: A section can only have an emptyReason if it is empty
* section[sectionAllergies].title = "Allergies and Intolerances"
* section[sectionAllergies].code.coding.system = "http://loinc.org"
* section[sectionAllergies].code.coding.code = #48765-2
* section[sectionAllergies].code.coding.display = "Allergies and intolerances Document"
* section[sectionAllergies].text.status = #generated
* section[sectionAllergies].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>No hay información disponible sobre alergias o intolerancias en esta evaluación.</p></div>"
* section[sectionAllergies].emptyReason.coding.system = "http://terminology.hl7.org/CodeSystem/list-empty-reason"
* section[sectionAllergies].emptyReason.coding.code = #notavailable
* section[sectionAllergies].emptyReason.coding.display = "Not Available"

// ===== SECCIÓN MEDICAMENTOS (VACÍA CON emptyReason) =====
// Constraint ips-comp-1: Either section.entry or emptyReason are present
// Constraint cmp-2: A section can only have an emptyReason if it is empty
* section[sectionMedications].title = "Medications"
* section[sectionMedications].code.coding.system = "http://loinc.org"
* section[sectionMedications].code.coding.code = #10160-0
* section[sectionMedications].code.coding.display = "History of Medication use"
* section[sectionMedications].text.status = #generated
* section[sectionMedications].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>No se realizó investigación sobre medicamentos en uso en esta oportunidad.</p></div>"
* section[sectionMedications].emptyReason.coding.system = "http://terminology.hl7.org/CodeSystem/list-empty-reason"
* section[sectionMedications].emptyReason.coding.code = #notasked
* section[sectionMedications].emptyReason.coding.display = "Not Asked"
