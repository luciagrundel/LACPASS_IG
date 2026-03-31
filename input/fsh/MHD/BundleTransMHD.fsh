Profile: LACBundleTransactionMHD
Parent: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.ProvideBundle
Description: "LACPass ITI-65 Minimal Provide Document Transaction. This profile derives from the [MHD ITI-65 Minimal Provde Document](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.Minimal.ProvideBundle.html) profile with customizations to use the profiles defined in this implementation guide."


* entry[FhirDocuments].resource 1..1
* entry[FhirDocuments].resource only LACBundleIPS // or LACBundleIPSICVP)
 //only Reference(Practitioner or Patient)


* entry[Patient].resource 1..1
* entry[Patient].resource only LACPatient