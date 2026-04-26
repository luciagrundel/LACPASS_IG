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
