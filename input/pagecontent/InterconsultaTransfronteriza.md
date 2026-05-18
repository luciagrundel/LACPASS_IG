**Descripción:**

Habilitar interconsultas médico-médico entre distintos países. Se enfoca en el intercambio de resúmenes clínicos y órdenes médicas estructuradas para pacientes en tránsito.

**Escenario:**

Corresponde a una solicitud de una segunda opinión, u opinión más especializada que se realiza desde un médico del **país A** a un médico del **país B**, con el objetivo de obtener una opinión especializada sobre un caso clínico. El proceso se inicia con la solicitud de interconsulta, seguida por la consulta del especialista, la generación de un reporte de retorno y la integración de este reporte en la historia clínica del paciente en el país de origen.

**Perfiles y Proceso**

1️⃣. [PAIS ORIGEN] Guardado Solictud: pais origen guarda en su servidor la solicitud de interconsulta).

> POST >> [ServidorOrigen]/( LACServiceRequestIT )

Perfil de **LACServiceRequestIT** -: [LACServiceRequestIT](StructureDefinition-LACServiceRequestIT.html).

📌 IMPORTANTE:

* *Se debe guardar con la información de Identifier proporcionada.*
* *Completar la referncia a la organization segun el pais destino - origen, y paciente con su identificador.*

2️⃣. [PAIS DESTINO] Realiza la consulta de la solicitud:

> GET ServiceRequest >> [ServidorOrigen]/(?performer = Organization/{pais_origen} , patient.identifier = [ <identificador_paciente> ]

3️⃣. [PAIS DESTINO] Luego de la atención, se registra la información clinica correspondiente: _pais destino responde a la solicitud de interconsulta, generando un mensaje MHD con la información de la evaluación clínica._

> POST ITI 65: >> [ServidorDestino]/(LACList , LACDocReferenceIT, LACBundleDocIT, LACPatient)

- Perfil Completo MHD **LACBundleTransactionMHDIT** -: [LACBundleTransactionMHDIT](StructureDefinition-LACBundleTransactionMHDIT.html).

  - Perfil de **LAC List** -: [LAC List](StructureDefinition-LACList.html).
  - Perfil de **LACDocReference Intercosulta Transfronteriza** -: [LACDocReferenceIT](StructureDefinition-LACDocReferenceIT.html).
  - Perfil de **LAC Bundle Document -IT-** -: [LACBundleDocIT](StructureDefinition-LACBundleDocIT.html).
  - Perfil de **LAC Patient** -: [LAC Patient](StructureDefinition-LACPatient.html).

4️⃣. [PAIS ORIGEN]  País origen consulta el resultado de la interconsulta:

> GET DocumentReference >> [ServidorDestino]/( ?type = [ code= Interconsulta Transfronteriza ] , patient.identifier = [ <identificador_paciente> ] )
