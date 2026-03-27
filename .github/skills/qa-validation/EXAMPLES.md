---
title: "QA & Validation Skill — Prompt Examples"
---

# Ejemplos de Prompts para Usar la Skill QA & Validación

## Ejemplo 1: Análisis Post-Build (Habitual)

**Cuándo**: Acabas de ejecutar `_genonce.bat` y quieres entender qué salió mal.

```
/qa-validation
Acabo de compilar la IG y ahora hay 1 error, 48 warnings. 
¿Cuáles son los 5 problemas más críticos que debo arreglar hoy?
```

**Salida esperada**:
- Tabla de problemas ordenada por severidad
- Para cada uno: descripción, archivo/línea, acción recomendada
- Estimado de tiempo para arreglar
- Links a los archivos en la estructura del proyecto

---

## Ejemplo 2: Evaluar Impacto de Dependencias

**Cuándo**: Quieres evaluar si actualizar una dependencia es seguro.

```
/qa-validation
El QA report dice que usamos ihe.fhir.uv.ips#1.1.0 pero hay 2.0.0. 
¿Es seguro actualizar? ¿Qué riesgos hay?
```

**Salida esperada**:
- Checklist de validación
- Changelog summary
- Pruebas que ejecutar después de actualizar
- Decisión recomendada (actualizar / esperar / no actualizar)

---

## Ejemplo 3: One-Time QA Triage

**Cuándo**: Necesitas categorizar TODOS los problemas del último build.

```
/qa-validation
Dame una tabla de todos los problemas del qa.txt, agrupados por:
1. ARREGLAR INMEDIATO (bloquean build/publicación)
2. ARREGLAR PRONTO (afectan validación)
3. IGNORAR (warnings benignos, documentar por qué)
4. POSPONER (mejora futura, low priority)

Guarda el análisis en qa-decisions.md.
```

**Salida esperada**:
- Archivo `qa-decisions.md` actualizado
- Matriz de prioridades
- Decisiones documentadas con justificación
- Status tracking (TODO / IN-PROGRESS / DONE)

---

## Ejemplo 4: Debugging Específico

**Cuándo**: Un problema recurrente y necesitas investigar.

```
/qa-validation
El HTML tiene IDs de anclaje duplicados en 7 archivos StructureDefinition.
¿Es un bug del IG Publisher? ¿Qué puedo hacer en el template para arreglarlo?
```

**Salida esperada**:
- Root cause analysis
- Archivos template afectados (`template_RACSEL/`)
- Pasos para reproducir
- Solución (si la hay) o workaround
- Checklist para validar el fix

---

## Ejemplo 5: Tracking de Decisiones Anteriores

**Cuándo**: Viste un warning antes y decidiste ignorarlo. Necesitas recordar por qué.

```
/qa-validation
¿Qué problemas ya documentamos que ignóramos? 
Dame el resumen de qa-decisions.md que sean IGNORAR.
```

**Salida esperada**:
- Lista de problemas documentados
- Justificación de por qué se ignoraron
- Cuándo se podrían revisar (ej: si cambias a ci-build)

---

## Ejemplo 6: Alineación con Estándares

**Cuándo**: Necesitas saber si los problemas actuales te impiden cumplir requisitos.

```
/qa-validation
¿Con los 48 warnings actuales, podemos publicar la IG en:
1. Nuestro servidor propio?
2. HL7 ci-build?
3. NPM package?

Dame una tabla de sí/no con explicación.
```

**Salida esperada**:
- Matriz de compatibilidad (servidor propio / ci-build / NPM)
- Bloqueadores específicos por destino
- Hoja de ruta para habilitar cada canal

---

## Ejemplo 7: Automatizar Iteraciones

**Cuándo**: Quieres seguimiento automático de la calidad a lo largo del tiempo.

```
/qa-validation
Configurar un ciclo de QA automático:
- Después de cada _genonce.bat, extrae {err, warn, info} y guarda en archivo
- Crea gráfica de tendencia (¿mejoramos o empeoramos?)
- Alert si err > 0 o warn > X

¿Qué scripts o plantillas necesito crear?
```

**Salida esperada**:
- Script PowerShell para analizar qa.txt post-build
- Archivo CSV de histórico
- Sugerencias de thresholds (ej: warning limit = 50)
- Plantilla para dashboard de QA

---

## Tips para Mejores Resultados

### ✅ Buena Estrategia
```
/qa-validation
El warning "duplicate anchor IDs" afecta 7 archivos HTML.
Investigar: ¿es IG Publisher bug o problem en nuestros templates?
Come up with potential causes y validation steps.
```

### ❌ Vague (no tan útil)
```
/qa-validation
Hay problemas, ayuda.
```

### ✅ Especificidad + Contexto
```
/qa-validation
Contexto: Publicaremos en ci-build HL7 en Q2 2026.
Problema: 48 warnings de "canonical unsafe", 1 FHIR version mismatch error.
Pregunta: ¿Cuál debe ser nuestro plan de acción prioritario?
```

---

## Cómo Documentar Decisiones

Después de usar `/qa-validation`, actualiza `.github/qa-decisions.md`:

1. Copia el análisis de salida
2. Añade columna "Decisión" (ARREGLAR / IGNORAR / POSPONER / EVALUAR)
3. Justificación breve
4. Assign status (⏳ TODO / 🔧 IN-PROGRESS / ✅ DONE)
5. Commit y push

Esto crea un **audit trail** de por qué cada decisión QA fue tomada.

