Instance: LACPatientExample
InstanceOf: LACPatient
Usage: #example

* identifier[international].use = #official
* identifier[international].type = $v2-0203#PPN
* identifier[international].system = "urn:oid.2.16.152"
* identifier[international].value = "CL/F12-1234123-2"

* identifier[national].system = "urn:oid.2.16.152"
* identifier[national].type = $v2-0203#TAX
* identifier[national].value = "CL/18922652-7"

* active = true
* name.use = #official
* name.text = "Sergio Penafiel"
* name.family = "Penafiel"
* name.given = "Sergio"
* gender = #male
* birthDate = "1994-10-13"




// Paciente que recibe la vacuna de fiebre amarilla
Instance: PatientYellowFeverExample
InstanceOf: LACPatient
Usage: #example
Description: "Paciente adulta que recibe vacuna de fiebre amarilla"

* identifier[international].use = #official
* identifier[international].type = $v2-0203#PPN
* identifier[international].system = "urn:oid.2.16.152"
* identifier[international].value = "EC/P12345678"

* identifier[national].system = "urn:oid.2.16.152"
* identifier[national].type = $v2-0203#DL
* identifier[national].value = "EC/1752345678-0"

* active = true
* name.use = #official
* name.text = "Carla López Rodríguez"
* name.family = "López Rodríguez"
* name.given = "Carla"
* gender = #female
* birthDate = "1988-07-22"


// Paciente: Carlos Eduardo Sánchez López de Perú
// Identificadores: Pasaporte PE-B9876543 y DNI 12345678
// Paciente varón, nacido 22/03/1996

Instance: PatientICVPVaccinationExample
InstanceOf: LACPatient
Usage: #example
Description: "Paciente Carlos Eduardo Sánchez López de Perú con pasaporte e identificación nacional"

* identifier[international].use = #official
* identifier[international].type = $v2-0203#PPN
* identifier[international].system = "urn:oid.2.16.840.1.113883.4.330"
* identifier[international].value = "PE-B9876543"

* identifier[national].system = "urn:oid.2.16.170.1.2"
* identifier[national].type = $v2-0203#DL
* identifier[national].value = "12345678"

* active = true
* name.use = #official
* name.text = "Carlos Eduardo Sánchez López"
* name.family = "Sánchez López"
* name.given[0] = "Carlos"
* name.given[1] = "Eduardo"
* gender = #male
* birthDate = "1996-03-22"
