// Bundle IPS ICVP con registro de vacunación de fiebre amarilla
Instance: BundleYellowFeverICVPExample
InstanceOf: LACBundleIPSICVP
Usage: #example
Description: "Bundle ICVP completo con registro de vacunación de fiebre amarilla. Contiene composición, paciente, organización, inmunización, condiciones, alergias y medicamentos."

* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:12345678-1234-1234-1234-123456789012"
* type = #document
* timestamp = 2025-03-15T10:30:00Z

// Composición (requerida)
* entry[0].fullUrl = "urn:uuid:composition-001"
* entry[0].resource = CompositionYellowFeverExample

// Paciente (requerido)
* entry[1].fullUrl = "urn:uuid:patient-001"
* entry[1].resource = PatientYellowFeverExample

// Organización (referenciada por Composition)
* entry[2].fullUrl = "urn:uuid:organization-001"
* entry[2].resource = OrganizationHealthCenterExample

// Inmunización (referenciada en Composition - section Immunizations)
* entry[3].fullUrl = "urn:uuid:immunization-001"
* entry[3].resource = ImmunizationYellowFeverExample

// Condition - Diagnóstico (referenciado en Composition - section Problem List)
* entry[4].fullUrl = "urn:uuid:condition-001"
* entry[4].resource = ConditionHypertensionExample

// AllergyIntolerance - Alergia (referenciado en Composition - section Allergies)
* entry[5].fullUrl = "urn:uuid:allergy-001"
* entry[5].resource = AllergyIntolerancePenicillinExample

// Medication - Medicamento (referenciado en MedicationStatement)
* entry[6].fullUrl = "urn:uuid:medication-001"
* entry[6].resource = MedicationAntihypertensiveExample

// MedicationStatement - Medicamento en uso (referenciado en Composition - section Medications)
* entry[7].fullUrl = "urn:uuid:medication-statement-001"
* entry[7].resource = MedicationStatementEnalaprilExample
