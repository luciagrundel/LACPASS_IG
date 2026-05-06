// Organización: Centro de Salud Internacional Lima
// Ubicación: Lima, Perú
// Identificador: RUC 20123456789

Instance: OrganizationCountryExample
InstanceOf: LACOrganization
Usage: #example
Description: "Centro de Salud Internacional de Lima - Responsable del registro de vacunación ICVP"

* name = "Centro de Salud Internacional Lima"
* identifier.system = "urn:oid.2.16.170.1.3"
* identifier.value = "RUC-20123456789"
* identifier.use = #official
* type.coding.system = "http://terminology.hl7.org/CodeSystem/organization-type"
* type.coding.code = #prov
* type.coding.display = "Healthcare Provider"
* address.use = #work
* address.type = #physical
* address.line = "Avenida Salaverry 3500"
* address.city = "Lima"
* address.state = "Lima"
* address.postalCode = "15008"
* address.country = "PE"



// Centro de salud que administra la vacuna
Instance: OrganizationHealthCenterExample
InstanceOf: LACOrganization
Usage: #example
Description: "Centro de Salud Regional que administra la vacuna"

* name = "Centro de Salud Regional Quito"
* type.coding.system = "http://terminology.hl7.org/CodeSystem/organization-type"
* type.coding.code = #prov
* type.coding.display = "Healthcare Provider"
* address.text = "Avenida 10 de Agosto 4200, Quito, Pichincha"
* address.country = "EC"
* telecom.system = #phone
* telecom.value = "+593-2-1234567"



