// Bundle IPS Completo - Patient Summary para María José González García
Instance: BundleIPSCompleteExample
InstanceOf: LACBundleIPS
Usage: #example
Description: "Bundle IPS completo conteniendo International Patient Summary (IPS) para paciente colombiana con hipertensión y diabetes, incluyendo composición, paciente, organización, condiciones, alergias, inmunizaciones y medicamentos"

* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:a1b2c3d4-e5f6-4789-a0b1-c2d3e4f5a6b7"
* type = #document
* timestamp = 2025-04-04T14:30:00Z

// Entry 0: Composition (requerida como primera entrada)
* entry[0].fullUrl = "urn:uuid:composition-001"
* entry[0].resource = CompositionIPSCompleteExample

// Entry 1: Patient (requerida como segunda entrada según LACBundleIPS)
* entry[1].fullUrl = "urn:uuid:patient-001"
* entry[1].resource = PatientIPSCompleteExample

// Entry 2: Organization (custodian de la Composition)
* entry[2].fullUrl = "urn:uuid:organization-001"
* entry[2].resource = OrganizationIPSCompleteExample

// Entry 3: Condition - Hipertensión arterial
* entry[3].fullUrl = "urn:uuid:condition-hypertension"
* entry[3].resource = ConditionHypertensionCompleteExample

// Entry 4: Condition - Diabetes tipo 2
* entry[4].fullUrl = "urn:uuid:condition-diabetes"
* entry[4].resource = ConditionDiabetesCompleteExample

// Entry 5: AllergyIntolerance - Penicilina
* entry[5].fullUrl = "urn:uuid:allergy-penicillin"
* entry[5].resource = AllergyIntolerancePenicillinCompleteExample

// Entry 6: AllergyIntolerance - Sulfonamidas
* entry[6].fullUrl = "urn:uuid:allergy-sulfonamide"
* entry[6].resource = AllergyIntoleranceSulfonamideCompleteExample

// Entry 7: Immunization - Influenza
* entry[7].fullUrl = "urn:uuid:immunization-influenza"
* entry[7].resource = ImmunizationInfluenzaCompleteExample

// Entry 8: Immunization - COVID-19
* entry[8].fullUrl = "urn:uuid:immunization-covid19"
* entry[8].resource = ImmunizationCOVID19CompleteExample

// Entry 9: Medication - Enalapril
* entry[9].fullUrl = "urn:uuid:medication-enalapril"
* entry[9].resource = MedicationEnalaprilCompleteExample

// Entry 10: Medication - Metformina
* entry[10].fullUrl = "urn:uuid:medication-metformin"
* entry[10].resource = MedicationMetforminCompleteExample

// Entry 11: MedicationStatement - Enalapril en uso
* entry[11].fullUrl = "urn:uuid:medication-statement-enalapril"
* entry[11].resource = MedicationStatementEnalaprilCompleteExample

// Entry 12: MedicationStatement - Metformina en uso
* entry[12].fullUrl = "urn:uuid:medication-statement-metformin"
* entry[12].resource = MedicationStatementMetforminCompleteExample

// ===================================================================
// COMPOSITION - Estructura del documento IPS
// ===================================================================
Instance: CompositionIPSCompleteExample
InstanceOf: LACCompositionIPS
Usage: #inline
Description: "Composición del documento IPS para María José González García con secciones de inmunizaciones, problemas, alergias y medicamentos"

* status = #final
* type.coding.system = "http://loinc.org"
* type.coding.code = #60591-5
* type.coding.display = "Patient summary Document"

* title = "International Patient Summary - María José González García"
* subject = Reference(PatientIPSCompleteExample)
* date = 2025-04-04T14:30:00Z
* author = Reference(OrganizationIPSCompleteExample)
* custodian = Reference(OrganizationIPSCompleteExample)

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h1>International Patient Summary</h1><p>Paciente: María José González García</p><p>Fecha de nacimiento: 18/12/1971 (53 años)</p><p>Documento de resumen de paciente con condiciones crónicas, alergias medicamentosas y esquema de vacunación.</p></div>"

// Section: Immunizations
* section[sectionImmunizations].title = "Immunizations"
* section[sectionImmunizations].code.coding.system = "http://loinc.org"
* section[sectionImmunizations].code.coding.code = #11369-6
* section[sectionImmunizations].code.coding.display = "Immunizations"
* section[sectionImmunizations].text.status = #generated
* section[sectionImmunizations].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Registros de inmunizaciones completadas: Influenza 2024 y COVID-19 (serie completa)</p></div>"
* section[sectionImmunizations].entry[0] = Reference(ImmunizationInfluenzaCompleteExample)
* section[sectionImmunizations].entry[1] = Reference(ImmunizationCOVID19CompleteExample)

