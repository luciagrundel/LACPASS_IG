Profile: LACBundleIPS
Parent: http://hl7.org/fhir/uv/ips/StructureDefinition/Bundle-uv-ips
Description: "Bundle IPS, RACSEL"


* entry[composition].resource 1..1 
* entry[composition].resource only LACCompositionIPS

* entry[patient].resource 1..1
* entry[patient].resource only LACPatient