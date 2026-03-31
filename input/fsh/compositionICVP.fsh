Profile: LACCompositionICVP
//Parent: https://smart.who.int/icvp/0.2.0/StructureDefinition-Composition-uv-ips-ICVP.html

Parent: http://smart.who.int/icvp/StructureDefinition/Composition-uv-ips-ICVP

//Id: lac-composition-icvp
Description: "Patient Summary Composition resource for ICVP. This profile derives from the [International Patient summary](https://build.fhir.org/ig/HL7/fhir-ips/) with customizations for the entries to use the profiles defined in this implementation guide."

// Make use of LAC Patient, LAC Immunization and LAC Organization
* subject 1..1 MS 
* subject only Reference(LACPatient)
* custodian 1..1 
* custodian only Reference(LACOrganization)