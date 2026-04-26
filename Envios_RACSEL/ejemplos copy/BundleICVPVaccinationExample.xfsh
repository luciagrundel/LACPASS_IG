// Bundle ICVP: Certificado Internacional de Vacunación
// Contiene: Composición, Paciente, Organización, e Inmunizaciones (Fiebre Amarilla, COVID-19 x2, Rabia)
// Secciones de problemas, alergias y medicamentos están vacías con emptyReason

Instance: BundleICVPVaccinationExample
InstanceOf: LACBundleIPSICVP
Usage: #example
Description: "Bundle ICVP enfocado en certificado de vacunación internacional. Contiene composición, paciente, organización e inmunizaciones. Secciones de problemas, alergias y medicamentos están vacías con emptyReason según IPS-ICVP constraints."

* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:b3a2b4d8-7e9c-4a2b-8f5d-1c9e7a3d5b1f"
* type = #document
* timestamp = 2025-04-04T10:00:00Z

// ===== ENTRY 0: Composición ICVP (requerida) =====
* entry[0].fullUrl = "urn:uuid:composition-icvp-vaccination-001"
* entry[0].resource = CompositionICVPVaccinationExample

// ===== ENTRY 1: Paciente (requerido) =====
* entry[1].fullUrl = "urn:uuid:patient-icvp-vaccination-001"
* entry[1].resource = PatientICVPVaccinationExample

// ===== ENTRY 2: Organización (referenciada por Composition) =====
* entry[2].fullUrl = "urn:uuid:organization-icvp-vaccination-001"
* entry[2].resource = OrganizationICVPVaccinationExample

// ===== ENTRY 3: Inmunización Fiebre Amarilla =====
* entry[3].fullUrl = "urn:uuid:immunization-yellowfever-icvp-001"
* entry[3].resource = ImmunizationYellowFeverICVPExample

// ===== ENTRY 4: Inmunización COVID-19 Dosis 1 =====
* entry[4].fullUrl = "urn:uuid:immunization-covid19-dose1-icvp-001"
* entry[4].resource = ImmunizationCOVID19Dose1ICVPExample

// ===== ENTRY 5: Inmunización COVID-19 Dosis 2 =====
* entry[5].fullUrl = "urn:uuid:immunization-covid19-dose2-icvp-001"
* entry[5].resource = ImmunizationCOVID19Dose2ICVPExample

// ===== ENTRY 6: Inmunización Rabia (post-exposición) =====
* entry[6].fullUrl = "urn:uuid:immunization-rabies-icvp-001"
* entry[6].resource = ImmunizationRabiesICVPExample
