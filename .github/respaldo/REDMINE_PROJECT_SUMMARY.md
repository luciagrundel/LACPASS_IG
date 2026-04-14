# LACPASS Implementation Guide - Resumen del Proyecto para Redmine

---

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
| **Copyright** | Organización Panamericana de la Salud (OPS) 2024+ | OPS / BID Bienes Públicos |

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

### Ejemplos Incluidos / Included Examples

**Total de Ejemplos**: 13

| Recurso | Tipo | Descripción | Resource | Type | Description |
|---|---|---|---|---|---|
| Patient-LACPatientExample | Paciente | Ejemplo básico de paciente LAC | Patient-LACPatientExample | Patient | Basic LAC patient example |
| Patient-LACPatientPregnancyExample | Paciente | Paciente embarazada | Patient-LACPatientPregnancyExample | Patient | Pregnant patient |
| Patient-PatientICVPVaccinationExample | Paciente | Paciente para ICVP | Patient-PatientICVPVaccinationExample | Patient | Patient for ICVP |
| Patient-PatientYellowFeverExample | Paciente | Paciente con fiebre amarilla | Patient-PatientYellowFeverExample | Patient | Patient with yellow fever |
| Organization-OrganizationHealthCenterExample | Organización | Centro de salud | Organization-OrganizationHealthCenterExample | Organization | Health center |
| Organization-OrganizationICVPVaccinationExample | Organización | Centro de vacunación ICVP | Organization-OrganizationICVPVaccinationExample | Organization | ICVP vaccination center |
| Immunization-ImmunizationCOVID19Dose1ICVPExample | Inmunización | Dosis 1 COVID-19 | Immunization-ImmunizationCOVID19Dose1ICVPExample | Immunization | COVID-19 Dose 1 |
| Immunization-ImmunizationCOVID19Dose2ICVPExample | Inmunización | Dosis 2 COVID-19 | Immunization-ImmunizationCOVID19Dose2ICVPExample | Immunization | COVID-19 Dose 2 |
| Immunization-ImmunizationRabiesICVPExample | Inmunización | Rabia ICVP | Immunization-ImmunizationRabiesICVPExample | Immunization | Rabies ICVP |
| Immunization-ImmunizationYellowFeverExample | Inmunización | Fiebre amarilla | Immunization-ImmunizationYellowFeverExample | Immunization | Yellow fever |
| Immunization-ImmunizationYellowFeverICVPExample | Inmunización | Fiebre amarilla ICVP | Immunization-ImmunizationYellowFeverICVPExample | Immunization | Yellow fever ICVP |
| Composition-CompositionICVPVaccinationExample | Composición | ICVP de vacunación | Composition-CompositionICVPVaccinationExample | Composition | Vaccination ICVP |
| Composition-CompositionYellowFeverExample | Composición | ICVP de fiebre amarilla | Composition-CompositionYellowFeverExample | Composition | Yellow fever ICVP |

### Bundles de Ejemplo / Example Bundles

| Bundle | Casos de Uso | Archivo |
|---|---|---|
| **Bundle-BundleIPS** | Resumen completo de paciente | Bundle-BundleIPSCompleteExample.json |
| **Bundle-ICVP-Vaccination** | Certificado de vacunación completo | Bundle-BundleICVPVaccinationExample.json |
| **Bundle-ICVP-YellowFever** | Certificado de fiebre amarilla | Bundle-BundleYellowFeverICVPExample.json |
| **Bundle-MHD-Transaction** | Transacción MHD mínima | Bundle-BundleTransactionMHDMinimalExample.json |

---

## 🔗 Dependencias / Dependencies

