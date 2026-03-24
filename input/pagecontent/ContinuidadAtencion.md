Parte 1. 

Descripción:
Facilitar el acceso de la población en movilidad pendular a su historial clínico resumido (IPS LAC). Acceso y actualización continua del IPS durante trayectos de ida y retorno, garantizando disponibilidad permanente y trazabilidad completa de las intervenciones sanitarias realizadas tanto en el país de origen como en el de destino temporal.


Escenario:
Una persona emprende su trayecto desde su país de origen A hacia su destino temporal B, para luego regresar a su origen A. El escenario contempla que esta persona inicia su trayecto portando su Resumen Internacional del Paciente (IPS), el cual se actualiza progresivamente con cada intervención sanitaria recibida (presencial o virtual) en los distintos países de tránsito, permitiéndole retornar a su país de origen A con un historial clínico resumido completo, actualizado y que mantienen la trazabilidad de la información, lo que refleja la continuidad de su atención médica transfronteriza.


--------------------------------------------------------------------------------------------------
Perfiles:

1. Perfil de **Bundle Document** - IPS: 
[Bundle Document IPS](StructureDefinition-BundleDOCIPS.html).

2. Transacciones **MHD** para IPS:
- Transacción MHD para consulta de IPS: [MHD Consulta IPS](https://build.fhir.org/ig/HL7/fhir-ips/OperationDefinition-DocumentReference-mhd-document-query.html).
- Transacción MHD para actualización de IPS: [MHD Actualización IPS](https://build.fhir.org/ig/HL7/fhir-ips/OperationDefinition-DocumentReference-mhd-document-update.html).

--------------------------------------------------------------------------------------------------
Parte 2. 
Descripción:
Habilitar interconsultas médico-médico entre distintos países. Se enfoca en el intercambio de resúmenes clínicos y órdenes médicas estructuradas para pacientes en tránsito.

Escenario:
Un médico del País A consulta a un especialista en el País B. El especialista recibe el IPS vía MHD, realiza la evaluación y emite órdenes médicas. Al finalizar, se genera un reporte de retorno mediante MHD que se integra en la historia clínica del país de origen.


--------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------