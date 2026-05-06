// ============================================================
// LACDocReferenceExample
// Perfil: LACDocReference (IHE MHD Minimal DocumentReference)
// Descripción: Referencia de documento clínico (resumen de paciente IPS)
//              para Carlos Eduardo Sánchez López (Perú)
//              Custodia: Centro de Salud Internacional Lima
// Fecha: 2026-05-06
// ============================================================

Instance: LACDocReferenceExample
InstanceOf: LACDocReference
Usage: #example
Description: "DocumentReference MHD del resumen de paciente IPS - Carlos Eduardo Sánchez López"

// --- Identificador maestro del documento (OID único) ---
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.53432.348.12973.17740.34205.4355.50220.62012"

// --- Estado ---
* status = #current

// --- Tipo de documento: Patient Summary Document (LOINC) ---
* type.coding[0].system = "http://loinc.org"
* type.coding[0].code = #60591-5
* type.coding[0].display = "Patient summary Document"

// --- Sujeto: paciente de referencia ---
* subject = Reference(LACPatientExample)

// --- Fecha de creación del documento ---
* date = "2004-10-25T23:50:50-05:00"

// --- Custodio del documento ---
* custodian = Reference(OrganizationCountryExample)

// --- Contenido del documento ---
* content[0].attachment.contentType = #application/fhir+json
* content[0].attachment.url = "urn:uuid:5c8ecb2a-8660-4e2c-960e-55998bcfff46"
* content[0].attachment.title = "Resumen de Paciente IPS - Carlos Eduardo Sánchez López"

// --- Formato IHE del documento ---
* content[0].format.system = "http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode"
* content[0].format.code = #urn:ihe:iti:xds-sd:text:2008