| Dependencia | Versión | Propósito | Dependency | Version | Purpose |
|---|---|---|---|---|---|
| `hl7.fhir.uv.ips` | 2.0.0-ballot | Resumen Internacional de Paciente | HL7 IPS Base Profile | 2.0.0-ballot | International Patient Summary base |
| `ihe.iti.mhd` | 4.2.2 | Mobile Health Data | IHE Mobile Health Data | 4.2.2 | Mobile Health Data transactions |
| `smart.who.int.icvp` | 0.2.0 | Certificado de Vacunación Internacional | WHO SMART ICVP | 0.2.0 | WHO International Vaccination Certificate |

---

## 📁 Estructura del Proyecto / Project Structure

```
d:\24.IG_RACSEL/
├── sushi-config.yaml           # Configuración principal del proyecto
├── ig.ini                       # Configuración del compilador
├── README.md                    # Documentación del repositorio
├── _genonce.bat/sh              # Scripts de generación única
├── _gencontinuous.bat/sh        # Scripts de generación continua
├── _updatePublisher.bat/sh      # Scripts de actualización del compilador
│
├── fsh-generated/               # Salida generada por SUSHI
│   ├── resources/               # Definiciones FHIR compiladas
│   ├── data/                    # Datos generados
│   └── includes/                # Incluidos de template
│
├── input/
│   ├── pagecontent/             # Contenido Markdown de páginas
│   │   ├── index.md             # Página de inicio
│   │   ├── base.md              # Base de la guía
│   │   ├── IPS-LAC.md           # Documentación IPS-LAC
│   │   ├── IPS-ICVP.md          # Documentación IPS-ICVP
│   │   ├── MHD.md               # Documentación MHD
│   │   ├── Historial.md         # Historial de versiones
│   │   └── Descarga.md          # Página de descargas
│   │
│   ├── fsh/                     # Definiciones FHIR Shorthand
│   │   ├── alias.fsh            # Aliases
│   │   ├── patient.fsh          # Perfil Patient
│   │   ├── organization.fsh     # Perfil Organization
│   │   ├── compositionIPS.fsh   # Composition IPS
│   │   ├── compositionICVP.fsh  # Composition ICVP
│   │   ├── bundle-ips.fsh       # Bundle IPS
│   │   ├── bundle-icpv.fsh      # Bundle ICVP
│   │   ├── MHD/                 # Perfiles MHD
│   │   └── ejemplos/            # Ejemplos en FSH
│   │
│   ├── ejemplosJSON/            # Ejemplos en formato JSON
│   │   └── [Ejemplos por recurso]
│   │
│   ├── images/                  # Imágenes y diagramas
│   └── ignoreWarnings.txt       # Advertencias a ignorar
│
├── input-cache/                 # Cache del compilador
│   ├── schemas/                 # Esquemas FHIR
│   └── txcache/                 # Cache de terminología
│
├── output/                      # Salida compilada
│   ├── index.html               # Página de inicio web
│   ├── artifacts.html           # Página de artefactos
│   ├── [Recursos compilados]    # HTML, JSON, XML, TTL
│   └── [Ejemplos compilados]
│
├── template/                    # Template FHIR personalizado
├── template_ph4h/               # Template PH4H
│
└── .github/
    ├── agents/                  # Agentes personalizados
    ├── prompts/                 # Prompts personalizados
    └── skills/                  # Skills de validación QA
```

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

## ✅ Validación y Control de Calidad / Validation and QA

### Requisitos de Validación

| Aspecto | Requisito | Aspect | Requirement |
|---|---|---|---|
| **Conformidad FHIR** | Todos los perfiles deben validar contra FHIR 4.0.1 | **FHIR Conformance** | All profiles must validate against FHIR 4.0.1 |
| **Restricciones de Cardinalidad** | Definidas en cada perfil | **Cardinality Constraints** | Defined in each profile |
| **Terminología** | ValueSets definidos para campos específicos | **Terminology** | ValueSets defined for specific fields |
| **Ejemplos Válidos** | Todos los ejemplos deben pasar validación | **Valid Examples** | All examples must pass validation |
| **Links Vivos** | No hay enlaces rotos en documentación | **Live Links** | No broken links in documentation |

