**Descripción:**

Habilitar interconsultas médico-médico entre distintos países. Se enfoca en el intercambio de resúmenes clínicos y órdenes médicas estructuradas para pacientes en tránsito.

**Escenario:**
Un médico del País A consulta a un especialista en el País B. El especialista recibe el IPS vía MHD, realiza la evaluación y emite órdenes médicas. Al finalizar, se genera un reporte de retorno mediante MHD que se integra en la historia clínica del país de origen.

---

**Perfiles:**

1. Guardado Solictud: pais origen guarda en su servidor la solicitud de interconsulta).

   POST >> ( LACServiceResquest )
   Perfil de **LAC ServiceRequest** -: [LAC ServiceRequest](StructureDefinition-LACServiceRequest.html).
   
2. Respuesta Solicitud: pais destino responde a la solicitud de interconsulta, generando un mensaje MHD con la información de la evaluación clínica.

   POST iti 65: >> (List , LACDocReferenceTelesalud, LACBundleTelesalud, LACPatient)

   - Perfil de **LAC List** -: [LAC List](StructureDefinition-LACList.html).
   - Perfil de **LACDocReference Telesalud** -: [LACDocReference Telesalud](StructureDefinition-LACDocReferenceTelesalud.html).
   - Perfil de **LAC Bundle Document -Telesalud-** -: [LAC Bundle Telesalud](StructureDefinition-LACBundleTelesalud.html).
   - Perfil de **LAC Patient** -: [LAC Patient](StructureDefinition-LACPatient.html).
