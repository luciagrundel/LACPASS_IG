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

## 🚀 Cómo Usar los Agentes y Prompts

### Usando Agentes en VS Code
Abre el chat de Copilot y escribe:
```
@[NombreDelAgente] [tu solicitud aquí]
```

**Ejemplos**:
```
@FHIR-JSON-XML-Generator Crea un ejemplo valido de recurso Organization 
para un hospital en Chile, con name, type, telecom y address.

@FSH-Example-Generator Genera un ejemplo FSH para LACPatient, una paciente embarazada 
de 32 años, nombre 'Gabriela Muñoz', RUT 18.765.432-3
```

### Usando Prompts Rápidos
Abre el chat, escribe `/` y selecciona un prompt:
```
/Generar Ejemplos FSH
/Generar Ideas para IG RACSEL
```

Los prompts te guían con plantillas y contexto predefinido.

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

## 🧬 **FSH-Example-Generator**

**Ubicación**: `.github/agents/fsh-example-generator.agent.md`

**Propósito**: Generar ejemplos de recursos (Instances) directamente en FSH para todos los perfiles de la IG.

**Cuándo usar**:
- Necesitas crear nuevas instancias de ejemplo en FSH para perfiles
- Quieres generar casos de uso con datos coherentes
- Necesitas completar la cobertura de ejemplos de la IG
- Requieres ejemplos que respeten todas las restricciones del perfil

**Entrada típica**: 
```
"Genera un ejemplo FSH para el perfil LACPatient con un paciente chileno de prueba, nombre 'María García', RUT 25.123.456-K"
```

**Salida típica**:
- Archivo creado: `input/ejemplos/[NombreInstancia].fsh`
- Contiene Instance válida en FSH que respeta todas las restricciones del perfil

**Ejemplo**:
`input/ejemplos/LACPatientPregnancyExample.fsh`:
```fsh
Instance: LACPatientPregnancyExample
InstanceOf: LACPatient
Usage: #example

* identifier[international].use = #official
* identifier[international].type = $v2-0203#PPN
* identifier[international].system = "urn:oid.2.16.152"
* identifier[international].value = "CL/P19234567"

* identifier[national].system = "urn:oid.2.16.152"
* identifier[national].type = $v2-0203#DL
* identifier[national].value = "CL/19.234.567-8"

* active = true
* name.use = #official
* name.text = "María González"
* name.family = "González"
* name.given = "María"
* gender = #female
* birthDate = "1991-03-15"
```

**Herramientas disponibles**:
- 📖 Lectura de perfiles FSH
- ✏️ Edición y creación de archivos `.fsh`
- 🔍 Búsqueda en el proyecto
- ⚙️ Ejecución de comandos (SUSHI validación)

---

## Crear Nuevos Agentes y Skills

Para añadir más agentes, sigue el patrón de `agente1.agent.md` o `fsh-example-generator.agent.md` y documenta en este archivo.

Para crear nuevas skills, usa la plantilla en `.github/skills/qa-validation/SKILL.md` como referencia.