### Herramientas de Validación / Validation Tools

- **SUSHI**: Compilador FSH (FHIR Shorthand)
- **FHIR Validator**: Validación de instancias
- **QA Reports**: Reportes automáticos del compilador
- **Custom Scripts**: Scripts PowerShell para análisis

---

## 📅 Historial de Versiones / Version History

| Versión | Estado | Fecha | URL | Version | Status | Date | URL |
|---|---|---|---|---|---|---|---|
| 0.2 | DRAFT (Actual) | 2024+ | http://racsel.org | 0.2 | DRAFT (Current) | 2024+ | http://racsel.org |
| 0.1 | Histórica | 2023 | https://lacpass.racsel.org/ | 0.1 | Historical | 2023 | https://lacpass.racsel.org/ |

---

## 🔧 Configuración Técnica / Technical Configuration

### Parámetros de Compilación / Build Parameters

```yaml
# sushi-config.yaml
id: racsel.org
canonical: http://racsel.org
name: PH4H-RACSEL
title: Guía CORE PH4H - RACSEL
status: draft
version: 0.2
fhirVersion: 4.0.1
copyrightYear: 2023+
publisher:
  name: RACSEL
  url: http://racsel.org
```

### Exclusiones de Compilación

- **Excluir TTL**: true
- **Excluir XML**: true  
- **Excluir MAP**: true

(Reducir tamaño de salida)

### Menú Generado / Generated Menu

- Home → index.html
- Base → base.html
- IPS-LAC → IPS-LAC.html
- IPS-ICVP → IPS-ICVP.html
- MHD → MHD.html
- Resumen → artifacts.html
- Historial → Historial.html
- Descargas → Descarga.html

---

## 📦 Formatos de Salida / Output Formats

| Formato | Incluido | Descripción | Format | Included | Description |
|---|---|---|---|---|---|
| **JSON** | ✅ Sí | Conformance JSON | **JSON** | ✅ Yes | Conformance JSON |
| **XML** | ❌ No | Excluido por configuración | **XML** | ❌ No | Excluded by configuration |
| **TTL** | ❌ No | Excluido por configuración | **TTL** | ❌ No | Excluded by configuration |
| **HTML** | ✅ Sí | Documentación web | **HTML** | ✅ Yes | Web documentation |
| **Markdown** | ✅ Sí | Documentación fuente | **Markdown** | ✅ Yes | Source documentation |

---

## 🎓 Recursos Educativos / Educational Resources

### ES - Documentación Incluida

- **index.md** - Introducción y descripción de la guía
- **base.md** - Conceptos base y fundamentos
- **IPS-LAC.md** - Especificaciones del Resumen Internacional de Paciente para LAC
- **IPS-ICVP.md** - Especificaciones del Certificado de Vacunación Internacional
- **MHD.md** - Especificaciones de Mobile Health Data
- **Historial.md** - Registro de cambios y versiones
- **Descarga.md** - Recursos disponibles para descargar

### EN - Included Documentation

- **index.md** - Guide introduction and description
- **base.md** - Base concepts and foundations
- **IPS-LAC.md** - International Patient Summary for LAC specifications
- **IPS-ICVP.md** - International Vaccination Certificate specifications
- **MHD.md** - Mobile Health Data specifications
- **Historial.md** - Change log and version history
- **Descarga.md** - Available resources for download

---

## 🌐 Enlaces Importantes / Important Links

### URLs del Proyecto / Project URLs

| Recurso | URL | Resource | URL |
|---|---|---|---|
| **Sitio Web Principal** | http://racsel.org | **Main Website** | http://racsel.org |
| **URL Canónica** | http://racsel.org | **Canonical URL** | http://racsel.org |
| **LACPASS** | https://lacpass.racsel.org/ | **LACPASS** | https://lacpass.racsel.org/ |
| **Demostración LACPASS** | http://lacpass.create.cl:8089/ | **LACPASS Demo** | http://lacpass.create.cl:8089/ |