// Section: Problem List
* section[sectionProblems].title = "Problem List"
* section[sectionProblems].code.coding.system = "http://loinc.org"
* section[sectionProblems].code.coding.code = #11450-4
* section[sectionProblems].code.coding.display = "Problem list - Reported"
* section[sectionProblems].text.status = #generated
* section[sectionProblems].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Diagnósticos registrados: Hipertensión arterial esencial y Diabetes mellitus tipo 2</p></div>"
* section[sectionProblems].entry[0] = Reference(ConditionHypertensionCompleteExample)
* section[sectionProblems].entry[1] = Reference(ConditionDiabetesCompleteExample)

// Section: Allergies and Intolerances
* section[sectionAllergies].title = "Allergies and Intolerances"
* section[sectionAllergies].code.coding.system = "http://loinc.org"
* section[sectionAllergies].code.coding.code = #48765-2
* section[sectionAllergies].code.coding.display = "Allergies and intolerances Document"
* section[sectionAllergies].text.status = #generated
* section[sectionAllergies].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Alergias documentadas: Penicilina (severidad alta) y Sulfonamidas (severidad media)</p></div>"
* section[sectionAllergies].entry[0] = Reference(AllergyIntolerancePenicillinCompleteExample)
* section[sectionAllergies].entry[1] = Reference(AllergyIntoleranceSulfonamideCompleteExample)

// Section: Medications
* section[sectionMedications].title = "Medications"
* section[sectionMedications].code.coding.system = "http://loinc.org"
* section[sectionMedications].code.coding.code = #10160-0
* section[sectionMedications].code.coding.display = "History of Medication use"
* section[sectionMedications].text.status = #generated
* section[sectionMedications].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Medicamentos en uso: Enalapril para control de hipertensión y Metformina para control glucémico</p></div>"
* section[sectionMedications].entry[0] = Reference(MedicationStatementEnalaprilCompleteExample)
* section[sectionMedications].entry[1] = Reference(MedicationStatementMetforminCompleteExample)

// ===================================================================
// PATIENT - Datos demográficos colombianos
// ===================================================================
Instance: PatientIPSCompleteExample
InstanceOf: LACPatient
Usage: #inline
Description: "Paciente colombiana María José González García con identificadores nacionales e internacionales"

// International identifier - Pasaporte (PPN: Passport Number)
* identifier[international].use = #official
* identifier[international].type = $v2-0203#PPN
* identifier[international].system = "urn:oid.2.16.840.1.113883.4.330"
* identifier[international].value = "CO-A1234567"

// National identifier - Cédula de ciudadanía (Colombia)
* identifier[national].system = "urn:oid.2.16.170.1.2"
* identifier[national].type = $v2-0203#NI
* identifier[national].value = "1098765432"

* active = true

* name.use = #official
* name.text = "María José González García"
* name.family = "González García"
* name.given[0] = "María"
* name.given[1] = "José"

* gender = #female
* birthDate = "1971-12-18"

// ===================================================================
// ORGANIZATION - Proveedor de salud
// ===================================================================
Instance: OrganizationIPSCompleteExample
InstanceOf: LACOrganization
Usage: #inline
Description: "Clínica de Especialidades ubicada en Bogotá, Colombia"

* name = "Clínica de Especialidades Bogotá"

* type.coding.system = "http://terminology.hl7.org/CodeSystem/organization-type"
* type.coding.code = #prov
* type.coding.display = "Healthcare Provider"

* identifier.system = "urn:oid.2.16.170.1.3"
* identifier.type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier.type.coding.code = #XX
* identifier.value = "860000000-1"

* address.text = "Carrera 7 No. 123-45, Bogotá D.C."
* address.city = "Bogotá"
* address.state = "Cundinamarca"
* address.country = "CO"

* telecom.system = #phone
* telecom.value = "+57-1-5551234"

* telecom[1].system = #email
* telecom[1].value = "contacto@clinicaespecialidades.com.co"

// ===================================================================
// CONDITIONS - Diagnósticos (Problemas de salud)
// ===================================================================

