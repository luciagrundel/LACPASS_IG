Instance: BundleTransMHDExample
InstanceOf: LACBundleTransactionMHD
Usage: #example
Description: "Ejemplo de MHD - Bundle de transacción ITI-65 (Sergio Penafiel, Chile)"

* type = #transaction
* timestamp = "2004-10-25T23:50:50-05:00"

* entry[SubmissionSet].fullUrl = "urn:uuid:5eac3f2c-504a-47dd-b8b6-94691a0f4dd6"
* entry[SubmissionSet].resource = 5eac3f2c-504a-47dd-b8b6-94691a0f4dd6
* entry[SubmissionSet].request.method = #POST
* entry[SubmissionSet].request.url = "List"

* entry[DocumentRefs].fullUrl = "urn:uuid:987f3197-b863-4c0d-9a0d-75b0ee08d761"
* entry[DocumentRefs].resource = 987f3197-b863-4c0d-9a0d-75b0ee08d761
* entry[DocumentRefs].request.method = #POST
* entry[DocumentRefs].request.url = "DocumentReference"

* entry[FhirDocuments].fullUrl = "urn:uuid:5c8ecb2a-8660-4e2c-960e-55998bcfff46"
* entry[FhirDocuments].resource = 5c8ecb2a-8660-4e2c-960e-55998bcfff46
* entry[FhirDocuments].request.method = #POST
* entry[FhirDocuments].request.url = "Bundle"

* entry[Patient].fullUrl = "urn:uuid:d6bf46d8-b0ea-4307-83f8-fcdf36aea951"
* entry[Patient].resource = d6bf46d8-b0ea-4307-83f8-fcdf36aea951
* entry[Patient].request.method = #POST
* entry[Patient].request.url = "Patient"




// ============================================================
// SUBMISSION SET (List)
// ============================================================

Instance: 5eac3f2c-504a-47dd-b8b6-94691a0f4dd6
InstanceOf: LACList
Usage: #inline

* text.status = #extensions
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">SubmissionSet with Patient</div>"

* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"

* identifier[0].use = #usual
* identifier[0].system = "urn:ietf:rfc:3986"
* identifier[0].value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46343"

* status = #current
* mode = #working

* code.coding[0].system = "https://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes"
* code.coding[0].code = #submissionset

* subject = Reference(urn:uuid:d6bf46d8-b0ea-4307-83f8-fcdf36aea951)
* date = "2004-10-25T23:50:50-05:00"

* entry[0].item = Reference(urn:uuid:987f3197-b863-4c0d-9a0d-75b0ee08d761)


// ============================================================
// DOCUMENT REFERENCE
// ============================================================

Instance: 987f3197-b863-4c0d-9a0d-75b0ee08d761
InstanceOf: LACDocReference
Usage: #inline

* meta.profile[0] = "http://racsel.org/StructureDefinition/LACDocReference"
* meta.profile[+] = "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference"
* meta.security.system = "http://terminology.hl7.org/CodeSystem/v3-ActReason"
* meta.security.code = #HTEST

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>DocumentReference</b>: Resumen IPS de Sergio Penafiel</p></div>"

* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.53432.348.12973.17740.34205.4355.50220.62012"

* status = #current

* subject = Reference(urn:uuid:d6bf46d8-b0ea-4307-83f8-fcdf36aea951)

* content[0].attachment.contentType = #text/plain
* content[0].attachment.url = "urn:uuid:5c8ecb2a-8660-4e2c-960e-55998bcfff46"
* content[0].attachment.size = 11
* content[0].attachment.hash = "MGE0ZDU1YThkNzc4ZTUwMjJmYWI3MDE5NzdjNWQ4NDBiYmM0ODZkMA=="

* content[0].format.system = "http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode"
* content[0].format.code = #urn:ihe:iti:xds-sd:text:2008


// ============================================================
// DOCUMENTO IPS (Bundle de tipo document)
// ============================================================

Instance: 5c8ecb2a-8660-4e2c-960e-55998bcfff46
InstanceOf: LACBundleIPS
Usage: #inline

* meta.profile = "http://racsel.org/StructureDefinition/LACBundleIPS"
* identifier.system = "urn:ietf:rfc:4122"
* identifier.value = "f50a5146-7d08-4f4d-b7a9-eb8a05d513a0"
* type = #document
* timestamp = "2023-01-15T17:26:43.023+00:00"

// Composition
* entry[composition].fullUrl = "urn:uuid:428e9bed-1f16-4595-91b9-80ae6ac12421"
* entry[composition].resource = 428e9bed-1f16-4595-91b9-80ae6ac12421