### Dependencias Relacionadas / Related Dependencies

- **HL7 IPS**: https://hl7.org/fhir/uv/ips/
- **IHE MHD**: https://ihe.net/mhd/
- **WHO SMART ICVP**: https://worldhealthorganization.github.io/smart-icvp/

---

## 📋 Estado del Proyecto / Project Status

### ES - Estado Actual

- **Fase**: DRAFT (Borrador)
- **Última Actualización**: Versión 0.2
- **Compilación**: Activa (CI/CD disponible)
- **Ejemplos**: 13 ejemplos de recursos completos
- **Perfiles**: 8 perfiles FHIR definidos
- **Validación**: Requerida antes de cada compilación

### EN - Current Status

- **Phase**: DRAFT
- **Last Update**: Version 0.2
- **Build**: Active (CI/CD available)
- **Examples**: 13 complete resource examples
- **Profiles**: 8 defined FHIR profiles
- **Validation**: Required before each build

---

## 🔐 Consideraciones de Seguridad / Security Considerations

### ES - Seguridad y Privacidad

- **Datos Sensibles**: Los ejemplos contienen datos simulados sin información real de pacientes
- **Conformidad**: Cumple con estándares internacionales de salud digital
- **Encriptación**: Se recomienda usar HTTPS para acceder a la guía
- **Access Control**: Gestionar permisos según políticas organizacionales

### EN - Security and Privacy

- **Sensitive Data**: Examples contain simulated data without real patient information
- **Compliance**: Complies with international digital health standards
- **Encryption**: HTTPS recommended when accessing the guide
- **Access Control**: Manage permissions according to organizational policies

---

## 📝 Próximos Pasos / Next Steps

### ES - Tareas Pendientes

1. ✅ Definición de perfiles base (completado)
2. ✅ Creación de ejemplos (completado)
3. 🔄 Validación QA y pruebas (en progreso)
4.  Publicación DRAFT (planificado)
5.  Recolección de feedback (planificado)
6.  Versión BALLOT (futuro)
7.  Versión RELEASE (futuro)

### EN - Pending Tasks

1. ✅ Base profile definition (completed)
2. ✅ Example creation (completed)
3. 🔄 QA validation and testing (in progress)
4.  DRAFT publication (planned)
5.  Feedback collection (planned)
6.  BALLOT version (future)
7.  RELEASE version (future)

---

## 📞 Contacto / Contact

| Rol | Contacto | Role | Contact |
|---|---|---|---|
| **Administrador del Proyecto** | RACSEL Team | **Project Administrator** | RACSEL Team |
| **Soporte Técnico** | Verificar documentación | **Technical Support** | Check documentation |
| **Reportar Problemas** | GitHub Issues / Redmine | **Report Issues** | GitHub Issues / Redmine |

---

## 📄 Notas Adicionales / Additional Notes

### ES

- Esta guía es de **uso exclusivo para la Conectación**, desarrollada como parte de los **bienes públicos del BID**
- El proyecto sigue la metodología FHIR Shorthand (FSH) para definiciones
- Utiliza el compilador SUSHI para generar artefactos FHIR conformantes
- Los cambios se registran en el archivo Historial.md
- Todos los ejemplos están disponibles en JSON para facilitar la integración

### EN

- This guide is for **exclusive use for Conectación**, developed as part of the **BID public goods**
- The project follows the FHIR Shorthand (FSH) methodology for definitions
- Uses the SUSHI compiler to generate conformant FHIR artifacts
- Changes are recorded in the Historial.md file
- All examples are available in JSON to facilitate integration

---

**Documento generado**: 14 de abril de 2026  
**Document generated**: April 14, 2026  
**Versión**: 1.0  
**Version**: 1.0

---