// Condition 1: Hipertensión arterial esencial
Instance: ConditionHypertensionCompleteExample
InstanceOf: Condition
Usage: #inline
Description: "Diagnóstico de hipertensión arterial esencial en paciente colombiana"

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
* code.coding.display = "Essential hypertension"

* subject = Reference(PatientIPSCompleteExample)
* onsetDateTime = "2010-06-15T00:00:00Z"
* recordedDate = "2025-04-04T14:30:00Z"

// Condition 2: Diabetes mellitus tipo 2
Instance: ConditionDiabetesCompleteExample
InstanceOf: Condition
Usage: #inline
Description: "Diagnóstico de diabetes mellitus tipo 2"

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
* code.coding.code = #44054006
* code.coding.display = "Type 2 diabetes mellitus"

* subject = Reference(PatientIPSCompleteExample)
* onsetDateTime = "2015-03-22T00:00:00Z"
* recordedDate = "2025-04-04T14:30:00Z"

// ===================================================================
// ALLERGY INTOLERANCES - Reacciones alérgicas
// ===================================================================

// Allergy 1: Penicilina
Instance: AllergyIntolerancePenicillinCompleteExample
InstanceOf: AllergyIntolerance
Usage: #inline
Description: "Alergia a penicilina - severidad alta con riesgo de reacción grave"

* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
* clinicalStatus.coding.code = #active
* clinicalStatus.coding.display = "Active"

* verificationStatus.coding.system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"
* verificationStatus.coding.code = #confirmed
* verificationStatus.coding.display = "Confirmed"

* type = #medication
* category = #medication
* criticality = #high

* code.coding.system = "http://snomed.info/sct"
* code.coding.code = #373270004
* code.coding.display = "Penicillin - class of antibiotics"

* patient = Reference(PatientIPSCompleteExample)
* recordedDate = "2005-01-10T00:00:00Z"

* reaction.manifestation.coding.system = "http://snomed.info/sct"
* reaction.manifestation.coding.code = #271807003
* reaction.manifestation.coding.display = "Skin rash"

* reaction[1].manifestation.coding.system = "http://snomed.info/sct"
* reaction[1].manifestation.coding.code = #39579001
* reaction[1].manifestation.coding.display = "Anaphylaxis"

* reaction[0].severity = #severe
* reaction[1].severity = #severe

// Allergy 2: Sulfonamidas
Instance: AllergyIntoleranceSulfonamideCompleteExample
InstanceOf: AllergyIntolerance
Usage: #inline
Description: "Alergia a sulfonamidas - severidad media"

* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
* clinicalStatus.coding.code = #active
* clinicalStatus.coding.display = "Active"

* verificationStatus.coding.system = "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"
* verificationStatus.coding.code = #confirmed
* verificationStatus.coding.display = "Confirmed"

* type = #medication
* category = #medication
* criticality = #medium

* code.coding.system = "http://snomed.info/sct"
* code.coding.code = #373270004
* code.coding.display = "Sulfonamide - class of antibiotics"

* patient = Reference(PatientIPSCompleteExample)
* recordedDate = "2008-05-22T00:00:00Z"

* reaction.manifestation.coding.system = "http://snomed.info/sct"
* reaction.manifestation.coding.code = #271807003
* reaction.manifestation.coding.display = "Skin rash"

* reaction.severity = #moderate

// ===================================================================
// IMMUNIZATIONS - Registros de vacunación
// ===================================================================

// Immunization 1: Influenza (2024)
Instance: ImmunizationInfluenzaCompleteExample
InstanceOf: Immunization
Usage: #inline
Description: "Registro de administración de vacuna de influenza en 2024"

* status = #completed
* vaccineCode.coding.system = "http://snomed.info/sct"
* vaccineCode.coding.code = #85679003
* vaccineCode.coding.display = "Influenza vaccine"

* patient = Reference(PatientIPSCompleteExample)
* occurrenceDateTime = "2024-10-15T09:30:00Z"
* primarySource = true

* location.display = "Clínica de Especialidades Bogotá"
* performer.actor = Reference(OrganizationIPSCompleteExample)

* doseQuantity.value = 0.5
* doseQuantity.unit = "mL"
* doseQuantity.system = "http://unitsofmeasure.org"
* doseQuantity.code = #mL

* route.coding.system = "http://snomed.info/sct"
* route.coding.code = #34206005
* route.coding.display = "Subcutaneous route"

* note.text = "Vacuna contra influenza temporada 2024 administrada intramuscularmente"