// Paciente
* entry[patient].fullUrl = "urn:uuid:d6bf46d8-b0ea-4307-83f8-fcdf36aea951"
* entry[patient].resource = d6bf46d8-b0ea-4307-83f8-fcdf36aea951

// Condition
* entry[condition].fullUrl = "urn:uuid:03368859-2b77-44fa-b1b1-9e303e408cc3"
* entry[condition].resource = 03368859-2b77-44fa-b1b1-9e303e408cc3

// Medication
* entry[medication].fullUrl = "urn:uuid:d5b10a87-63b9-4701-b8c6-11942ccf2d7f"
* entry[medication].resource = d5b10a87-63b9-4701-b8c6-11942ccf2d7f

// MedicationStatement
* entry[medicationstatement].fullUrl = "urn:uuid:30375d1f-ee56-4303-bbe0-097cfa5f2f78"
* entry[medicationstatement].resource = 30375d1f-ee56-4303-bbe0-097cfa5f2f78

// AllergyIntolerance
* entry[allergyintolerance].fullUrl = "urn:uuid:520fcaa1-1234-40c8-b03f-58ef77c40b13"
* entry[allergyintolerance].resource = 520fcaa1-1234-40c8-b03f-58ef77c40b13

// Organization
* entry[organization].fullUrl = "urn:uuid:44e83c58-b43f-4ac1-8472-3b42d334fe8f"
* entry[organization].resource = 44e83c58-b43f-4ac1-8472-3b42d334fe8f

// Practitioner
* entry[practitioner].fullUrl = "urn:uuid:45271f7f-63ab-4946-970f-3daaaa06637e"
* entry[practitioner].resource = 45271f7f-63ab-4946-970f-3daaaa06637e

// ============================================================
// COMPOSITION (IPS)
// ============================================================

Instance: 428e9bed-1f16-4595-91b9-80ae6ac12421
InstanceOf: LACCompositionIPS
Usage: #inline

* status = #final
* type = $loinc#60591-5 "Patient Summary Document"

* subject = Reference(urn:uuid:d6bf46d8-b0ea-4307-83f8-fcdf36aea951)
* date = "2023-01-15T17:26:43+00:00"
* author = Reference(urn:uuid:e5f6a7b8-c9d0-4123-e5f6-a7b8c9d01234)
* title = "Patient Summary as of 01/15/2023"
* confidentiality = #N
* custodian = Reference(urn:uuid:44e83c58-b43f-4ac1-8472-3b42d334fe8f)

// Sección: Problemas activos
* section[sectionProblems].title = "Active Problems"
* section[sectionProblems].code = $loinc#11450-4 "Problem list Reported"
* section[sectionProblems].entry = Reference(urn:uuid:03368859-2b77-44fa-b1b1-9e303e408cc3)
* section[sectionProblems].text.status = #generated
* section[sectionProblems].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><ul><li><b>Problema</b>: Enfermedades infecciosas intestinales (A00-A09) — Moderado, activo desde 2015</li></ul></div>"

// Sección: Medicamentos
* section[sectionMedications].title = "Medication"
* section[sectionMedications].code = $loinc#10160-0 "History of Medication use Narrative"
* section[sectionMedications].entry = Reference(urn:uuid:30375d1f-ee56-4303-bbe0-097cfa5f2f78)
* section[sectionMedications].text.status = #generated
* section[sectionMedications].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><ul><li><b>Medicamento</b>: Anastrozol 1mg — 1 tableta/día, desde marzo 2015</li></ul></div>"

// Sección: Alergias
* section[sectionAllergies].title = "Allergies and Intolerances"
* section[sectionAllergies].code = $loinc#48765-2 "Allergies and adverse reactions Document"
* section[sectionAllergies].entry = Reference(urn:uuid:520fcaa1-1234-40c8-b03f-58ef77c40b13)
* section[sectionAllergies].text.status = #generated
* section[sectionAllergies].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><ul><li><b>Alergia</b>: Penicilinas — confirmada, criticidad alta</li></ul></div>"


// ============================================================
// PATIENT (inline en IPS Bundle y en la transacción)
// ============================================================

Instance: d6bf46d8-b0ea-4307-83f8-fcdf36aea951
InstanceOf: LACPatient
Usage: #inline

* meta.profile = "http://racsel.org/StructureDefinition/LACPatient"
* meta.security.system = "http://terminology.hl7.org/CodeSystem/v3-ActReason"
* meta.security.code = #HTEST

