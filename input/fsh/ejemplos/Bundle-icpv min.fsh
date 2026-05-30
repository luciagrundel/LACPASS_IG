Alias: $loinc = http://loinc.org
Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $sct = http://snomed.info/sct
Alias: $condition-clinical = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $atc = http://www.whocc.no/atc
Alias: $allergyintolerance-clinical = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical
Alias: $v2-0360 = http://terminology.hl7.org/CodeSystem/v2-0360
Alias: $ICVPProductIds = http://smart.who.int/icvp/CodeSystem/ICVPProductIds

Instance: bundle-document-icvp-example
InstanceOf: LACBundleIPSICVP
Usage: #example
* type = #document
* identifier.system = "urn:oid:2.16.170.1.1.100000000"
* identifier.value = "IPS-icvp"
* timestamp = "2025-10-12T11:00:00Z"

//compposition
* entry[0].fullUrl = "urn:uuid:a1b2c3d4-e5f6-4789-a1b2-c3d4e5f67890"
* entry[=].resource = a1b2c3d4-e5f6-4789-a1b2-c3d4e5f67890

//paciente
* entry[+].fullUrl = "urn:uuid:b2c3d4e5-f6a7-4890-b2c3-d4e5f6a78901"
* entry[=].resource = b2c3d4e5-f6a7-4890-b2c3-d4e5f6a78901
* entry[+].fullUrl = "urn:uuid:c3d4e5f6-a7b8-4901-c3d4-e5f6a7b89012"
* entry[=].resource = c3d4e5f6-a7b8-4901-c3d4-e5f6a7b89012


//practitioner
* entry[+].fullUrl = "urn:uuid:e5f6a7b8-c9d0-4123-e5f6-a7b8c9d01234"
* entry[=].resource = e5f6a7b8-c9d0-4123-e5f6-a7b8c9d01234

//inmunization
* entry[+].fullUrl = "urn:uuid:e5f6a7b8-c9d0-4123-e5f6-a7b8c9d01236"
* entry[=].resource = e5f6a7b8-c9d0-4123-e5f6-a7b8c9d01236

Instance: a1b2c3d4-e5f6-4789-a1b2-c3d4e5f67890
InstanceOf: LACCompositionICVP
Usage: #inline
* status = #final
* type = $loinc#60591-5 "Patient summary Document"
* subject = Reference(urn:uuid:b2c3d4e5-f6a7-4890-b2c3-d4e5f6a78901)
* date = "2025-10-12T11:00:00Z"

* author = Reference(urn:uuid:e5f6a7b8-c9d0-4123-e5f6-a7b8c9d01234)
* custodian = Reference(urn:uuid:c3d4e5f6-a7b8-4901-c3d4-e5f6a7b89012)
* title = "International Patient Summary - ICVP-Gaby Moreno"

* section[sectionProblems].title = "Problemas Activos"
* section[sectionProblems].code = $loinc#11450-4 "Problem list"
* section[sectionProblems].text.status = #generated
* section[sectionProblems].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Lista de problemas activos del paciente</div>"
//* section[sectionProblems].emptyReason = 

* section[sectionMedications].title = "Medication"
* section[sectionMedications].code = $loinc#10160-0 "History of Medication use Narrative"
* section[sectionMedications].text.status = #generated
* section[sectionMedications].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><ul><li><div><b>Medication Name</b>: Oral anastrozole 1mg tablet</div><div><b>Code</b>: <span/></div><div><b>Status</b>: <span>Active, started March 2015</span></div><div>Instructions: Take 1 time per day</div></li></ul></div>"
//* section[sectionProblems].emptyReason = 


* section[sectionAllergies].title = "Alergias e Intolerancias"
* section[sectionAllergies].code = $loinc#48765-2 "Allergies and adverse reactions"
* section[sectionAllergies].text.status = #generated
* section[sectionAllergies].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Alergias e intolerancias conocidas</div>"
//* section[sectionProblems].emptyReason = 


* section[sectionImmunizations].title = "Inmunizaciones"
* section[sectionImmunizations].code = $loinc#11369-6 "Immunization history"
* section[sectionImmunizations].text.status = #generated
* section[sectionImmunizations].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Inmunizaciones recibidas</div>"
* section[sectionImmunizations].entry = Reference(urn:uuid:e5f6a7b8-c9d0-4123-e5f6-a7b8c9d01236)

Instance: b2c3d4e5-f6a7-4890-b2c3-d4e5f6a78901
InstanceOf: Patient
Usage: #inline
* identifier[0].system = "urn:oid.2.16.591"
* identifier[=].type = $v2-0203#NI
* identifier[=].value = "GT098765"
* identifier[+].use = #official
* identifier[=].type = $v2-0203#PPN
* identifier[=].system = "urn:oid.2.16.591"
* identifier[=].value = "GT098765"
* name.use = #official
* name.family = "Moreno"
* name.given = "Gaby"
* gender = #female
* birthDate = "1981-12-16"
* address.text = "Guatemala"
* address.country = "GT"

Instance: c3d4e5f6-a7b8-4901-c3d4-e5f6a7b89012
InstanceOf: Organization
Usage: #inline
* name = "Clínica Hospital San Fernando (ID E7F8)"
* address.text = "Via España, Calle 51 y 52, Ciudad de Panamá"
* address.country = "PA"


Instance: e5f6a7b8-c9d0-4123-e5f6-a7b8c9d01234
InstanceOf: Practitioner
Usage: #inline
* name.family = "De Obaldía"
* name.given = "Isabel"
* qualification.code = $v2-0360#MD "Doctor of Medicine"

Instance: e5f6a7b8-c9d0-4123-e5f6-a7b8c9d01236
InstanceOf: Immunization
Usage: #inline
* meta.profile = "http://lacpass.racsel.org/StructureDefinition/lac-immunization"
* extension.url = "http://smart.who.int/pcmt/StructureDefinition/ProductID"
* extension.valueCoding = $ICVPProductIds#PolioVaccineOralOPVTrivaProductfa4849f7532d522134f4102063af1617
* status = #completed
* vaccineCode.coding[0] = $ICVPProductIds#PolioVaccineOralOPVTrivaProductfa4849f7532d522134f4102063af1617 "Oral poliomyelitis vaccine (OPV)"
* vaccineCode.coding[+] = $mms#XM0N50 "Vacuna para la poliomielitis"
* vaccineCode.text = "Vacuna antipoliomielítica oral (OPV)"
* patient = Reference(urn:uuid:b2c3d4e5-f6a7-4890-b2c3-d4e5f6a78901)
* occurrenceDateTime = "2021-08-09T00:00:00Z"
* lotNumber = "123123123"
* performer.actor = Reference(urn:uuid:e5f6a7b8-c9d0-4123-e5f6-a7b8c9d01234)