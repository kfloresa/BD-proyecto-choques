# Bases de datos
 
 # Equipo 2 😸
 
 #Instituto Tecnológico Autónomo de México
 
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

Crashes (Accidentes): https://data.cityofchicago.org/Transportation/Traffic-Crashes-Crashes/85ca-t3if/about_data
Vehicles (Vehículos): https://data.cityofchicago.org/Transportation/Traffic-Crashes-Vehicles/68nd-jvt3/about_data
Persons (Personas): https://data.cityofchicago.org/Transportation/Traffic-Crashes-People/u6pd-qa9d/about_data

Además, ahora están alojados en nuestro Google Drive para facilitar su acceso dentro del equipo y evitar tener datos diferentes dadas las constantes actualizaciones. 
Los datos se actualizan diariamente con nuevos registros de accidentes reportados por el Departamento de Policía de Chicago (CPD). Cada día se agregan incidentes recientes, lo que permite realizar análisis en tiempo real sobre el estado de la seguridad vial en la ciudad. 

#Vehículo: es una descripción del modelo y su año, placas, número de pasajeros que abordaban un vehículo involucrado en un choque, tipo de choque, si fue remolcado y si se incendió. 
#Persona: son los datos de las personas, desde sus datos personales hasta una indicación de su relación al choque, incluyendo cómo fueron afectadas por el choque.             
#Choque: descripción de las circunstancias del choque, las características de la calle y su nombre, como su causa, ubicación, el número de personas involucradas, daños, fecha de notificación a la policía.

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
|              | Causa                     | Placas_estado   | Tipo_herida   |
|--------------|---------------------------|-----------------|---------------|
| Texto        | Choque_id                 |                 | Accion        |
|              | Calle                     |                 | Persona_id    |
|--------------|---------------------------|-----------------|---------------|
| Fecha        | Fecha_choque              |                 |               |
|              | Fecha_notificacion_policia|                 |               |
|--------------|---------------------------|-----------------|---------------|

El objetivo del set de datos es analizar la relación entre autos, personas y accidentes automovilísticos en Chicago, con el fin de identificar patrones, factores de riesgo y posibles estrategias de prevención. Usaremos el conjunto de datos para realizar análisis estadísticos y visualizaciones que permitan comprender mejor la frecuencia y gravedad de los accidentes, así como la influencia de variables como tipo de vehículo, condiciones del conductor, ubicación y factores ambientales. Como objetivo de la materia, el equipo pretende reforzar las habilidades de manipulación de datos mediante el uso extensivo de operaciones CRUD; entender cómo utilizar herramientas externas (e.g. API’s, implementaciones con otros lenguajes) de manera eficaz y aplicar este conocimiento para implementarlas en este proyecto. 

Es necesario tomar en cuenta la naturaleza de los datos que se están utilizando, dado que estos son registros de situaciones desafortunadas para un gran número de personas, el manejo y manipulación de estos datos conlleva una responsabilidad ética. Dicha responsabilidad incluye, pero no se limita a las siguientes pautas: utilizar los datos de manera objetiva, sin intención de fomentar discriminación o perpetuar estereotipos de cualquier índole; hacer un acto de balance entre las opiniones y puntos de vista personales de los integrantes del equipo con las realidades y hechos observados; el manejo respetuoso y profesional de la información.


## Limpieza de datos

### a) Limpieza aplicada a la tabla `people`

Con base en el objetivo del proyecto, se identificaron inconsistencias, errores y valores faltantes en los registros relacionados con personas involucradas en accidentes. Para garantizar que el análisis posterior sea confiable y coherente, se realizaron las siguientes actividades de limpieza sobre la tabla `limpieza.people`:

---

### 1. Edad (`age`)
- Se reemplazaron los valores `NULL` y valores imposibles (como `-177` y `-1`) por `0`.
- Todos los valores negativos restantes fueron transformados a positivos usando `ABS()`.
- Esto fue necesario para evitar distorsiones en el análisis demográfico y asegurar que todas las edades tuvieran sentido dentro del contexto.

---

### 2. Ciudad (`city`)
- Se identificaron múltiples errores ortográficos, variantes y nombres mal escritos de ciudades.
- Se creó una tabla auxiliar `ciudades_validas` que contiene nombres oficiales de **vecindarios y áreas comunitarias de Chicago**.
- Se activó la extensión `fuzzystrmatch` y se utilizó la función `levenshtein()` para comparar y corregir nombres similares automáticamente (tolerancia ≤ 4).
- Las ciudades sin correspondencia fueron clasificadas como `'INDEFINIDA'` y los valores nulos o vacíos fueron marcados como `'UNKNOWN'`.

