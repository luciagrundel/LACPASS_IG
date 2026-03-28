---
description: "Use when: you need to generate content ideas, use cases, or examples for the RACSEL Implementation Guide (IPS for Latin America). Helps brainstorm patient scenarios, clinical workflows, documentation sections, and FHIR resource examples."
name: "Generar Ideas para IG RACSEL"
argument-hint: "Tema/recurso FHIR (ej: Patient con comorbilidades, Receta electrónica, Continuidad de atención)"
---

Genera ideas creativas y casos de uso para la Implementation Guide RACSEL (IPS de América Latina).

## Contexto de la IG
- **Proyecto**: RACSEL - Implementation Guide para Perfil Latinoamericano de International Patient Summary (IPS)
- **Alcance**: Recursos FHIR R4 (Patient, Observation, Composition, etc.)
- **Enfoque**: Casos clínicos y datos relevantes para América Latina
- **Formatos**: JSON/XML, markdown, documentación estructurada

## Tareas

Para el tema/recurso proporcionado, genera:

1. **5-7 casos de uso reales**: Escenarios específicos de pacientes o situaciones clínicas en contexto latinoamericano
   - Datos demográficos, antecedentes y comorbilidades
   - Razón clínica o situación de salud
   - Partes FHIR relevantes

2. **Ideas de ejemplos estructurados**: Sugerencias para qué datos/valores incluir en ejemplos JSON/XML
   - Elementos obligatorios y opcionales
   - Valores realistas (nombres, códigos, unidades)
   - Alineación con perfiles LACPASS/IPS

3. **Secciones de documentación**: Títulos, descripción y puntos clave para documentar en markdown
   - Flujos de trabajo o procesos
   - Notas de implementación
   - Consideraciones especiales para la región

4. **Preguntas de validación**: Aspectos a verificar o discutir con el equipo
   - Conformidad con estándares FHIR
   - Relevancia para casos de uso latinoamericanos
   - Completitud y precisión

## Formato de Salida

Estructura clara en markdown con secciones numeradas. Para recursos FHIR, incluye snippets de código cuando sea relevante.

## Notas

- Mantén el tono técnico pero accesible
- Prioriza relevancia para contextos de salud en América Latina
- Sugiere valores realistas (códigos SNOMED, LOINC, etc.)
