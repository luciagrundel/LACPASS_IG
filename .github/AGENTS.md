# Agentes Personalizados - LACPASS Implementation Guide

Este documento lista los agentes personalizados disponibles en el proyecto para acelerar el desarrollo de la Implementation Guide FHIR.

## 📌 FHIR-JSON-XML-Generator

**Ubicación**: `.github/agents/agente1.agent.md`

**Propósito**: Generar y validar ejemplos de recursos FHIR en JSON/XML para documentación.

**Cuándo usar**:
- Necesitas crear nuevos ejemplos de recursos (Patient, Organization, Observation, etc.)
- Quieres validar la estructura de un JSON/XML contra un perfil
- Documenting casos de uso con ejemplos funcionales
- Verificar que los ejemplos cumplen con los perfiles de la IG

**Entrada típica**: 
```
"Genera un ejemplo de Patient para un paciente de test, con nombre, RUT chileno y contacto"
```

**Salida típica**:
- Archivo JSON válido en `input/ejemplosJSON/`
- Validación de conformidad con el perfil
- Documentación del caso de uso

**Herramientas disponibles**:
- 📖 Lectura de perfiles FSH
- ✏️ Edición y creación de archivos
- 🔍 Búsqueda en el proyecto
- ⚙️ Ejecución de comandos (SUSHI, validadores)
- 🌐 Acceso a recursos web (HL7, terminologías)

---

## 🚀 Cómo Usar los Agentes

### En VS Code
Abre el chat de Copilot y escribe:
```
@FHIR-JSON-XML-Generator [tu solicitud aquí]
```

### Ejemplo Completo
```
@FHIR-JSON-XML-Generator Crea un ejemplo valido de recurso Organization 
para un hospital en Chile, con name, type, telecom y address.
```

---

## 📝 Notas de Desarrollo

- Los ejemplos se guardan en `input/ejemplosJSON/`
- Todos los ejemplos deben validarse contra perfiles usando SUSHI
- Usa identificadores únicos significativos (ej: `Organization-HospitalTest`)
- Incluye comentarios en JSON para documentar decisiones

---

## 🔍 **Skill: QA & Validación**

**Ubicación**: `.github/skills/qa-validation/SKILL.md`

**Propósito**: Analizar reportes de QA después de generar la IG, priorizar problemas, y planificar correcciones.

**Cuándo usar**:
- Después de ejecutar `_genonce.bat` o `_gencontinuous.bat`
- Necesitas entender qué significan los errores/warnings
- Quieres priorizar qué arreglar primero
- Buscas documentar decisiones de validación

**Entrada típica**:
```
"Revisa el QA report y ayúdame a prioritizar los 48 warnings. Cuáles son críticos?"
```

**Salida típica**:
- Análisis de problemas por categoría
- Matriz de impacto (crítica/alta/media/baja)
- Plan de acción con pasos específicos
- Actualización automática de `.github/qa-decisions.md`

**Flujo de trabajo**:
1. **RECOLECTAR** — Lee `output/qa.txt`, `qa.json` (5 min)
2. **CLASIFICAR** — Agrupa por tipo de problema (10 min)
3. **EVALUAR** — Determina impacto y prioridad (10 min)
4. **DOCUMENTAR** — Actualiza `qa-decisions.md` (5 min)
5. **REMEDIAR** — Ejecuta correcciones según tipo (variable)

---

## Crear Nuevos Agentes y Skills

Para añadir más agentes, sigue el patrón de `agente1.agent.md` y documenta en este archivo.

Para crear nuevas skills, usa la plantilla en `.github/skills/qa-validation/SKILL.md` como referencia.
