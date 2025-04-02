 Bases de datos
 Equipo 2
 Instituto Tecnológico Autónomo de México
 Drive: https://drive.google.com/drive/folders/1cOAGPZ9cnVfjYAWl28TsU2sv7cazKgo3?usp=sharing

Este conjunto de datos contiene información detallada sobre los accidentes de tráfico ocurridos en Chicago. Está compuesto por tres archivos principales que registran diferentes aspectos del mismo evento:
1. Crashes (Accidentes) → Registra cada accidente con información sobre la fecha, lugar, condiciones del entorno y la gravedad del incidente. 
2. Vehicles (Vehículos) → Contiene detalles sobre los vehículos involucrados en cada accidente, como tipo, marca, año y características adicionales.
3. Persons (Personas) → Incluye información sobre las personas afectadas, ya sean conductores, pasajeros o peatones.
   
 Los datos son recolectados y mantenidos por: Chicago Police Department (CPD) → Reporta los accidentes y documenta la información relevante. Chicago Department of Transportation (CDOT) → Administra los datos de tránsito y seguridad vial. Estas instituciones registran los datos con base en los informes oficiales de incidentes de tráfico en la ciudad.
Los datos se recopilan con los siguientes fines: 
A). Monitorear la seguridad vial en Chicago.
B). Identificar patrones y factores de riesgo en accidentes. 
C). Desarrollar estrategias para reducir accidentes y mejorar la infraestructura de tránsito.
D). Analizar el impacto de diferentes factores como clima, velocidad, iluminación y tipo de vehículo en los accidentes. 
E). Facilitar estudios académicos y gubernamentales sobre seguridad vial. 

Los datos están disponibles públicamente en el Chicago Data Portal, bajo estas direcciones oficiales: 

•	Crashes (Accidentes): https://data.cityofchicago.org/Transportation/Traffic-Crashes-Crashes/85ca-t3if/about_data
•	Vehicles (Vehículos): https://data.cityofchicago.org/Transportation/Traffic-Crashes-Vehicles/68nd-jvt3/about_data
•	Persons (Personas): https://data.cityofchicago.org/Transportation/Traffic-Crashes-People/u6pd-qa9d/about_data

 Además, ahora están alojados en nuestro Google Drive para facilitar su acceso dentro del equipo y evitar tener datos diferentes dadas las constantes actualizaciones. 
Los datos se actualizan diariamente con nuevos registros de accidentes reportados por el Departamento de Policía de Chicago (CPD). Cada día se agregan incidentes recientes, lo que permite realizar análisis en tiempo real sobre el estado de la seguridad vial en la ciudad. 

Vehículo: es una descripción del modelo y su año, placas, número de pasajeros que abordaban un vehículo involucrado en un choque, tipo de choque, si fue remolcado y si se incendió. 
Persona: son los datos de las personas, desde sus datos personales hasta una indicación de su relación al choque, incluyendo cómo fueron afectadas por el choque.             
Choque: descripción de las circunstancias del choque, las características de la calle y su nombre, como su causa, ubicación, el número de personas involucradas, daños, fecha de notificación a la policía.

|   Set       |  Choques        |  Vehículos     |  Personas   |
|-------------|-----------------|----------------|-------------|
|  Tuplas     |  2.01 millones  |  1.86 millones |  914 mil    |
|  Atributos  |  48             |  71            |  29         |


| Tipo de dato | Choques                   | Vehiculos       | Personas      |
|--------------|---------------------------|-----------------|---------------|
| Numerico     | Id                        | Id              | Id            |
|              | Limite_velocidad          | Numero_pasajeros| Edad          |
|              | Numero_unidades           | Anho            |               |
|              | Numero_heridas            |                 |               | 
|              | Numero_heridas_fatales    |                 |               |
|--------------|---------------------------|-----------------|---------------|
| Categorico/  | Tipo                      | Tipo            | Tipo          |
| Booleano     | Clima                     | Fuego           | Asiento       |
|              | Iluminacion               | Remolcado       | Bolsa_aire    |
|              | Tipo_calle                | Direccion       | Alcohol       |
|              | Condicion_carretera       | Modelo          | Ciudad        |
|              | Danhos                    | Marca           | Sexo          |
|              | Causa                     |                 |               |
|--------------|---------------------------|-----------------|---------------|
| Texto        | Choque_id                 | Placas          | Accion        |
|              | Calle                     |                 | Persona_id    |
|--------------|---------------------------|-----------------|---------------|
| Fecha        | Fecha_choque              |                 |               |
|              | Fecha_notificacion_policia|                 |               |
|--------------|---------------------------|-----------------|---------------|

El objetivo del set de datos es analizar la relación entre autos, personas y accidentes automovilísticos en Chicago, con el fin de identificar patrones, factores de riesgo y posibles estrategias de prevención. Usaremos el conjunto de datos para realizar análisis estadísticos y visualizaciones que permitan comprender mejor la frecuencia y gravedad de los accidentes, así como la influencia de variables como tipo de vehículo, condiciones del conductor, ubicación y factores ambientales. Como objetivo de la materia, el equipo pretende reforzar las habilidades de manipulación de datos mediante el uso extensivo de operaciones CRUD; entender cómo utilizar herramientas externas (e.g. API’s, implementaciones con otros lenguajes) de manera eficaz y aplicar este conocimiento para implementarlas en este proyecto. 

Es necesario tomar en cuenta la naturaleza de los datos que se están utilizando, dado que estos son registros de situaciones desafortunadas para un gran número de personas, el manejo y manipulación de estos datos conlleva una responsabilidad ética. Dicha responsabilidad incluye, pero no se limita a las siguientes pautas: utilizar los datos de manera objetiva, sin intención de fomentar discriminación o perpetuar estereotipos de cualquier índole; hacer un acto de balance entre las opiniones y puntos de vista personales de los integrantes del equipo con las realidades y hechos observados; el manejo respetuoso y profesional de la información.

