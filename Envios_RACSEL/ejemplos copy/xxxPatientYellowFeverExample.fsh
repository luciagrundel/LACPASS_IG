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