// Immunization 2: COVID-19 (Serie completa)
Instance: ImmunizationCOVID19CompleteExample
InstanceOf: Immunization
Usage: #inline
Description: "Registro de serie completa de vacunación COVID-19"

* status = #completed
* vaccineCode.coding.system = "http://snomed.info/sct"
* vaccineCode.coding.code = #1119305005
* vaccineCode.coding.display = "COVID-19 vaccine"

* patient = Reference(PatientIPSCompleteExample)
* occurrenceDateTime = "2022-06-20T10:00:00Z"
* primarySource = true

* location.display = "Clínica de Especialidades Bogotá"
* performer.actor = Reference(OrganizationIPSCompleteExample)

* doseQuantity.value = 0.5
* doseQuantity.unit = "mL"
* doseQuantity.system = "http://unitsofmeasure.org"
* doseQuantity.code = #mL

* route.coding.system = "http://snomed.info/sct"
* route.coding.code = #78421000
* route.coding.display = "Intramuscular route"

* note.text = "Serie completa de vacunación COVID-19 (3 dosis)"

// ===================================================================
// MEDICATIONS - Medicamentos registrados
// ===================================================================

// Medication 1: Enalapril (ACE inhibitor antihypertensive)
Instance: MedicationEnalaprilCompleteExample
InstanceOf: Medication
Usage: #inline
Description: "Enalapril - medicamento antihipertensivo de clase ACE inhibidor"

* code.coding.system = "http://snomed.info/sct"
* code.coding.code = #6826002
* code.coding.display = "Preparations of enalapril"

* form.coding.system = "http://snomed.info/sct"
* form.coding.code = #385055001
* form.coding.display = "Tablet"

// Medication 2: Metformina (Antidiabetic)
Instance: MedicationMetforminCompleteExample
InstanceOf: Medication
Usage: #inline
Description: "Metformina - medicamento antidiabético para control glucémico"

* code.coding.system = "http://snomed.info/sct"
* code.coding.code = #372567009
* code.coding.display = "Metformin"

* form.coding.system = "http://snomed.info/sct"
* form.coding.code = #385055001
* form.coding.display = "Tablet"

// ===================================================================
// MEDICATION STATEMENTS - Registro de medicamentos en uso
// ===================================================================

// MedicationStatement 1: Enalapril en uso activo
Instance: MedicationStatementEnalaprilCompleteExample
InstanceOf: MedicationStatement
Usage: #inline
Description: "Registro de uso actual de Enalapril para control de hipertensión arterial"

* status = #active

* medicationReference = Reference(MedicationEnalaprilCompleteExample)
* subject = Reference(PatientIPSCompleteExample)

* effectiveDateTime = "2024-01-15T00:00:00Z"
* dateAsserted = "2025-04-04T14:30:00Z"

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

* note.text = "Enalapril 10 mg una vez al día por la mañana para control de presión arterial. Paciente tolera bien el medicamento sin efectos adversos reportados."

* reasonCode.coding.system = "http://snomed.info/sct"
* reasonCode.coding.code = #38341003
* reasonCode.coding.display = "Essential hypertension"

// MedicationStatement 2: Metformina en uso activo
Instance: MedicationStatementMetforminCompleteExample
InstanceOf: MedicationStatement
Usage: #inline
Description: "Registro de uso actual de Metformina para control glucémico en diabetes tipo 2"

* status = #active

* medicationReference = Reference(MedicationMetforminCompleteExample)
* subject = Reference(PatientIPSCompleteExample)

* effectiveDateTime = "2015-04-01T00:00:00Z"
* dateAsserted = "2025-04-04T14:30:00Z"

* dosage.timing.repeat.frequency = 2
* dosage.timing.repeat.period = 1
* dosage.timing.repeat.periodUnit = #d

* dosage.route.coding.system = "http://snomed.info/sct"
* dosage.route.coding.code = #26643006
* dosage.route.coding.display = "Oral route"

* dosage.doseAndRate.doseQuantity.value = 850
* dosage.doseAndRate.doseQuantity.unit = "mg"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg

* note.text = "Metformina 850 mg dos veces al día (mañana y noche) con las comidas. Control glucémico adecuado según últimos valores de HbA1c."

* reasonCode.coding.system = "http://snomed.info/sct"
* reasonCode.coding.code = #44054006
* reasonCode.coding.display = "Type 2 diabetes mellitus"