* identifier[national].system = "urn:oid:2.16.840.1.113883.3.9143.2.1.5"
* identifier[national].type = $v2-0203#TAX
* identifier[national].value = "CL/18922652-7"

* identifier[international].use = #official
* identifier[international].type = $v2-0203#PPN
* identifier[international].system = "urn:oid:2.16.840.1.113883.3.9143.2.1.1"
* identifier[international].value = "CL/F12-1234123-2"

* active = true
* name[0].use = #official
* name[0].text = "Sergio Penafiel"
* name[0].family = "Penafiel"
* name[0].given = "Sergio"
* gender = #male
* birthDate = "1994-10-13"


// ============================================================
// CONDITION (Problema activo)
// ============================================================

Instance: 03368859-2b77-44fa-b1b1-9e303e408cc3
InstanceOf: Condition
Usage: #inline

* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed

* category[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/condition-category"
* category[0].coding[0].code = #problem-list-item
* category[0].coding[0].display = "Problem List Item"
* category[0].coding[+] = $loinc#75326-9 "Problem"

* severity = $loinc#LA6751-7 "Moderate"

* code.coding[0].system = "http://hl7.org/fhir/sid/icd-10"
* code.coding[0].code = #A00-A09
* code.coding[0].display = "Intestinal infectious diseases"

* subject = Reference(urn:uuid:d6bf46d8-b0ea-4307-83f8-fcdf36aea951)
* onsetDateTime = "2015"
* recordedDate = "2016-10"


// ============================================================
// MEDICATION (Anastrozol)
// ============================================================

Instance: d5b10a87-63b9-4701-b8c6-11942ccf2d7f
InstanceOf: Medication
Usage: #inline

* code.coding[0] = $sct#108774000 "Product containing anastrozole (medicinal product)"
* code.coding[+] = urn:oid:2.16.840.1.113883.2.4.4.1#99872 "ANASTROZOL 1MG TABLET"
* code.coding[+] = urn:oid:2.16.840.1.113883.2.4.4.7#2076667 "ANASTROZOL CF TABLET FILMOMHULD 1MG"
* code.coding[+] = $atc#L02BG03 "anastrozole"


// ============================================================
// MEDICATION STATEMENT
// ============================================================

Instance: 30375d1f-ee56-4303-bbe0-097cfa5f2f78
InstanceOf: MedicationStatement
Usage: #inline

* status = #active
* medicationReference = Reference(urn:uuid:d5b10a87-63b9-4701-b8c6-11942ccf2d7f)
* subject = Reference(urn:uuid:d6bf46d8-b0ea-4307-83f8-fcdf36aea951)
* effectivePeriod.start = "2015-03"

* dosage[0].timing.repeat.count = 1
* dosage[0].timing.repeat.periodUnit = #d
* dosage[0].route = $standardterms#20053000 "Oral use"
* dosage[0].doseAndRate[0].type = $dose-rate-type#ordered "Ordered"
* dosage[0].doseAndRate[0].doseQuantity = 1 '1' "tablet"


// ============================================================
// ALLERGY INTOLERANCE (Penicilina)
// ============================================================

Instance: 520fcaa1-1234-40c8-b03f-58ef77c40b13
InstanceOf: AllergyIntolerance
Usage: #inline

* clinicalStatus = $allergyintolerance-clinical#active
* verificationStatus = $allergyintolerance-verification#confirmed
* type = #allergy
* category = #medication
* criticality = #high

* code = $sct#373270004 "Substance with penicillin structure and antibacterial mechanism of action (substance)"

* patient = Reference(urn:uuid:d6bf46d8-b0ea-4307-83f8-fcdf36aea951)
* onsetDateTime = "2010"


// ============================================================
// ORGANIZATION (Ministerio de Salud de Chile)
// ============================================================

Instance: 44e83c58-b43f-4ac1-8472-3b42d334fe8f
InstanceOf: LACOrganization
Usage: #inline

* name = "Ministerio de Salud"
* address[0].text = "Enrique Mac Iver 541, Santiago, Región Metropolitana"
* address[0].country = "CL"


// ============================================================
// PRACTITIONER (Beetje van Hulp)
// ============================================================

Instance: 45271f7f-63ab-4946-970f-3daaaa06637e
InstanceOf: Practitioner
Usage: #inline
* identifier.system = "urn:oid:2.16.528.1.1007.3.1"
* identifier.value = "129854633"
* identifier.assigner.display = "CIBG"
* active = true
* name.family = "van Hulp"
* name.given = "Beetje"
* qualification.code.coding.version = "2.7"
* qualification.code.coding = $v2-0360#MD "Doctor of Medicine"