// ============================================================
// LACListSubmissionSetExample
// Perfil: LACList (IHE MHD Minimal SubmissionSet)
// Descripción: Submission Set MHD que agrupa el DocumentReference
//              del paciente Carlos Eduardo Sánchez López (Perú)
// Fecha: 2026-05-06
// ============================================================

Instance: LACListSubmissionSetExample
InstanceOf: LACList
Usage: #example
Description: "Submission Set MHD para el paciente Carlos Eduardo Sánchez López"

// --- Identificador del Submission Set (OID único) ---
* identifier[0].use = #usual
* identifier[0].system = "urn:ietf:rfc:3986"
* identifier[0].value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46343"

// --- Extensión sourceId (origen del submission set) ---
* extension[sourceId].valueIdentifier.value = "urn:oid:1.2.3.4"

// --- Estado y modo ---
* status = #current
* mode = #working
* title = "Submission Set - Carlos Eduardo Sánchez López"

// --- Tipo de lista: submissionset ---
* code.coding[0].system = "https://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes"
* code.coding[0].code = #submissionset

// --- Sujeto: paciente de referencia ---
* subject = Reference(LACPatientExample)

// --- Fecha de creación ---
* date = "2004-10-25T23:50:50-05:00"

// --- Entrada: DocumentReference incluido en el set ---
* entry[0].item = Reference(LACDocReferenceExample)
