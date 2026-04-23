## **Scripts Python - Documentación de Uso**

Esta carpeta contiene scripts auxiliares para el manejo de datos terminológicos y envío de recursos FHIR a servidores.

---

### **Uso Básico**

```bash
python fhir_put_folder.py \
  --base-url https://fhir.mspbs.gov.py/fhir \
  --folder ./recursos \
  --token YOUR_BEARER_TOKEN
```

#### **Parámetros Principales**

| Parámetro | Tipo | Obligatorio | Ejemplo | Descripción |
|-----------|------|:---:|---|---|
| `--base-url` | URL | ✅ Sí | `https://fhir.mspbs.gov.py/fhir` | URL base del servidor FHIR |
| `--folder` | Path | ✅ Sí | `./recursos` | Carpeta con archivos JSON/NDJSON |
| `--token` | String | ✅ Sí | `eyJ...` | Bearer Token OAuth 2.0 |

#### **Parámetros Opcionales**

| Parámetro | Tipo | Default | Ejemplo | Descripción |
|-----------|------|---------|---------|---|
| `--recursive` | Flag | False | - | Incluir subcarpetas |
| `--basic-user` | String | - | `admin` | Usuario HTTP Basic Auth |
| `--basic-pass` | String | - | `password` | Contraseña HTTP Basic Auth |
| `--dry-run` | Flag | False | - | Mostrar URLs sin enviar |
| `--timeout` | Integer | 20 | 30 | Segundos por request |
| `--verify-ssl` | Boolean | True | False | Validar certificado TLS |
| `--rate-limit` | Float | 0 | 0.5 | Segundos entre requests |
| `--only-types` | String | - | `Patient,Condition` | Filtrar por tipo (coma separado) |
| `--retries` | Integer | 2 | 5 | Reintentos en error 5xx |

#### **Ejemplos de Uso Avanzado**

**Ejemplo 1: Carga en seco (sin enviar)**
```bash
python fhir_put_folder.py \
  --base-url https://fhir.mspbs.gov.py/fhir \
  --folder ./fsh-generated/resources \
  --token TOKEN \
  --dry-run
  # Salida: lista de URLs que se enviarían
```

**Ejemplo 2: Carga solo pacientes y condiciones, con reintentos**
```bash
python fhir_put_folder.py \
  --base-url https://fhir.mspbs.gov.py/fhir \
  --folder ./recursos \
  --token TOKEN \
  --only-types Patient,Condition \
  --retries 5 \
  --rate-limit 1
```

**Ejemplo 3: Autenticación básica en ambiente local**
```bash
python fhir_put_folder.py \
  --base-url http://localhost:8080/fhir \
  --folder ./test-resources \
  --basic-user fhir_user \
  --basic-pass fhir_pass \
  --verify-ssl false \
  --timeout 10
```

**Ejemplo 4: Carga recursiva de todas las carpetas**
```bash
python fhir_put_folder.py \
  --base-url https://fhir.mspbs.gov.py/fhir \
  --folder ./ImplementationGuide \
  --token TOKEN \
  --recursive \
  --rate-limit 0.2
```

#### **Formatos Soportados**

**Archivos JSON simples**:
```json
{
  "resourceType": "Patient",
  "id": "patient-001",
  ...
}
```

**Bundle con múltiples recursos**:
```json
{
  "resourceType": "Bundle",
  "type": "collection",
  "entry": [
    { "resource": { "resourceType": "Patient", ... } },
    { "resource": { "resourceType": "Condition", ... } }
  ]
}
```

**Arrays de recursos**:
```json
[
  { "resourceType": "Patient", ... },
  { "resourceType": "Condition", ... }
]
```

**NDJSON (Newline-delimited JSON)** - 1 recurso por línea:
```
{"resourceType": "Patient", "id": "p1", ...}
{"resourceType": "Patient", "id": "p2", ...}
{"resourceType": "Condition", "id": "c1", ...}
```

#### **Salida y Logging**

El script reporta en tiempo real:

```
Procesando: ./recursos/Patient.json
├─ Patient/patient-001 ... PUT → 200 Created
├─ Patient/patient-002 ... PUT → 200 Created
│  └─ Error: 422 Unprocessable Entity
│     Reintentando (1/5)... → 201 Created ✓

Procesando: ./recursos/Bundle.json
├─ Desempaquetando 3 recursos...
├─ Condition/cond-001 ... PUT → 201 Created
├─ Condition/cond-002 ... PUT → 201 Created
├─ Condition/cond-003 ... PUT → 201 Created

Resumen:
├─ Total enviados: 6
├─ Exitosos: 6
├─ Fallidos: 0
├─ Tiempo total: 5.2s
```

#### **Códigos de Respuesta**

| HTTP | Significado | Acción |
|------|---|---|
| **200/201** | Éxito | Proseguir |
| **400** | Solicitud inválida | Revisar formato JSON |
| **401** | No autenticado | Verificar token |
| **403** | Prohibido | Verificar permisos |
| **404** | No encontrado | Verificar endpoint |
| **422** | No procesable | Validar contra perfil FHIR |
| **500** | Error servidor | Retentar (con --retries) |
| **504** | Gateway timeout | Aumentar --timeout |

---

### **Casos de Uso Típicos**

#### **Escenario 1: Carga Inicial de IG Generado**

```bash
# Después de generar con SUSHI
cd fsh-generated
python ../fhir_put_folder.py \
  --base-url https://fhir-test.mspbs.gov.py/fhir \
  --folder ./resources \
  --token $(cat ~/.fhir_token) \
  --retry 3
```

#### **Escenario 2: Validación Local Antes de Deploy**

```bash
# Ver qué se enviaría sin enviar realmente
python fhir_put_folder.py \
  --base-url http://localhost:8080/fhir \
  --folder ./resources \
  --token test_token \
  --dry-run > deploy_plan.txt

# Revisar deploy_plan.txt antes de hacer upload en serio
```

#### **Escenario 3: Restauración de Recursos After Backup**

```bash
# Restaurar recursos de una carpeta de backup
python fhir_put_folder.py \
  --base-url https://fhir.mspbs.gov.py/fhir \
  --folder ./backup/2024-03-15 \
  --token PROD_TOKEN \
  --recursive \
  --rate-limit 2  # Esperar 2 seg entre requests
```

---

### **Troubleshooting**

| Problema | Causa | Solución |
|----------|-------|----------|
| `401 Unauthorized` | Token inválido/expirado | Renovar token en servidor OAuth |
| `422 Unprocessable Entity` | Datos no conforman perfil | Validar con FHIR Validator antes |
| `File not found` | Ruta incorrecta | Usar ruta absoluta o comprobar cwd |
| `Connection timeout` | Servidor lento | Aumentar `--timeout` (ej: 60) |
| `SSL: CERTIFICATE_VERIFY_FAILED` | Certificado auto-firmado | Usar `--verify-ssl false` solo en DEV |

---

### **Integración Recomendada**

Para CI/CD automático (GitHub Actions, GitLab CI):

```yaml
# .github/workflows/deploy_fhir.yml
- name: Deploy FHIR Resources
  run: |
    pip install requests
    python scripts/fhir_put_folder.py \
      --base-url https://fhir.mspbs.gov.py/fhir \
      --folder fsh-generated/resources \
      --token ${{ secrets.FHIR_TOKEN }} \
      --retries 5
```

---

### **Contacto y Soporte**

- Para problemas con API ecieMaps (CIE-10): https://eciemaps.mscbs.gob.es/
- Para soporte FHIR: interoperabilidad@mspbs.gov.py

---