Esta limpieza fue necesaria para evitar duplicados, reducir la dispersión de categorías y lograr una georreferenciación precisa.

---

### 3. Sexo (`sex`)
- Se reemplazaron los valores nulos, vacíos y etiquetas mal escritas (`UNKNOWN`, etc.) por `'X'`, para unificar todos los casos donde no se pudo determinar el sexo.
- Esta categoría se usa como marcador de información ausente o no binaria.

---

### 4. Relación con vehículo (`vehicle_id`)
- Los valores nulos fueron reemplazados por `-1`, lo cual permite identificar registros sin asociación con un vehículo y previene errores en consultas relacionales.
- Esta práctica evita ambigüedad en los análisis sin eliminar datos.

---

### 5. Posición en el vehículo (`seat_no`)
- También se estandarizaron los valores nulos con `-1` para representar una posición desconocida.
- Esto garantiza que todos los registros tengan una referencia numérica válida.

---

### 6. Bolsa de aire (`airbag_deployed`)
- Se reemplazaron los valores nulos por `'DEPLOYMENT UNKNOWN'` para mantener la integridad de la categoría y asegurar que todos los registros sean legibles en análisis categóricos.
- Esto ayuda a visualizar de manera más clara los casos con datos faltantes.

---

### 7. Clasificación de lesión (`injury_classification`)
- Los valores nulos fueron reemplazados por `'UNKNOWN'` para asegurar que todos los registros tuvieran una categoría asignada, lo cual es fundamental para análisis de gravedad.

---

Todas estas acciones fueron documentadas y ejecutadas mediante un script SQL incluido en el repositorio (`scripts/limpieza.sql`), cumpliendo con el requisito de contar con un mecanismo reproducible para aplicar la limpieza sobre los datos crudos.


## b) Limpieza aplicada a la tabla `vehicles`

Con el fin de garantizar la calidad de los datos relacionados con los vehículos involucrados en accidentes, se realizaron diversas transformaciones para corregir valores faltantes, inconsistentes o fuera de rango. A continuación se detallan las acciones aplicadas a cada columna seleccionada del set:

---

### 1. Año del vehículo (`vehicle_year`)
- Se reemplazaron valores fuera de rango (años mayores a 2025 o menores o iguales a 1950), así como valores `NULL`, por `-1`.
- Esto permite conservar la columna como numérica y a la vez identificar los casos con datos inválidos o faltantes.

---

### 2. Número de pasajeros (`num_passengers`)
- Se reemplazaron los valores `NULL` y los mayores a 50 por `0`, considerando que probablemente corresponden a errores de captura o datos desconocidos.
- Así se garantiza que todos los registros contengan un valor coherente para análisis cuantitativos.

---

### 3. Tipo de unidad (`unit_type`)
- Se reemplazaron los valores `NULL` por `'UNKNOWN'`, para asegurar que todos los vehículos tengan una categoría asignada.

---

### 4. Dirección de viaje (`travel_direction`)
- Los valores `NULL` o vacíos fueron reemplazados por `'UNKNOWN'`.
- Esto permite estandarizar los registros y agruparlos de forma clara.

---

### 5. Estado emisor de la placa (`lic_plate_state`)
- Se reemplazaron los valores `NULL` o vacíos por `'UNKNOWN'` para evitar campos en blanco o mal definidos en esta variable categórica.

---

### 6. Modelo del vehículo (`model`)
- Se asignó `'UNKNOWN'` a los valores `NULL` o vacíos, permitiendo así una mejor agrupación y filtrado de modelos en los análisis.

---

### 7. Marca del vehículo (`make`)
- Se normalizó la información sustituyendo valores nulos o vacíos por `'UNKNOWN'`, para evitar categorías sueltas.

---

### 8. Remolque (`towed_i`)
- Se estandarizó el dato reemplazando valores `NULL` o vacíos por `'UNKNOWN'`.
- Esto facilita distinguir entre los casos registrados correctamente y los que carecen de información.

---

### 9. Incendio del vehículo (`fire_i`)
- Los casos donde no se registró si el vehículo se incendió se etiquetaron como `'UNKNOWN'`.

---

### 10. Exceso de velocidad (`exceed_speed_limit_i`)
- Se agruparon todos los registros sin información (vacíos o `NULL`) bajo la categoría `'UNKNOWN'`.

---

Todas estas transformaciones se encuentran implementadas y comentadas en el script `scripts/limpieza.sql`, lo que garantiza la trazabilidad y replicabilidad del proceso de limpieza.

