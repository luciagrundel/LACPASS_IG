**Descripción:**

Habilitar interconsultas médico-médico entre distintos países. Se enfoca en el intercambio de resúmenes clínicos y órdenes médicas estructuradas para pacientes en tránsito.

**Escenario:**
Un médico del País A consulta a un especialista en el País B. El especialista recibe el IPS vía MHD, realiza la evaluación y emite órdenes médicas. Al finalizar, se genera un reporte de retorno mediante MHD que se integra en la historia clínica del país de origen.

---

**Perfiles y Proceso**

1. Guardado Solictud: pais origen guarda en su servidor la solicitud de interconsulta).

   > **POST >> ( LACServiceRequestIT )**
   >

   Perfil de **LACServiceRequestIT** -: [LACServiceRequestIT](StructureDefinition-LACServiceRequestIT.html).

   IMPORTANTE:

* *Se debe guardar con la información de Identifier proporcionada.*
* *Completar la referncia a la organization segun el pais destino - origen, y la referencia al paciente segun el MPI del pais origen.*

2. Pais Destino, realiza la consulta de la solicitud:

   > **GET ServiceRequest ( ?**performer** = Organization/PA , patient = [ URL / MPI ]**
   >
3. Luego de la atención, se registra la información clinica correspondiente: _pais destino responde a la solicitud de interconsulta, generando un mensaje MHD con la información de la evaluación clínica._

   > **POST iti 65: >> (LACList , LACDocReferenceIT, LACBundleDocIT, LACPatient)**
   >

   - Perfil de **LAC List** -: [LAC List](StructureDefinition-LACList.html).
   - Perfil de **LACDocReference Intercosulta Transfronteriza** -: [LACDocReferenceIT](StructureDefinition-LACDocReferenceIT.html).
   - Perfil de **LAC Bundle Document -IT-** -: [LACBundleDocIT](StructureDefinition-LACBundleDocIT.html).
   - Perfil de **LAC Patient** -: [LAC Patient](StructureDefinition-LACPatient.html).
4. País origen consulta el resultado de la interconsulta:

> **GET DocumentReference ( ?**type** = [ URL / Interconsulta Transfronteriza ] , patient = [ URL / MPI ] )**
