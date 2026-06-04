// ============================================================
// BundleTransMHDITExample
// Perfil: LACBundleTransactionMHDIT
// Descripción: Bundle de transacción ITI-65 para envío de respuesta
//              de interconsulta transfronteriza (Panamá → Uruguay).
//              Paciente: Carlos Eduardo Sánchez López (Perú)
//              Especialista respondente: Dra. María García (Panamá)
// Fecha: 2026-05-18
// ============================================================

Instance: BundleTransMHDITExample
InstanceOf: LACBundleTransactionMHDIT
Usage: #example
Title: "Transacción ITI-65 - Respuesta de Interconsulta (Panamá → Uruguay)"
Description: "Bundle de transacción MHD ITI-65 que envía la respuesta de interconsulta entre países LAC. Incluye el SubmissionSet, DocumentReference, Bundle-documento de respuesta y el recurso Patient."

* type = #transaction
* timestamp = "2026-05-18T09:00:00-05:00"

// --- SubmissionSet ---
* entry[SubmissionSet].fullUrl = "urn:uuid:a1b2c3d4-e5f6-7890-abcd-ef1234567890"
* entry[SubmissionSet].resource = a1b2c3d4-e5f6-7890-abcd-ef1234567890
* entry[SubmissionSet].request.method = #POST
* entry[SubmissionSet].request.url = "List"

// --- DocumentReference ---
* entry[DocumentRefs].fullUrl = "urn:uuid:b2c3d4e5-f6a7-8901-bcde-f12345678901"
* entry[DocumentRefs].resource = b2c3d4e5-f6a7-8901-bcde-f12345678901
* entry[DocumentRefs].request.method = #POST
* entry[DocumentRefs].request.url = "DocumentReference"

// --- Bundle Documento de Respuesta (LACBundleDocIT) ---
* entry[FhirDocuments].fullUrl = "urn:uuid:c3d4e5f6-a7b8-9012-cdef-123456789012"
* entry[FhirDocuments].resource = c3d4e5f6-a7b8-9012-cdef-123456789012
* entry[FhirDocuments].request.method = #POST
* entry[FhirDocuments].request.url = "Bundle"

// --- Paciente ---
* entry[Patient].fullUrl = "urn:uuid:d5e6f7a8-b9c0-1234-efab-567890123456"
* entry[Patient].resource = d5e6f7a8-b9c0-1234-efab-567890123456
* entry[Patient].request.method = #POST
* entry[Patient].request.url = "Patient"


// ============================================================
// SUBMISSION SET (LACList)
// ============================================================

Instance: a1b2c3d4-e5f6-7890-abcd-ef1234567890
InstanceOf: LACList
Usage: #inline
Title: "SubmissionSet - Respuesta Interconsulta"

* text.status = #extensions
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">SubmissionSet - Respuesta de Interconsulta Transfronteriza</div>"

// Extensión sourceId (origen: nodo Panamá)
* extension[sourceId].valueIdentifier.value = "urn:oid:2.16.591.1.1.1"

// Identificador del SubmissionSet
* identifier[0].use = #usual
* identifier[0].system = "urn:ietf:rfc:3986"
* identifier[0].value = "urn:oid:1.2.840.113556.1.8000.2554.11111.22222.33333.44444.55555.66666.77777.88888"

* status = #current
* mode = #working
* title = "SubmissionSet - Carlos Eduardo Sánchez López"

* code.coding[0].system = "https://profiles.ihe.net/ITI/MHD/CodeSystem/MHDlistTypes"
* code.coding[0].code = #submissionset

// Referencia al paciente dentro del mismo bundle
* subject = Reference(urn:uuid:d5e6f7a8-b9c0-1234-efab-567890123456)
* date = "2026-05-18T09:00:00-05:00"

// Referencia al DocumentReference incluido en este set
* entry[0].item = Reference(urn:uuid:b2c3d4e5-f6a7-8901-bcde-f12345678901)


// ============================================================
// DOCUMENT REFERENCE (LACDocReferenceIT)
// ============================================================

Instance: b2c3d4e5-f6a7-8901-bcde-f12345678901
InstanceOf: LACDocReferenceIT
Usage: #inline
Title: "DocumentReference - Nota de Contra-referencia"

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>DocumentReference para la respuesta de interconsulta de Carlos Eduardo Sánchez López atendido por Dra. María García (Panamá).</p></div>"

// Identificador maestro del documento
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.99999.88888.77777.66666.55555.44444.33333.22222"

// Estado: fijado por el perfil
* status = #current

// Tipo: Referral note (fijado por el perfil)
* type = http://loinc.org#57133-1 "Referral note"
* type.text = "Nota de Contra-referencia / Respuesta de Interconsulta"

// Sujeto: paciente en el bundle
* subject = Reference(urn:uuid:d5e6f7a8-b9c0-1234-efab-567890123456)

// Fecha de generación
* date = "2026-05-18T09:00:00-05:00"

// Autor: especialista respondente
* author[0].display = "Dra. María García - Especialista en Dermatología - Panamá"

