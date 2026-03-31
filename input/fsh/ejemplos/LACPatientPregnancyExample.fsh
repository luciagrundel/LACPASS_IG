Instance: LACPatientPregnancyExample
InstanceOf: LACPatient
Usage: #example
Description: "Ejemplo de paciente embarazada de 35 años, residente en Chile"

* identifier[international].use = #official
* identifier[international].type = $v2-0203#PPN
* identifier[international].system = "urn:oid.2.16.152"
* identifier[international].value = "CL/P19234567"

* identifier[national].system = "urn:oid.2.16.152"
* identifier[national].type = $v2-0203#DL
* identifier[national].value = "CL/19.234.567-8"

* active = true
* name.use = #official
* name.text = "María González"
* name.family = "González"
* name.given = "María"
* gender = #female
* birthDate = "1991-03-15"
