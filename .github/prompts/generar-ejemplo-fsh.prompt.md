---
description: "Use when: necesitas generar ejemplos (Instances) en FSH para perfiles FHIR de la LACPASS IG. Crea instancias con datos realistas respetando todas las restricciones del perfil."
name: "Generar Ejemplos FSH"
argument-hint: "Nombre del perfil (ej: LACPatient, LACBundleIPS), tipo de caso de uso (ej: paciente adulto, episodio quirúrgico), y características específicas (ej: RUT chileno, alergia a penicilina)"
---

Genera ejemplos de recursos FHIR en formato **FSH  Shorthand** para los perfiles de la Implementation Guide LACPASS.

## Contexto

- **Proyecto**: LACPASS IPS - Implementation Guide para Latinoamérica
- **Propósito**: Crear instancias (Instances) FSH que sirvan como documentación y casos de prueba
- **Perfiles base**: Derivados de [International Patient Summary (IPS)](https://build.fhir.org/ig/HL7/fhir-ips/)
- **Version**: FHIR R4 (4.0.1)
- **Identifiers**: Formato URN OID `urn:oid.2.16.*` para regiones

## Tareas

Para el perfil and caso de uso indicados:

1. **Explorar el perfil**
   - Leer definición en `input/fsh/`
   - Identificar cardinalidades (0..*, 1..1, etc.)
   - Localizar slices y restricciones (invariants)
   - Notar valores fijos (exactly) que no pueden cambiar

2. **Generar la Instance FSH**
   - Nombre: `[Perfil][TipoCasoUso]Example` (ej: `LACPatientPregnancyExample`)
   - Incluir todos elementos obligatorios (cardinalidad mínima)
   - Respetar tipos de datos y slices
   - Usar datos realistas para el contexto (pacientes, direcciones, códigos médicos)

3. **Validar conformidad**
   - Verificar cada slice tiene los elementos requeridos
   - Confirmar invariant expressions son válidas
   - Asegurar cardinalidades respetadas
   - Compilar con SUSHI para verificar validez

4. **Crear el archivo**
   - Generar archivo `input/ejemplos/[NombreInstancia].fsh`
   - Incluir solo la Instance (sin duplicar definiciones de perfiles)
   - Mantener formato consistente con otros ejemplos
   - Compilar y validar con SUSHI

## Estructura de Salida

```fsh
Instance: [NombrejEjemplo]
InstanceOf: [Perfil]
Usage: #example
Description: "[Descripción breve del caso de uso en español]"

* [elemento1] = [valor]
* [elemento2.subelemento] = [valor]
* [slice][elemento] = [valor]
```

## Ejemplo de Interacción

**Usuario**: "Genera un ejemplo FSH para LACPatient: una mujer embarazada de 32 años de Chile, con nombre 'Gabriela Muñoz', RUT 18.765.432-3, fecha de nacimiento 1992-05-18"

**Agente**: 
1. Lee el perfil LACPatient y sus restricciones
2. Verifica slices de identificadores (international y national)
3. Genera Instance con datos válidos y coherentes
4. Valida contra cardinalidades e invariants
5. Proporciona comando: `./sushi-config.yaml` para compilar

## Ubicación de Archivos

**Los ejemplos se crean automáticamente en**: `input/ejemplos/[NombreInstancia].fsh`

Por ejemplo: `input/ejemplos/LACPatientPregnancyExample.fsh`

## Notas Importantes

- **Invariants**: Pueden definir restricciones adicionales (ej: "solo un identificador oficial")
- **Slices**: Respetar discriminadores y orden
- **Valores fijos**: No pueden sobrescribirse
- **Datos clínicos**: Usar códigos SNOMED, LOINC válidos cuando sea necesario
- **Regiones**: Adaptarse a contextos específicos (Chile, Colombia, Perú, etc.)
- **Archivo único**: Cada Instance en su propio archivo .fsh en `input/ejemplos/`

## Herramientas Recomendadas

1. **Leer perfil**: Explora `input/fsh/[perfil].fsh`
2. **Buscar ejemplos existentes**: Localiza ejemplos similares para inspiración
3. **Validar FSH**: Ejecuta `_genonce.bat` para compilar y validar
4. **Revisar salida**: Verifica el JSON compilado en `output/`
