# Instituto Tecnológico Autónomo de México - Bases de datos (COM-12101)
 
 ### Equipo 2 😸 
 
 

 # Instructivo para la carga de datos.
 ### Requisitos básicos para la carga.
 - PostgreSQL instalado y accesible desde la línea de comandos ('psql');
 - Un usuario de PostgreSQL con permisos para crear bases de datos y ejecutar scripts.

 ### Archivos necesarios.
 Descargar los siguientes archivos desde la [URL](https://drive.google.com/drive/folders/1cOAGPZ9cnVfjYAWl28TsU2sv7cazKgo3?usp=sharing) proporcionada:
 - 'Traffic_Crashes_-_Vehicles.csv'
 - 'Traffic_Crashes_-_People.csv'
 - 'Traffic_Crashes_-_Crashes.csv'
   
 ES MUY IMPORTANTE colocarlos en el mismo directorio en el que se encuentran los archivos 'carga.sql', 'limpieza.sql'

 ### Pasos a seguir para la carga de datos.
 1. Abrir una terminal e ingresar a 'psql':
```
psql -U usuario
```
 2. Crear la base de datos y conectarse a ella.
```
CREATE DATABASE choques;
\c choques
```
 3. Ejecutar el script de carga.
```
\i carga.sql
```

# Explicación general de los datos.
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

- Crashes (Accidentes): https://data.cityofchicago.org/Transportation/Traffic-Crashes-Crashes/85ca-t3if/about_data
- Vehicles (Vehículos): https://data.cityofchicago.org/Transportation/Traffic-Crashes-Vehicles/68nd-jvt3/about_data
- Persons (Personas): https://data.cityofchicago.org/Transportation/Traffic-Crashes-People/u6pd-qa9d/about_data

Además, ahora están alojados en nuestro Google Drive para facilitar su acceso dentro del equipo y evitar tener datos diferentes dadas las constantes actualizaciones. 
Los datos se actualizan diariamente con nuevos registros de accidentes reportados por el Departamento de Policía de Chicago (CPD). Cada día se agregan incidentes recientes, lo que permite realizar análisis en tiempo real sobre el estado de la seguridad vial en la ciudad. 

1. Vehículo: es una descripción del modelo y su año, placas, número de pasajeros que abordaban un vehículo involucrado en un choque, tipo de choque, si fue remolcado y si se incendió. 
2. Persona: son los datos de las personas, desde sus datos personales hasta una indicación de su relación al choque, incluyendo cómo fueron afectadas por el choque.             
3. Choque: descripción de las circunstancias del choque, las características de la calle y su nombre, como su causa, ubicación, el número de personas involucradas, daños, fecha de notificación a la policía.

|   Set       |  Crash          |  Vehicle       |  Person     |
|-------------|-----------------|----------------|-------------|
|  Tuplas     |  2.01 millones  |  1.86 millones |  914 mil    |
|  Atributos  |  48             |  71            |  29         |


| Set       | Nombre                    | Descripcion                            | Tipo                |
|-----------|---------------------------|----------------------------------------|---------------------|
| Crashes   | Crash_record_id           | Identificador de choque                | Text                |
| Crashes   | posted_speed_limit        | Limite de velocidad en millas          | Numerico            |
| Crashes   | Num_units                 | Numero de autos involucrados           | Numerico            |
| Crashes   | Injuries_total            | Numero de heridas totales              | Numerico            |
| Crashes   | Injuries_fatal            | Numero de heridas fatales              | Numerico            |
| Crashes   | Is_severe                 |TRUE=grave FALSE=leve                   | Categorico/booleano |
| Crashes   | Weather_condition         | Clima                                  | Categorico/booleano |
| Crashes   | lighting_condition        | Iluminacion                            | Categorico/booleano |
| Crashes   | Trafficway_type           | Tipo de calle                          | Categorico/booleano |
| Crashes   | Roadway_surface_cod       | Condicion de la superficie de la calle | Categorico/booleano |
| Crashes   | Damage                    | Daños totales en dinero                | Categorico/booleano |
| Crashes   | Prim_contributory_cause   | Causa primaria del choque              | Categorico/booleano |
| Crashes   | Sec_contributory_cause    | Causa secundaria del choque            | Categorico/booleano |
| Crashes   | Street_name               | Nombre de la calle                     | Text                |
| Crashes   | Crash_date                | Fecha del choque                       | Timestamp           |
| Crashes   | Date_police_notified      | Fecha de notificación al policía       | Timestamp           |
| Vehicles  | Crash_unit_id             | Identificador de vhiculo               | Text                |
| Vehicles  | Vehicle_id                | Identificador de vhiculo en un choque  | Text                |
| Vehicles  | Num_passengers            | Numero de pasajeros en el vehiculo     | Numerico            | 
| Vehicles  | Vehicle_year              | Año del vehiculo                       | Numerico            |
| Vehicles  | Unit_type                 | Tipo de vehiculo                       | Categorico/booleano |
| Vehicles  | Model                     | Modelo del vehiculo                    | Categorico/booleano |
| Vehicles  | Make                      | Marca del vehiculo                     | Categorico/booleano |
| People    | Person_id                 | Identificador de persona               | Text                |
| People    | Age                       | Edad de la persona                     | Numerico            | 
| People    | Person_type               | Si es peaaton, conductor o paasajero   | Categorico/booleano |
| People    | Airbag_deployed           | Si se activo la bolsa de aire          | Categorico/booleano |
| People    | injury_classification     | Tipo de herida de la persona           | Categorico/booleano |
| People    | Accion                    | Accion que realizo la persona          | Text                |
| People    | Seat_no                   | Numero de asiento, donde 1 es conductor| Numerico            | 



El objetivo del set de datos es analizar la relación entre autos, personas y accidentes automovilísticos en Chicago, con el fin de identificar patrones, factores de riesgo y posibles estrategias de prevención. Usaremos el conjunto de datos para realizar análisis estadísticos y visualizaciones que permitan comprender mejor la frecuencia y gravedad de los accidentes, así como la influencia de variables como tipo de vehículo, condiciones del conductor, ubicación y factores ambientales. Como objetivo de la materia, el equipo pretende reforzar las habilidades de manipulación de datos mediante el uso extensivo de operaciones CRUD; entender cómo utilizar herramientas externas (e.g. API’s, implementaciones con otros lenguajes) de manera eficaz y aplicar este conocimiento para implementarlas en este proyecto. 

Es necesario tomar en cuenta la naturaleza de los datos que se están utilizando, dado que estos son registros de situaciones desafortunadas para un gran número de personas, el manejo y manipulación de estos datos conlleva una responsabilidad ética. Dicha responsabilidad incluye, pero no se limita a las siguientes pautas: utilizar los datos de manera objetiva, sin intención de fomentar discriminación o perpetuar estereotipos de cualquier índole; hacer un acto de balance entre las opiniones y puntos de vista personales de los integrantes del equipo con las realidades y hechos observados; el manejo respetuoso y profesional de la información.

## Análisis exploratorio
### a) Crash
- En la columna posted_speed_limit, el valor mínimo es de 0, lo cual no debería ocurrir ya que es la máxima velocidad permitida en una calle. Mientras tanto, el máximo valor es de 99, lo cual consideramos es mucho, sobre todo porque está en millas.
- En la columna road_defect, 170,099 tuplas son valores null, lo cual es casi 20% de los datos.
- En la columna prim_contributory_cause, más de un tercio de los datos están en la categoría: "UNABLE TO DETERMINE", lo cual no nos ofrece mucha información.
- Únicamente existe un registro en el que la fecha de notificación del policía es anterior a la fecha del choque.

### b) People
- En la columna edad, los rangos van desde -177 años a 110. Existen 15,553 tuplas con una edad menor o igual a cero y hay medio millón de valores null.
- En la columna no_seat hay un millón y medio de valores null.
- En la columna ciudad, existen 14,228 ciudades diferentes, la mayoría son las mismas ciudades, pero con errores de escritura. Incluso hay una ciudad que solo es " ' ". Además, son medio millón de valores null.
- En la columna sexo, 182,445 personas fueron catalogadas en "X" y otras 33,904 son valores null, lo cual es casi 10% de los datos.

### c) Vehicle
- En la columna vehicle_year, el máximo año es 9999. 2,155 tuplas son mayores a 2025.
- En la columna num_passengers existen un millón y medio de tuplas con valores null.
- En la columna towed, existen un millón y medio de tuplas con valores null.
- En la columna fire, existen un millón ochocientas tuplas con valores null.
- En la columna exceed_speed_limit_i existen un millón ochocientas tuplas con valores null. Este atributo nos pudo haber dado mucha información.
- En la columna vehicle_id, existen 43,602 tuplas con valores null. Esta columna debe de servir como identificador de un vehículo en un accidente, no debería contener nulls.
  
## Limpieza de datos

### a) Limpieza aplicada a la tabla `people`

Con base en el objetivo del proyecto, se identificaron inconsistencias, errores y valores faltantes en los registros relacionados con personas involucradas en accidentes. Para garantizar que el análisis posterior sea confiable y coherente, se realizaron las siguientes actividades de limpieza sobre la tabla `limpieza.people`:

---

### 1. Edad (`age`)
- Se reemplazaron los valores `NULL` y valores imposibles (como `-177` y `-1`) por `0`.
- Todos los valores negativos restantes fueron transformados a positivos usando `ABS()`.
- Esto fue necesario para evitar distorsiones en el análisis demográfico y asegurar que todas las edades tuvieran sentido dentro del contexto.

---

### 2. Sexo (`sex`)
- Se reemplazaron los valores nulos, vacíos y etiquetas mal escritas (`UNKNOWN`, etc.) por `'X'`, para unificar todos los casos donde no se pudo determinar el sexo.
- Uniformar esta variable evita interpretaciones ambiguas y mejora los conteos categóricos. También reconoce casos de información faltante o identidades no binarias.

---

### 3. Relación con vehículo (`vehicle_id`)
- Los valores nulos fueron reemplazados por `-1`, lo cual permite identificar registros sin asociación con un vehículo y previene errores en consultas relacionales.
- Esta práctica evita ambigüedad en los análisis sin eliminar datos y se mantienen registros útiles, aunque incompletos, en lugar de descartarlos.

---

### 4. Posición en el vehículo (`seat_no`)
- También se estandarizaron los valores nulos con `-1` para representar una posición desconocida.
- Esto garantiza que todos los registros tengan una referencia numérica válida.

---

### 5. Bolsa de aire (`airbag_deployed`)
- Se reemplazaron los valores nulos por `'DEPLOYMENT UNKNOWN'` para mantener la integridad de la categoría y asegurar que todos los registros sean legibles en análisis categóricos.
- Esto ayuda a visualizar de manera más clara los casos con datos faltantes.

---

### 6. Clasificación de lesión (`injury_classification`)
- Los valores nulos fueron reemplazados por `'UNKNOWN'` para asegurar que todos los registros tuvieran una categoría asignada, lo cual es fundamental para análisis de gravedad.

---

Todas estas acciones fueron documentadas y ejecutadas mediante un script SQL incluido en el repositorio (`scripts/limpieza.sql`), cumpliendo con el requisito de contar con un mecanismo reproducible para aplicar la limpieza sobre los datos crudos.


---

## b) Limpieza aplicada a la tabla `vehicles`

Con el fin de garantizar la calidad de los datos relacionados con los vehículos involucrados en accidentes, se realizaron diversas transformaciones para corregir valores faltantes, inconsistentes o fuera de rango. A continuación se detallan las acciones aplicadas a cada columna seleccionada del set:

---

### 1. Año del vehículo (`vehicle_year`)
- Se reemplazaron valores fuera de rango (años mayores a 2025 o menores o iguales a 1950), así como valores `NULL`, por `-1`.
- Años no realistas comprometen la validez de análisis temporales. Usar -1 conserva la estructura numérica sin excluir datos.
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


---

### c) Limpieza aplicada a la tabla `crashes`

Para asegurar la calidad y consistencia de los registros relacionados con los accidentes, se realizaron múltiples transformaciones que permiten el análisis sin ambigüedades y con categorías estandarizadas. A continuación se describen las acciones aplicadas sobre la tabla `limpieza.crashes`:

---

### **1. Condición climática** (`weather_condition`)
- Se unificaron las categorías `'UNKNOWN'` y `'OTHER'` en una sola categoría: `'OTHER'`.
- Esto permite consolidar los registros con condiciones no especificadas o no clasificables y reducir la dispersión de categorías.

---

### **2. Tipo de vía** (`trafficway_type`)
- Se reasignaron todos los valores `'UNKNOWN'` a la categoría `'OTHER'`.
- Esta limpieza busca reducir la ambigüedad de los registros y agrupar los casos que no pertenecen a una categoría clara.

---

### **3. Defecto en la vía** (`road_defect`)
- Se unificaron los valores `'UNKNOWN'` en `'OTHER'`.
- Se mejora la categorización de los defectos, agrupando aquellos sin información en una etiqueta común.

---

### **4. Condición de la superficie** (`roadway_surface_cond`)
- Los valores `'UNKNOWN'` fueron reemplazados por `'OTHER'` para simplificar y estandarizar la información.
- Permite que las condiciones desconocidas no queden como categoría aislada.

---

### **5. Causa primaria del accidente** (`prim_contributory_cause`)
- Se fusionaron las categorías `'UNABLE TO DETERMINE'` y `'NOT APPLICABLE'` bajo la nueva etiqueta `'UNDETERMINED/NOT APPLICABLE'`.
- Esto permite una mejor lectura en los análisis y evita dispersión entre causas imprecisas.

---

### **6. Causa secundaria del accidente** (`sec_contributory_cause`)
- Igual que en la causa primaria, se unificaron `'UNABLE TO DETERMINE'` y `'NOT APPLICABLE'` como `'UNDETERMINED/NOT APPLICABLE'`.
-- Reduce ruido y ambigüedad en los registros secundarios del evento.

---

### **7. Dirección de la calle** (`street_direction`)
- Se reemplazaron los valores `NULL` o vacíos por `'UNKNOWN'`.
- Esto garantiza que todos los registros contengan una dirección definida, incluso si es genérica.

---

### **8. Nombre de la calle** (`street_name`)
- Se asignó `'UNKNOWN'` a los valores vacíos o nulos.
- De esta forma se evita perder datos por falta de nombre de vía, permitiendo mantener consistencia en todos los registros.

---

### **9. Total de personas heridas** (`injuries_total`)
- Los valores `NULL` fueron sustituidos por `0`.
- Esto permite sumar y promediar correctamente el número de heridos sin excluir registros por datos faltantes.

---

### **10. Personas fallecidas** (`injuries_fatal`)
- Los registros con valores `NULL` se reemplazaron por `0`.
- Esta acción es esencial para análisis de gravedad sin sesgo por omisión de datos.

---

### d) Eliminación y/o omisión de columnas 
| Columna | Descripcion | Razón |
| --- | --- |--- |
| `police_notified` | Indica si las autoridades locales fueron notificadas | La mayoría tuplas carecían de información (`UNKNOWN`) |
| `street_direction` | Orientación (sentido) de la calle | Demasiadas tuplas carecían de información (`UNKNOWN`) |
| `street_no` | Número de la calle | Demasiadas tuplas carecían de información (`UNKNOWN`) | 
| `sex` | Sexo de la persona involucrada | Demasiadas tuplas carecían de información (`UNKNOWN`) |
| `exceed_speed_limit_i` | Establece si hubo un exceso sobre el límite de velocidad al momento del accidente | Demasiadas tuplas carecían de información (`UNKNOWN`) |
| `lic_plate_state` | Estado donde se emitieron las placas del vehículo | Demasiadas tuplas carecían de información (`UNKNOWN`), además de esto consideramos que no es información relevante para el objetivo del proyecto |
| `travel_direction` | Dirección del viaje | Demasiadas tuplas carecían de información (`UNKNOWN`) |
| `towed_1` | Indica si fue necesario remolcar el vehículo | Demasiadas tuplas carecían de información (`UNKNOWN`) |
| `fire_i` | Indica si hubo un incendio | Demasiadas tuplas carecían de información (`UNKNOWN`) |



Todas estas modificaciones fueron implementadas mediante sentencias `UPDATE` en el archivo de limpieza `scripts/limpieza.sql`, garantizando la reproducibilidad y trazabilidad del proceso.

# Normalización hasta cuarta forma normal

# Análisis de datos a través de consultas SQL y creación de atributos analíticos

## Gravedad de heridas por grupo de edad
Se realizó un análisis para entender cómo la gravedad de las heridas en accidentes de tránsito varía según la edad de las personas involucradas. Los datos provienen del conjunto persons, el cual incluye a conductores, pasajeros y peatones registrados por el Departamento de Policía de Chicago.
La consulta SQL utilizada agrupa a las personas según rangos de edad predefinidos, y calcula cuántas personas hay en cada grupo y cuántas de ellas sufrieron heridas graves (es decir, clasificadas como FATAL o INCAPACITATING INJURY).

**Resultados:**
| Grupo de Edad  | No. Total de Personas | No. de Heridos de Gravedad | % de Heridos son de Gravedad |
| -------------- | --------------------- | -------------------------- | ---------------------------- |
| 1-17 	| 90370 	| 1336	| 1.48 | 
| 18-30	| 445416 |	5633 |	1.26 |
| 31-50 |	525571 |	5789 |	1.10 |
| 51-70 |	294154 |	3792 |	1.29 |
| 71+	  | 52127  |	912  |	1.75 |
| Edad desconocida	| 599373 |	1670 |	0.28 |


**Hallazgos:**
El grupo de edad más afectado por accidentes graves es el de 71+, con un porcentaje del 1.75%. Esto sugiere que las personas mayores tienen un mayor riesgo de sufrir lesiones graves. En contraste, el grupo de "Edad desconocida" muestra un porcentaje mucho más bajo de 0.26%, lo que puede ser una categoría con datos incompletos o mal registrados. Esta información puede ser útil para que la ciudad de Chicago implemente campañas de prevención enfocadas en adultos mayores, como cursos de manejo defensivo, revisiones médicas para renovar licencias o mejoras en señalización y accesibilidad. Identificar a los grupos más afectados permite diseñar políticas públicas más eficaces y reducir la gravedad de los accidentes.


## Relación entre Condición Climática y Superficie de la Carretera
Este análisis tuvo como objetivo evaluar el impacto de las condiciones climáticas y del estado de la superficie vial en la gravedad de los accidentes automovilísticos en la ciudad de Chicago. Para lograrlo, se utilizaron los atributos weather_condition, roadway_surface_cond y is_severe, que clasifica los incidentes en leves (FALSE) o graves (TRUE). Se agruparon todas las combinaciones posibles de clima y superficie, contando el número total de choques y calculando la proporción de ellos que fueron graves. Este enfoque permite no solo identificar cuáles son las condiciones más comunes, sino también detectar aquellas combinaciones que presentan un mayor riesgo de causar accidentes con consecuencias serias. Se filtraron combinaciones con al menos 20 accidentes para asegurar relevancia estadística.

**Resultados:**
| Condición Climática | Estado del Pavimento | No. Total de Accidentes | No. Accidentes de Alta Severidad | % de Accidentes que son de Alta Severidad | 
| - | - | - | - | - |
| FREEZING RAIN/DRIZZLE | 	SNOW OR SLUSH | 207 |	104 |	50.24 |
| BLOWING SNOW |	WET |	120 |	55 |	45.83 |
|SEVERE CROSS WIND GATE |	WET |	38 |	17 |	44.74 |
| FREEZING RAIN/DRIZZLE |	WET |	1251 |	550 |	43.96 |
| SLEET/HAIL |	WET |	411 |	175 |	42.58 |



**Hallazgos:**
Los resultados indican que ciertas combinaciones de clima extremo y superficies mojadas o con nieve están fuertemente asociadas con choques graves. En particular, la lluvia helada (FREEZING RAIN/DRIZZLE) combinada con nieve o pavimento mojado presenta un riesgo considerable. Estos hallazgos ayudan a identificar escenarios de alto riesgo, lo cual permite orientar decisiones públicas, como emitir alertas, reforzar la infraestructura o limitar la circulación durante condiciones adversas.


##  Marca del vehículo y gravedad de los accidentes 
En este análisis se estudió la relación entre la marca del vehículo y la gravedad de los accidentes en los que estuvo involucrado. Para ello, se agruparon los registros por marca (make) y se calcularon dos métricas principales: el número total de accidentes y la proporción de aquellos considerados graves. Se excluyeron las marcas con menos de 1000 registros para evitar sesgos y se eliminaron valores desconocidos.
**Resultados:**
| Fabricante | No. Total de Accidentes | No. Accidentes de Gravedad  | % de Accidentes son de Gravedad |
| - | - | - | - |
| HARLEY-DAVIDSON |	1135 |	672 |	59.21 |
| SUZUKI |	2442 |	954 |	39.07 |
| SATURN |	6893 |	2449 |	35.53 |
| PONTIAC |	15988 |	5564 |	34.80 |
| OLDSMOBILE |	2661 |	896 |	33.67 |


**Hallazgos:**
 Los resultados revelan que ciertas marcas presentan un porcentaje significativamente más alto de choques graves, destacando Harley-Davidson con un 59.21%, seguida por Suzuki y Saturn. Este tipo de análisis permite identificar patrones relevantes para estudios de seguridad vial y puede ser útil para orientar campañas de concientización, regulaciones o incluso investigaciones sobre diseño y seguridad vehicular.


## Análisis de la gravedad de accidentes por hora del día y día de la semana
Este análisis busca identificar las horas del día y los días de la semana con mayor gravedad en los accidentes de tráfico. Para ello, se agruparon los accidentes según el día de la semana y la hora del día, y se calculó el número total de accidentes, así como el total de heridos y fallecidos. También se calcularon los porcentajes de accidentes con víctimas fatales y con heridos para cada combinación de día y hora. Los resultados obtenidos revelan qué momentos del día y qué días de la semana tienen una mayor tasa de accidentes graves, permitiendo a las autoridades de Chicago identificar patrones críticos. Estos hallazgos son clave para diseñar estrategias de prevención, como la implementación de controles de tráfico en horas específicas y el refuerzo de las medidas de seguridad vial durante los días y horas de mayor riesgo.

**Resultados:**
| Día | Hora | No. Total de Accidentes | No. Total de Fallecimientos | No. Total de Lesionados | % de Fatalidad | % de Lesión |
| - | - | - | - | - | - | - |
| 0 |	4 |	3078 |	23 |	840 |	0.75 |	27.29 |
| 0 |	2 | 4527 |	22 |	1320 |	0.49 |	29.16 |
| 0 |	1 |	4962 |	21 |	1314 |	0.42 |	26.48 |
| 6 |	23 |	5671 |	20 |	1345 |	0.35 |	23.72 |
| 0 |	3 |	4313 |	18 |	1257 |	0.42 |	29.14 |

**Hallazgos:**
Los resultados muestran que las primeras horas de la madrugada del domingo (día 0) concentran los mayores porcentajes de fatalidad y lesión o los sabados (dia 6) a la media noche, lo cual puede estar asociado al consumo de alcohol, fatiga o menor supervisión vial. Esta información es útil para enfocar campañas preventivas, operativos viales y ajustes en los servicios de emergencia durante horarios críticos.


## Las 10 calles con mas accidentes
Este análisis identifica las 10 calles con mayor cantidad de choques registrados. Permite detectar zonas de alto riesgo vial donde el gobierno de Chicago puede enfocar campañas de prevención, mejorar señalización o rediseñar infraestructura urbana para reducir la siniestralidad.

**Resultados:**
| Nombre de la Calle | No. Total de Accidentes | 
| - | - |
| WESTERN AVE	| 24995 |
| PULASKI RD |	22049 |
| CICERO AVE |	20574 |
| ASHLAND AVE | 19892 |
| HALSTED ST |	17654 |
| KEDZIE AVE |	15954 |
| MICHIGAN AVE |	11706 |
| NORTH AVE |	10540 |
| STATE ST |	10353 |
| CLARK ST |	9819 |


**Hallazgos:**
Las 10 calles con más accidentes en Chicago son vías muy transitadas como Western Ave, Pulaski Rd y Cicero Ave. Estos resultados sugieren que la alta densidad vehicular y la posible falta de infraestructura adecuada, señalización o control de tránsito pueden estar contribuyendo significativamente al número de choques en estas zonas. Con esta información, se pueden enfocar recursos en intervenciones específicas: rediseñar intersecciones peligrosas, instalar semáforos inteligentes, mejorar la señalización, o implementar operativos de control de velocidad. Estas acciones pueden reducir los accidentes y salvar vidas.


## Analisis tipo de calles mas peligrosas
Este análisis permite identificar qué tipos de calles tienen una mayor proporción de choques fatales. Al calcular la tasa de fatalidad (número de muertes por choque), se puede detectar si ciertas configuraciones viales —como avenidas anchas, vías de doble sentido o callejones— presentan mayor riesgo de muerte. Esta información es clave para que el gobierno de Chicago rediseñe o intervenga prioritariamente esos tipos de vías con medidas como reductores de velocidad, semáforos o mejor iluminación, con el objetivo de salvar vidas.

**Resultados:**
| Tipo de Calle | No. Total de Accidentes | No. Total de Lesionados | No. Total de Fallecimientos | % de Fatalidad |
| - | - | - | - | - |
| L-INTERSECTION |	190	| 60	| 2	| 0.011 |
| NOT REPORTED |	702 |	365 |	3 |	0.004 |
| DIVIDED - W/MEDIAN BARRIER |	51612 |	13820 |	139 |	0.003 |
| FIVE POINT, OR MORE |	1418 |	592 |	3 |	0.002 | 
| UNKNOWN INTERSECTION TYPE |	2792 |	1066 |	6 |	0.002 |



**Hallazgos:**
Las intersecciones en L presentan la mayor tasa de fatalidad en sus accidentes, esto posiblemente atribuido a su diseño pues fácilmente permite las colisiones frontales y laterales, además de ser el punto de encuentro entre 2 calles o avenidas, donde conductores deben analizar y prestar extrema atención su entorno y un mínimo descuido puede ocasionar un accidente a gran velocidad.

## Analisis dias del año con mas accidentes
Este análisis identifica los días y meses con el mayor número de accidentes en Chicago a lo largo de los años. Utilizando funciones de fecha, se extrajeron los días y meses de los choques, se contaron los accidentes por cada día y mes, y se ordenaron los resultados para encontrar el período con más incidentes. Este análisis es útil para que las autoridades puedan enfocar sus esfuerzos de seguridad vial en los días y meses con mayor riesgo, como aumentar el patrullaje o implementar campañas preventivas.

**Resultados:**
| Mes | Día | No. Total de Accidentes | 
| - | - | - |
| 10 |	31 |	3056 |
| 9 |	16 |	3053 |
| 10 |	11 |	3036 |
| 10 |	25 |	2981 | 
| 10 |	30 |	2967 |
| 11 |	1 |	2943 |
| 10 |	23 |	2937 |
| 10 |	26 |	2937 |
| 12 |	16 |	2934 |
| 12 |	14 |	2927 |


**Hallazgos:**
Los datos muestran una concentración significativa de accidentes en los meses de octubre, noviembre y diciembre, especialmente entre los días 11 al 31 de octubre. Las fechas con mayor número de accidentes no coinciden necesariamente con festivos nacionales, lo que sugiere que otros factores como el clima otoñal, menor visibilidad y condiciones de la carretera podrían estar influyendo. Además, varios días cercanos entre sí indican posibles patrones semanales o estacionales de riesgo elevado. 

## Daño por límite de velocidad en la calle
Este análisis identifica los límites de velocidad que presentan una mayor proporción de daños graves en accidentes de tráfico. Se agrupan los choques por velocidad publicada y se calcula el porcentaje de casos con daño superior a $1,500 dólares. Así, podemos detectar a qué velocidades los accidentes tienden a ser más costosos, lo que puede ayudar a orientar medidas de prevención o regulación vial. Se excluyen valores nulos y se filtran límites con baja cantidad de choques para asegurar representatividad.Los resultados pueden ayudar a identificar si hay una correlación entre los límites de velocidad y la gravedad de los daños, lo que podría ser útil para tomar decisiones sobre ajustes en las políticas de tráfico, como la reducción de límites de velocidad en áreas con altos accidentes graves.

**Resultados:**
| Límite de Velocidad (mph) | Total de Choques | Daños Graves | Porcentaje de Daños Graves (%) |
|---------------------------|------------------|--------------|-------------------------------|
| 20                        | 38,256           | 23,364       | 61.07                         |
| 3                         | 226              | 136          | 60.18                         |
| 25                        | 58,715           | 34,781       | 59.24                         |
| 2                         | 31               | 18           | 58.06                         |
| 15                        | 32,586           | 18,010       | 55.27                         |

**Hallazgos:**
Los resultados muestran que los límites de velocidad bajos, especialmente entre 2 y 25 mph, presentan un porcentaje notablemente alto de daños graves. Esto podría deberse a que muchos de estos accidentes ocurren en zonas urbanas densas o residenciales, donde aunque la velocidad es baja, la exposición a peatones, ciclistas y obstáculos es mayor. Esto subraya la importancia de estrategias de seguridad vial incluso en áreas de baja velocidad.

## Año del vehículo vs severidad del accidente
Este análisis examina la relación entre el año de fabricación del vehículo y la gravedad de los accidentes en los que está involucrado. Para cada año de vehículo, se calcula el total de accidentes y se clasifica cuántos de ellos fueron graves (definidos como aquellos con lesiones o vehículos remolcados). Se calcula el porcentaje de accidentes graves en función del total de accidentes para cada año.

Los resultados de este análisis permiten observar si los vehículos más nuevos tienden a estar involucrados en accidentes más graves o si hay patrones de riesgo asociados con ciertos años de fabricación. Estos hallazgos pueden ayudar a las autoridades de tránsito a mejorar las regulaciones de seguridad vehicular o impulsar campañas de concienciación sobre vehículos de ciertos años.

**Resultados:**
| Año del Vehículo | Total de Accidentes | Accidentes Graves | Porcentaje de Accidentes Graves (%) |
|------------------|---------------------|--------------------|--------------------------------------|
| 1980             | 63                  | 27                 | 42.86                                |
| 1979             | 70                  | 27                 | 38.57                                |
| 1978             | 81                  | 30                 | 37.04                                |
| 1970             | 53                  | 19                 | 35.85                                |
| 1982             | 78                  | 27                 | 34.62                                |


**Hallazgos:**
Los vehículos fabricados entre 1970 y 1982 muestran los porcentajes más altos de accidentes graves, lo que indica una menor capacidad de protección en choques. Para Chicago, este hallazgo puede guiar políticas de seguridad vial más efectivas, como:

* **Incentivar el retiro de vehículos antiguos**, mediante subsidios o programas de recambio.
* **Dirigir campañas de concientización** hacia conductores con autos más viejos.
* **Reforzar inspecciones vehiculares** que aseguren condiciones mínimas de seguridad.

##  Efctividad de la bolsa de aire en proteccion
Este análisis evalúa la efectividad de las bolsas de aire en la reducción de muertes y lesiones graves en los accidentes de tráfico. Se compara el número de accidentes, muertes y lesiones graves entre los casos donde la bolsa de aire se desplegó y aquellos donde no se desplegó.

Para cada categoría de despliegue de bolsa de aire (airbag_deployed), se calcula:
Tasa de fatalidad: El porcentaje de accidentes con víctimas fatales sobre el total de accidentes.
Tasa de lesiones graves: El porcentaje de accidentes con lesiones graves (incluyendo lesiones incapacitantes o no incapacitantes) sobre el total de accidentes.

El análisis proporciona una visión clara de cómo las bolsas de aire contribuyen a la seguridad de los ocupantes del vehículo en caso de accidente. Un menor porcentaje de fatalidades y lesiones graves en los vehículos con bolsas de aire desplegadas indicaría una mayor efectividad de este sistema de seguridad.

**Resultados:**
### Efectividad de la bolsa de aire

| Tipo de despliegue                         | Total accidentes | Fatalidades | Lesiones graves | % Fatalidad | % Lesiones graves |
|-------------------------------------------|------------------|-------------|------------------|-------------|--------------------|
| DEPLOYED, COMBINATION                     | 52,015           | 244         | 2,952            | 0.47%       | 5.68%              |
| DEPLOYED OTHER (KNEE, AIR, BELT, ETC.)    | 984              | 2           | 54               | 0.20%       | 5.49%              |
| DEPLOYED, FRONT                           | 62,454           | 150         | 2,503            | 0.24%       | 4.01%              |
| DEPLOYED, SIDE                            | 18,234           | 20          | 483              | 0.11%       | 2.65%              |
| NOT APPLICABLE                            | 432,997          | 137         | 2,370            | 0.03%       | 0.55%              |
| DID NOT DEPLOY                            | 997,514          | 116         | 3,499            | 0.01%       | 0.35%              |
| DEPLOYMENT UNKNOWN                        | 403,186          | 99          | 953              | 0.02%       | 0.24%              |

**Hallazgos:**
Los airbags que se despliegan (especialmente los combinados o frontales) están asociados con tasas más altas de lesiones graves que los que no lo hacen, lo que sugiere que estos airbags se activan en choques más severos. Sin embargo, aún en esos escenarios, la presencia de airbags reduce la tasa de fatalidades en comparación con lo que cabría esperar en accidentes de alta severidad.

Para el gobierno de Chicago, esto puede ayudar a:
Promover el uso de vehículos con airbags modernos y funcionales.
Identificar qué tipos de despliegue son más efectivos y seguros.
Diseñar políticas para inspeccionar o retirar vehículos sin sistemas de protección activos.
