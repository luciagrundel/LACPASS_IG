// ===================================================================
// BUNDLE TRANSACTION MHD - ITI-65 Minimal Provide Document
// ===================================================================
// Transacción mínima de envío de documento ITI-65 según MHD
// Contiene un Bundle IPS (documento) más un Patient de validación
// Caso de uso: Centro de Salud chileno enviando resumen de paciente
// ===================================================================

Instance: BundleTransactionMHDMinimalExample
InstanceOf: LACBundleTransactionMHD
Usage: #example
Description: "Ejemplo de Transacción ITI-65 MHD-Minimal: envío de Documento IPS para paciente chilena María González Silva, 57 años con antecedentes de hipertensión, alergia a penicilina"

* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:txn-mhd-2025-04-001"
* type = #transaction
* timestamp = 2025-04-04T10:15:00Z

// ===================================================================
// ENTRY 0: SubmissionSet - Metadatos del envío (Requerido en MHD)
// ===================================================================
* entry[SubmissionSet].fullUrl = "urn:uuid:submissionset-maria-001"
* entry[SubmissionSet].request.method = #POST
* entry[SubmissionSet].request.url = "List"
* entry[SubmissionSet].resource = SubmissionSetMariaGonzalezExample

// ===================================================================
// ENTRY 1: FhirDocuments - Bundle IPS (Documento Principal)
// ===================================================================
* entry[FhirDocuments].fullUrl = "urn:uuid:bundle-ips-maria-001"
* entry[FhirDocuments].request.method = #POST
* entry[FhirDocuments].request.url = "Bundle"
* entry[FhirDocuments].resource = IPSBundleMariaGonzalezExample

// ===================================================================
// ENTRY 2: Patient - Patient para validación en MHD
// ===================================================================
* entry[Patient].fullUrl = "urn:uuid:patient-maria-mhd-001"
* entry[Patient].request.method = #POST
* entry[Patient].request.url = "Patient"
* entry[Patient].resource = PatientMariaGonzalezMHDExample


// ===================================================================
// SUBMISSION SET - Metadatos del envío (List)
// ===================================================================
Instance: SubmissionSetMariaGonzalezExample
InstanceOf: LACList
Usage: #inline
Description: "SubmissionSet para la transacción MHD - agrupa el documento IPS"

* status = #current
* mode = #working
* title = "Submission Set for 2025-04-04T10:15:00Z"
* code = https://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes#submissionset
* subject = Reference(urn:uuid:patient-maria-mhd-001)
* date = 2025-04-04T10:15:00Z
* extension[sourceId].valueIdentifier.system = "urn:ietf:rfc:3986"
* extension[sourceId].valueIdentifier.value = "urn:uuid:source-001"
* entry[0].item = Reference(urn:uuid:bundle-ips-maria-001)


// ===================================================================
// IPS BUNDLE - Documento del Paciente con Composición y Recursos
// ===================================================================
Instance: IPSBundleMariaGonzalezExample
InstanceOf: LACBundleIPS
Usage: #inline
Description: "Bundle IPS conteniendo el documento completo de María González Silva"

* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:document-ips-maria-001"
* type = #document
* timestamp = 2025-04-04T10:15:00Z

// Composition - Documento principal
* entry[0].fullUrl = "urn:uuid:composition-maria-001"
* entry[0].resource = CompositionMariaGonzalezExample

// Patient - Datos demográficos del documento
* entry[1].fullUrl = "urn:uuid:patient-maria-ips-001"
* entry[1].resource = PatientMariaIPSExample

// Organization - Centro de Salud
* entry[2].fullUrl = "urn:uuid:org-health-center-001"
* entry[2].resource = OrganizationHealthCenterChileExample

// Condition - Diagnóstico crónico
* entry[3].fullUrl = "urn:uuid:condition-hypertension-maria-001"
* entry[3].resource = ConditionHypertensionMariaExample

// AllergyIntolerance - Alergia medicamentosa
* entry[4].fullUrl = "urn:uuid:allergy-penicillin-maria-001"
* entry[4].resource = AllergyPenicillinMariaExample

// Immunization - Vacuna
* entry[5].fullUrl = "urn:uuid:immunization-influenza-maria-001"
* entry[5].resource = ImmunizationInfluenzaMariaExample

// MedicationStatement - Medicamento en uso
* entry[6].fullUrl = "urn:uuid:medication-statement-enalapril-maria-001"
* entry[6].resource = MedicationStatementEnalaprilMariaExample


// ===================================================================
// COMPOSITION - Documento IPS
// ===================================================================
Instance: CompositionMariaGonzalezExample
InstanceOf: LACCompositionIPS
Usage: #inline
Description: "Composición IPS para María González Silva - Resumen de Paciente Internacional"

