## 📋 Información General / General Information

### ES - Español

**Nombre del Proyecto**: Guía de Implementación PH4H - RACSEL (LACPASS)

**Descripción**: Guía de Implementación FHIR basada en estándares internacionales de salud digital que define perfiles, extensiones y restricciones para la interoperabilidad de sistemas de información en salud en Latinoamérica. El proyecto LACPASS (Latin America and Caribbean Paving the path to better health Solutions) integra:

- **IPS-LAC**: Resumen Internacional de Paciente adaptado para Latinoamérica
- **IPS-ICVP**: Certificado de Vacunación Internacional estandarizado
- **MHD**: Mobile Health Data para intercambio de documentos clínicos

**Identificador Único**: `racsel.org`

**URL Canónica**: `http://racsel.org`

**Estado del Proyecto**: DRAFT (Borrador)

**Versión Actual**: 0.2

**Versión FHIR**: 4.0.1

---

### EN - English

**Project Name**: PH4H - RACSEL Implementation Guide (LACPASS)

**Description**: FHIR Implementation Guide based on international digital health standards that defines profiles, extensions, and constraints for healthcare information system interoperability in Latin America. The LACPASS (Latin America and Caribbean Paving the path to better health Solutions) project integrates:

- **IPS-LAC**: International Patient Summary adapted for Latin America
- **IPS-ICVP**: Standardized International Vaccination Certificate
- **MHD**: Mobile Health Data for clinical document exchange

**Unique Identifier**: `racsel.org`

**Canonical URL**: `http://racsel.org`

**Project Status**: DRAFT

**Current Version**: 0.2

**FHIR Version**: 4.0.1

---

## 👥 Responsables / Responsibles

| Aspecto / Aspect | Organización | Rol |
|---|---|---|
| **Publisher / Editorial** | RACSEL | Administrador del proyecto |
| **Jurisdicción / Jurisdiction** | Mundo / World | Aplicación global |
| **Copyright** |  BID Bienes Públicos |

---

## 📊 Alcance del Proyecto / Project Scope

### ES - Perfiles FHIR Definidos

**Total de Perfiles**: 8

1. **LACPatient** - Perfil de Paciente para Latinoamérica
2. **LACOrganization** - Perfil de Organización de Salud
3. **LACCompositionIPS** - Composición del Resumen Internacional de Paciente
4. **LACCompositionICVP** - Composición del Certificado de Vacunación Internacional
5. **LACBundleIPS** - Bundle para transacciones de IPS
6. **LACBundleIPSICVP** - Bundle integrado para IPS + ICVP
7. **LACBundleTransactionMHD** - Bundle para transacciones MHD
8. **LACDocReference** - Referencia de Documento
9. **LACList** - Lista de recursos

### EN - Defined FHIR Profiles

**Total Profiles**: 8

1. **LACPatient** - Patient Profile for Latin America
2. **LACOrganization** - Healthcare Organization Profile
3. **LACCompositionIPS** - International Patient Summary Composition
4. **LACCompositionICVP** - International Vaccination Certificate Composition
5. **LACBundleIPS** - Bundle for IPS transactions
6. **LACBundleIPSICVP** - Integrated Bundle for IPS + ICVP
7. **LACBundleTransactionMHD** - Bundle for MHD transactions
8. **LACDocReference** - Document Reference
9. **LACList** - Resource List


## 🔗 Dependencias / Dependencies

| Dependencia | Versión | Propósito | Dependency | Version | Purpose |
|---|---|---|---|---|---|
| `hl7.fhir.uv.ips` | 2.0.0-ballot | Resumen Internacional de Paciente | HL7 IPS Base Profile | 2.0.0-ballot | International Patient Summary base |
| `ihe.iti.mhd` | 4.2.2 | Mobile Health Data | IHE Mobile Health Data | 4.2.2 | Mobile Health Data transactions |
| `smart.who.int.icvp` | 0.2.0 | Certificado de Vacunación Internacional | WHO SMART ICVP | 0.2.0 | WHO International Vaccination Certificate |

---

## 🎯 Casos de Uso / Use Cases

### ES - Casos de Uso Principales

1. **IPS-LAC**: Interoperabilidad de Resúmenes Médicos
   - Compartir datos clínicos de pacientes entre países LAC
   - Integración de historiales médicos transfronterizos
   - Cumplimiento con estándares HL7 FHIR

2. **IPS-ICVP**: Certificados de Vacunación Internacionales
   - Verificación de vacunaciones COVID-19, fiebre amarilla, rabia
   - Viajes internacionales con constancia digital
   - Programas de salud pública

3. **MHD**: Intercambio de Documentos Clínicos
   - Almacenamiento y acceso a documentos clínicos
   - Transacciones seguidas de Mobile Health Data
   - Compatibilidad con sistemas legados

### EN - Primary Use Cases

1. **IPS-LAC**: Medical Summary Interoperability
   - Share patient clinical data between LAC countries
   - Integration of cross-border medical records
   - Compliance with HL7 FHIR standards

2. **IPS-ICVP**: International Vaccination Certificates
   - Verification of COVID-19, yellow fever, rabies vaccinations
   - International travel with digital proof
   - Public health programs

3. **MHD**: Clinical Document Exchange
   - Storage and access to clinical documents
   - Mobile Health Data-based transactions
   - Legacy system compatibility

---