// Contenido: referencia al Bundle documento dentro del transaction
* content[0].attachment.contentType = #application/fhir+json
* content[0].attachment.url = "urn:uuid:c3d4e5f6-a7b8-9012-cdef-123456789012"
* content[0].attachment.title = "Respuesta de Interconsulta - Carlos Eduardo Sánchez López"

// Formato IHE
* content[0].format.system = "http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode"
* content[0].format.code = #urn:ihe:iti:xds-sd:text:2008

// Trazabilidad: referencia a la solicitud original y al IPS utilizado
* context.related[0].identifier.system = "https://salud.gub.uy/interconsultas"
* context.related[0].identifier.value = "UY-PA-2026-IC-001"
* context.related[0].display = "Solicitud original de interconsulta - Uruguay"

* context.related[1].reference = "http://nodo.salud.gub.uy/fhir/Bundle/ips-carlos-sanchez"
* context.related[1].display = "IPS del paciente utilizado como antecedente clínico"


// ============================================================
// BUNDLE DOCUMENTO DE RESPUESTA (LACBundleDocIT)
// ============================================================

Instance: c3d4e5f6-a7b8-9012-cdef-123456789012
InstanceOf: LACBundleDocIT
Usage: #inline
Title: "Bundle Documento - Respuesta Clínica de Interconsulta"

* meta.profile = "http://racsel.org/StructureDefinition/LACBundleDocIT"

* identifier.system = "urn:ietf:rfc:4122"
* identifier.value = "f1a2b3c4-d5e6-7890-abcd-ef1234567890"

* type = #document
* timestamp = "2026-05-18T09:00:00-05:00"

// --- Entrada: Composition de respuesta ---
* entry[Composition].fullUrl = "urn:uuid:e6f7a8b9-c0d1-2345-fabc-678901234567"
* entry[Composition].resource = e6f7a8b9-c0d1-2345-fabc-678901234567

// --- Entrada: Paciente (misma instancia que el bundle padre) ---
* entry[Patient].fullUrl = "urn:uuid:d5e6f7a8-b9c0-1234-efab-567890123456"
* entry[Patient].resource = d5e6f7a8-b9c0-1234-efab-567890123456


// ============================================================
// COMPOSITION (LACCompositionIT)
// ============================================================

Instance: e6f7a8b9-c0d1-2345-fabc-678901234567
InstanceOf: LACCompositionIT
Usage: #inline
Title: "Composition - Nota de Consulta / Respuesta de Interconsulta"

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Respuesta de interconsulta transfronteriza emitida por la Dra. María García, especialista en Dermatología, Panamá.</p></div>"

// Estado: fijado por el perfil
* status = #final

// Tipo: Consultation note (fijado por el perfil)
* type = http://loinc.org#11488-4 "Consultation note"

// Sujeto
* subject = Reference(urn:uuid:d5e6f7a8-b9c0-1234-efab-567890123456)

// Fecha de la composición
* date = "2026-05-18T09:00:00-05:00"

// Autor
* author[0].display = "Dra. María García - Especialista en Dermatología - Hospital Santo Tomás, Panamá"

// Título
* title = "Respuesta de Interconsulta Transfronteriza - Dermatología"

// Sección: Resultado de la Evaluación (obligatoria en el perfil)
* section[ResultadoEvaluacion].title = "Resultado de la Evaluación"
* section[ResultadoEvaluacion].code = http://loinc.org#55112-7 "Document summary"
* section[ResultadoEvaluacion].text.status = #generated
* section[ResultadoEvaluacion].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h3>Respuesta Clínica</h3><p>Tras revisar los antecedentes del paciente Carlos Eduardo Sánchez López (Perú) enviados en el IPS adjunto, se concluye que el paciente presenta una dermatitis por contacto de tipo alérgica. No se observan signos de malignidad cutánea. Se recomienda tratamiento tópico con corticosteroides de baja potencia durante 2 semanas y evitar el agente desencadenante identificado (níquel). Si los síntomas persisten, se sugiere patch test de confirmación.</p></div>"


// ============================================================
// PACIENTE (LACPatient)
// ============================================================

Instance: d5e6f7a8-b9c0-1234-efab-567890123456
InstanceOf: LACPatient
Usage: #inline
Title: "Paciente - Carlos Eduardo Sánchez López (Perú)"

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Carlos Eduardo Sánchez López, varón, nacido el 22/03/1996, Perú.</p></div>"

// Identificador internacional: pasaporte
* identifier[international].use = #official
* identifier[international].type = $v2-0203#PPN
* identifier[international].system = "urn:oid:2.16.840.1.113883.4.330"
* identifier[international].value = "PE-B9876543"

// Identificador nacional: DNI peruano
* identifier[national].system = "urn:oid:2.16.170.1.2"
* identifier[national].type = $v2-0203#DL
* identifier[national].value = "12345678"

* active = true
* name.use = #official
* name.text = "Carlos Eduardo Sánchez López"
* name.family = "Sánchez López"
* name.given[0] = "Carlos"
* name.given[1] = "Eduardo"
* gender = #male
* birthDate = "1996-03-22"
