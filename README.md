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

      psql -U usuario
 3. Crear la base de datos y conectarse a ella.
   CREATE DATABASE choques;

      \c choques
 5. Ejecutar el script de carga.

      \i carga.sql

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
| Crash     | Crash_record_id           | Identificador de choque                | Text                |
| Crash     | posted_speed_limit        | Limite de velocidad en millas          | Numerico            |
| Crash     | Num_units                 | Numero de autos involucrados           | Numerico            |
| Crash     | Injuries_total            | Numero de heridas totales              | Numerico            |
| Crash     | Injuries_fatal            | Numero de heridas fatales              | Numerico            |
| Crash     | Crash_type                | Con heridas / Si requirio grua         | Categorico/booleano |
| Crash     | Weather_condition         | Clima                                  | Categorico/booleano |
| Crash     | lighting_condition        | Iluminacion                            | Categorico/booleano |
| Crash     | Trafficway_type           | Tipo de calle                          | Categorico/booleano |
| Crash     | Roadway_surface_cod       | Condicion de la superficie de la calle | Categorico/booleano |
| Crash     | Damage                    | Daños totales en dinero                | Categorico/booleano |
| Crash     | Prim_contributory_cause   | Causa primaria del choque              | Categorico/booleano |
| Crash     | Sec_contributory_cause    | Causa secundaria del choque            | Categorico/booleano |
| Crash     | Street_name               | Nombre de la calle                     | Text                |
| Crash     | Crash_date                | Fecha del choque                       | Timestamp           |
| Crash     | Date_police_notified      | Fecha de notificación al policía       | Timestamp           |
| Vehicle   | Crash_unit_id             | Identificador de vhiculo               | Text                |
| Vehicle   | Vehicle_id                | Identificador de vhiculo en un choque  | Text                |
| Vehicle   | Num_passengers            | Numero de pasajeros en el vehiculo     | Numerico            | 
| Vehicle   | Vehicle_year              | Año del vehiculo                       | Numerico            |
| Vehicle   | Unit_type                 | Tipo de vehiculo                       | Categorico/booleano |
| Vehicle   | Model                     | Modelo del vehiculo                    | Categorico/booleano |
| Vehicle   | Make                      | Marca del vehiculo                     | Categorico/booleano |
| Person    | Person_id                 | Identificador de persona               | Text                |
| Person    | Age                       | Edad de la persona                     | Numerico            | 
| Person    | Person_type               | Si es peaaton, conductor o paasajero   | Categorico/booleano |
| Person    | Airbag_deployed           | Si se activo la bolsa de aire          | Categorico/booleano |
| Person    | injury_classification     | Tipo de herida de la persona           | Categorico/booleano |
| Person    | City                      | Ciudad de la que proviene la persona   | Categorico/booleano |
| Person    | Accion                    | Accion que realizo la persona          | Text                |
| Person    | Seat_no                   | Numero de asiento, donde 1 es conductor| Numerico            | 



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


---

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
- Esto mejora la categorización de los defectos, agrupando aquellos sin información en una etiqueta común.

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

Todas estas modificaciones fueron implementadas mediante sentencias `UPDATE` en el archivo de limpieza `scripts/limpieza.sql`, garantizando la reproducibilidad y trazabilidad del proceso.

# Normalización hasta cuarta forma normal
---
# Análisis de datos a través de consultas SQL y creación de atributos analíticos
---
## Gravedad de heridas por grupo de edad
Se realizó un análisis para entender cómo la gravedad de las heridas en accidentes de tránsito varía según la edad de las personas involucradas. Los datos provienen del conjunto persons, el cual incluye a conductores, pasajeros y peatones registrados por el Departamento de Policía de Chicago.
La consulta SQL utilizada agrupa a las personas según rangos de edad predefinidos, y calcula cuántas personas hay en cada grupo y cuántas de ellas sufrieron heridas graves (es decir, clasificadas como FATAL o INCAPACITATING INJURY). Las personas mayores de 71 años tienen la mayor proporción de heridas graves, con un 1.75%.
Le siguen los menores de 18 años, lo cual sugiere que los extremos de edad son más vulnerables. A pesar de que el grupo de 31 a 50 años es el más numeroso, tiene una tasa relativamente baja de heridas graves. Este análisis es clave para identificar qué grupos etarios están en mayor riesgo y podría orientar futuras políticas de prevención vial enfocadas en adultos mayores y menores de edad.
