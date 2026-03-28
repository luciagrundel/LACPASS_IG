Profile: LACCompositionIPS
Parent: http://hl7.org/fhir/uv/ips/StructureDefinition/Composition-uv-ips
//Id: lac-composition-ips
Description: "Patient Summary Composition resource. This profile derives from the [International Patient summary](https://build.fhir.org/ig/HL7/fhir-ips/) with customizations for the entries to use the profiles defined in this implementation guide."


// Make use of LAC Patient, LAC Immunization and LAC Organization
* subject 1..1 MS 
* subject only Reference(LACPatient)
* custodian 1..1 
* custodian only Reference(LACOrganization)