* status = #final
* type.coding.system = "http://loinc.org"
* type.coding.code = #60591-5
* type.coding.display = "Patient summary Document"

* subject = Reference(urn:uuid:patient-maria-ips-001)
* date = 2025-04-04T10:15:00Z
* author = Reference(urn:uuid:org-health-center-001)
* custodian = Reference(urn:uuid:org-health-center-001)
* title = "International Patient Summary - María González Silva"

// Narrative del documento
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2>IPS para María González Silva</h2><p>Paciente: María González Silva, RUT 12.765.432-8</p><p>Edad: 57 años, Género: Femenino</p><p>Resumen clínico con antecedentes de hipertensión arterial, alergia documentada a penicilina e inmunizaciones vigentes.</p></div>"

// ===================================================================
// SECTIONS (Requeridas en IPS)
// ===================================================================

// Sección: Inmunizaciones (REQUERIDA)
* section[sectionImmunizations].title = "Immunizations"
* section[sectionImmunizations].code.coding.system = "http://loinc.org"
* section[sectionImmunizations].code.coding.code = #11369-6
* section[sectionImmunizations].text.status = #generated
* section[sectionImmunizations].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Vacunación: Influenza 2025, Neumococo, Tdap vigentes</p></div>"
* section[sectionImmunizations].entry = Reference(urn:uuid:immunization-influenza-maria-001)

// Sección: Problemas (REQUERIDA)
* section[sectionProblems].title = "Problem List"
* section[sectionProblems].code.coding.system = "http://loinc.org"
* section[sectionProblems].code.coding.code = #11450-4
* section[sectionProblems].text.status = #generated
* section[sectionProblems].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Diagnósticos: Hipertensión arterial esencial 10I10 desde 2020</p></div>"
* section[sectionProblems].entry = Reference(urn:uuid:condition-hypertension-maria-001)

// Sección: Alergias (REQUERIDA)
* section[sectionAllergies].title = "Allergies and Intolerances"
* section[sectionAllergies].code.coding.system = "http://loinc.org"
* section[sectionAllergies].code.coding.code = #48765-2
* section[sectionAllergies].text.status = #generated
* section[sectionAllergies].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Alergia: Penicilina - urticaria</p></div>"
* section[sectionAllergies].entry = Reference(urn:uuid:allergy-penicillin-maria-001)

// Sección: Medicamentos (REQUERIDA)
* section[sectionMedications].title = "Medications"
* section[sectionMedications].code.coding.system = "http://loinc.org"
* section[sectionMedications].code.coding.code = #10160-0
* section[sectionMedications].text.status = #generated
* section[sectionMedications].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Medicamentos: Enalapril 10mg diarios para control de HTA</p></div>"
* section[sectionMedications].entry = Reference(urn:uuid:medication-statement-enalapril-maria-001)


// ===================================================================
// PATIENT - En el documento IPS
// ===================================================================
Instance: PatientMariaIPSExample
InstanceOf: LACPatient
Usage: #inline
Description: "Datos demográficos de María González Silva en el documento IPS"

* active = true

// Identificador Internacional - Pasaporte
* identifier[international].system = "urn:oid.2.16.840.1.113883.4.330.4"
* identifier[international].use = #official
* identifier[international].type = $v2-0203#PPN
* identifier[international].value = "E12345678"

// Identificador Nacional - RUT Chile
* identifier[national].system = "urn:oid.2.16.840.1.113883.3.239"
* identifier[national].type = $v2-0203#NII
* identifier[national].value = "12765432-8"

// Datos personales
* name.use = #official
* name.text = "María González Silva"
* name.family = "González Silva"
* name.given = "María"

* gender = #female
* birthDate = "1967-03-15"

// Dirección
* address.use = #home
* address.type = #physical
* address.line = "Calle Los Andes 456"
* address.city = "Santiago"
* address.postalCode = "8340457"
* address.country = "CL"

// Teléfono
* telecom[0].system = #phone
* telecom[0].value = "+56912345678"
* telecom[0].use = #mobile

* telecom[1].system = #email
* telecom[1].value = "maria.gonzalez@example.com"

* managingOrganization = Reference(urn:uuid:org-health-center-001)


// ===================================================================
// PATIENT - Entry Patient del Bundle Transaction (MHD Validation)
// ===================================================================
Instance: PatientMariaGonzalezMHDExample
InstanceOf: LACPatient
Usage: #inline
Description: "Patient para validación en transacción MHD - debe coincidir con Patient del documento"

* active = true

// Identificador Internacional - Pasaporte
* identifier[international].system = "urn:oid.2.16.840.1.113883.4.330.4"
* identifier[international].use = #official
* identifier[international].type = $v2-0203#PPN
* identifier[international].value = "E12345678"

