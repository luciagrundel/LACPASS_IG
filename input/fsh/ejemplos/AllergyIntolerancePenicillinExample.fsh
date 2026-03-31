// Alergia - Penicilina
Instance: AllergyIntolerancePenicillinExample
InstanceOf: AllergyIntolerance
Usage: #inline
Description: "Registro de alergia a penicilina en medicamentos"

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

* patient = Reference(PatientYellowFeverExample)
* recordedDate = "2015-06-15T12:00:00Z"

* reaction.manifestation.coding.system = "http://snomed.info/sct"
* reaction.manifestation.coding.code = #271807003
* reaction.manifestation.coding.display = "Skin rash"

* reaction.severity = #moderate
