Alias: $SCT = http://snomed.info/sct

Profile: LACMedicationStatement
Parent: MedicationStatement

Title: "Perfil para Completar la medicación en el informe."
//Description: "Metadatos para el registro y envío de la respuesta de interconsulta."

//---paciente
* subject only Reference(LACPatient)

* subject MS
* subject.reference 1..1 MS

* subject ^short = "Paciente sobre al que corresponde la Medicacion." 
* subject ^definition = "Paciente sobre al que corresponde la Medicacion." 

* status MS


* medicationCodeableConcept.text 0..1 MS
* medicationCodeableConcept.text ^short = "Denominación de productos farmacéuticos."
* medicationCodeableConcept from LACMedicationSNOMEDVS (required)
* dosage MS
* dosage.text MS
* dosage.text ^short = "Dosis del medicamento."

* dosage.route.text MS
* dosage.route.text ^short = "Vía de administración."

* effectiveDateTime MS
* effectiveDateTime ^short = "Fecha."





ValueSet: LACMedicationSNOMEDVS
Id: lac-medication-snomed-vs
Title: "Medicamentos SNOMED"
Description: "Conceptos SNOMED para medicamentos (descendientes de Medication)."

* ^status = #active
* ^compose.include[0].system = $SCT
* ^compose.include[=].filter[0].property = #concept
* ^compose.include[=].filter[=].op = #is-a
* ^compose.include[=].filter[=].value = "373873005" // Medication (SNOMED CT)