// Identificador Nacional - RUT Chile
* identifier[national].system = "urn:oid.2.16.840.1.113883.3.239"
* identifier[national].type = $v2-0203#NII
* identifier[national].value = "12765432-8"

// Debe ser igual al Patient del documento
* name.use = #official
* name.text = "María González Silva"
* name.family = "González Silva"
* name.given = "María"

* gender = #female
* birthDate = "1967-03-15"

* address.use = #home
* address.type = #physical
* address.line = "Calle Los Andes 456"
* address.city = "Santiago"
* address.postalCode = "8340457"
* address.country = "CL"

* telecom[0].system = #phone
* telecom[0].value = "+56912345678"
* telecom[0].use = #mobile

* telecom[1].system = #email
* telecom[1].value = "maria.gonzalez@example.com"

* managingOrganization = Reference(urn:uuid:org-health-center-001)


// ===================================================================
// ORGANIZATION - Centro de Salud chileno
// ===================================================================
Instance: OrganizationHealthCenterChileExample
InstanceOf: Organization
Usage: #inline
Description: "Centro de Salud Familia La Florida - Origina el documento"

* active = true
* type.coding.system = "http://terminology.hl7.org/CodeSystem/organization-type"
* type.coding.code = #prov
* name = "Centro de Salud Familiar La Florida"
* telecom.system = #phone
* telecom.value = "+56222222222"
* address.type = #physical
* address.line = "Av. Concha y Toro 1500"
* address.city = "Santiago"
* address.country = "CL"


// ===================================================================
// CONDITION - Hipertensión Arterial
// ===================================================================
Instance: ConditionHypertensionMariaExample
InstanceOf: Condition
Usage: #inline
Description: "Hipertensión arterial esencial - diagnóstico vigente desde 2020"

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* code.coding.system = "http://snomed.info/sct"
* code.coding.code = #59621000
* code.coding.display = "Essential hypertension"
* subject = Reference(urn:uuid:patient-maria-ips-001)
* onsetDateTime = "2020-01-15"
* note.text = "Hipertensión arterial diagnosticada en 2020. Control farmacológico con Enalapril."


// ===================================================================
// ALLERGY INTOLERANCE - Penicilina
// ===================================================================
Instance: AllergyPenicillinMariaExample
InstanceOf: AllergyIntolerance
Usage: #inline
Description: "Alergia a Penicilina - reacción cutánea urticaria"

* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* type = #allergy
* category = #medication
* code.coding.system = "http://snomed.info/sct"
* code.coding.code = #91143003
* code.coding.display = "Penicillin (substance)"
* patient = Reference(urn:uuid:patient-maria-ips-001)
* onsetDateTime = "2005-06-10"
* reaction.manifestation.coding.system = "http://snomed.info/sct"
* reaction.manifestation.coding.code = #126497008
* reaction.manifestation.coding.display = "Urticaria (disorder)"
* reaction.severity = #mild
* note.text = "Reacción cutánea leve (urticaria) documentada a penicilina. Evitar beta-lactámicos."


// ===================================================================
// MEDICATION STATEMENT - Medicamento en uso
// ===================================================================
Instance: MedicationStatementEnalaprilMariaExample
InstanceOf: MedicationStatement
Usage: #inline
Description: "MedicationStatement para Enalapril en control de HTA"

* status = #active
* medicationCodeableConcept.coding.system = "http://snomed.info/sct"
* medicationCodeableConcept.coding.code = #16662771000001101
* medicationCodeableConcept.coding.display = "Enalapril 10mg tablets"
* subject = Reference(urn:uuid:patient-maria-ips-001)
* effectivePeriod.start = "2020-01-15"
* dosage.text = "10 mg una vez por la mañana"
* dosage.route.coding.system = "http://snomed.info/sct"
* dosage.route.coding.code = #26643006
* dosage.route.coding.display = "Oral route (qualifier value)"
* note.text = "Medicamento para control de hipertensión arterial. Paciente cumplidor."


// ===================================================================
// IMMUNIZATION - Vacuna Influenza 2025
// ===================================================================
Instance: ImmunizationInfluenzaMariaExample
InstanceOf: Immunization
Usage: #inline
Description: "Vacuna contra Influenza 2025 administrada el 15/03/2025"

* status = #completed
* vaccineCode.coding.system = "http://snomed.info/sct"
* vaccineCode.coding.code = #28581000
* vaccineCode.coding.display = "Influenza vaccine (product)"
* patient = Reference(urn:uuid:patient-maria-ips-001)
* occurrenceDateTime = "2025-03-15"
* primarySource = true
* lotNumber = "INF-2025-S-00123"
* performer.actor = Reference(urn:uuid:org-health-center-001)
* note.text = "Vacuna Influenza administrada sin incidentes. Paciente toleró bien."
