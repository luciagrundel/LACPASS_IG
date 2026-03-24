# Ejemplo Patient - Miguel Pérez (Uruguay)

## Información del Paciente

| Atributo | Valor |
|----------|-------|
| **Nombre** | Miguel Pérez |
| **Género** | Masculino |
| **Fecha de Nacimiento** | 1975-03-22 (50 años) |
| **País** | Uruguay 🇺🇾 |
| **Identificadores** | Cédula de Identidad + Pasaporte |

## Identificadores

### Identificador Internacional (Pasaporte)
- **Tipo**: PPN (Passport number)
- **Sistema**: `urn:oid:2.16.858` (OID Uruguay)
- **Valor**: `UY/P-1234567890`
- **Uso**: official (requerido por perfil)

### Identificador Nacional (Cédula de Identidad)
- **Tipo**: CI (Cédula de Identidad)
- **Sistema**: `urn:oid:2.16.858` (OID Uruguay)
- **Valor**: `UY/CI-5234567-8`

## Características del Ejemplo

✅ **Validación Manual Contra Perfil LAC_Patient**

- ✓ Tiene identificador internacional (PPN) con uso = "official"
- ✓ Tiene identificador nacional (CI) - no es PPN
- ✓ Ambos identificadores tienen sistema URN OID válido
- ✓ Nombre oficial con family y given
- ✓ Teléfono de contacto (+598 es código Uruguay)
- ✓ Dirección en Montevideo (capital)
- ✓ Idioma: Spanish (Uruguay) - `es-UY`
- ✓ Referencia al perfil en meta.profile

## Datos Clínicos

- **Estado**: Activo (active = true)
- **Estado Civil**: Casado
- **Contacto de Emergencia**: Hospital Maciel (hospital uruguayo)
- **Teléfono Celular**: +598912345678

## Archivos Generados

- **Ubicación**: `input/ejemplosJSON/Patient-MiguelPerezUY.json`
- **Perfil**: `http://lacpass.racsel.org/StructureDefinition/lac-patient`
- **FHIR Version**: 4.0.1

## Notas de Uso

Este ejemplo es adecuado para:
- Documentación de la IG
- Pruebas de conformidad
- Validación de sistemas que consumen perfiles LACPASS
- Casos de uso de pacientes uruguayos

---

*Generado con FHIR-JSON-XML-Generator*  
*Fecha: 24 marzo 2026*
