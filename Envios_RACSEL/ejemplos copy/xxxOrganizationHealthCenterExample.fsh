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
