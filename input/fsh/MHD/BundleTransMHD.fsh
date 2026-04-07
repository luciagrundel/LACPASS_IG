Alias: $LACBundleIPS = http://racsel.org/StructureDefinition/LACBundleIPS
Alias: $LACBundleIPSICVP = http://racsel.org/StructureDefinition/LACBundleIPSICVP

Profile: LACBundleTransactionMHD
Parent: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.ProvideBundle
Description: "LACPass ITI-65 Minimal Provide Document Transaction. This profile derives from the [MHD ITI-65 Minimal Provde Document](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.Minimal.ProvideBundle.html) profile with customizations to use the profiles defined in this implementation guide."


* entry[FhirDocuments].resource 1..1
* entry[FhirDocuments].resource only $LACBundleIPS  // or $LACBundleIPSICVP


* entry[Patient].resource 1..1
* entry[Patient].resource only LACPatient


* entry[DocumentRefs].resource 1..1
* entry[DocumentRefs].resource only LACDocReference

* entry[SubmissionSet].resource 1..1
* entry[SubmissionSet].resource only LACList


