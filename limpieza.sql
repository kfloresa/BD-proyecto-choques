CREATE SCHEMA limpieza;

CREATE TABLE limpieza.vehicles AS
SELECT 
    crash_unit_id,
    crash_record_id,
    unit_type,
    num_passengers,
    vehicle_id,
    make,
    model,
    lic_plate_state,
    vehicle_year,
    travel_direction,
    towed_i,
    fire_i,
    exceed_speed_limit_i
FROM raw.vehicles;


CREATE TABLE limpieza.people AS
SELECT 
    person_id,
    person_type,
    crash_record_id,
    vehicle_id,
    seat_no,
    city,
    sex,
    age,
    airbag_deployed,
    injury_classification
FROM raw.people;

CREATE TABLE limpieza.crashes AS
SELECT 
    crash_record_id,
    crash_date,
    posted_speed_limit,
    weather_condition,
    lighting_condition,
    first_crash_type,
    trafficway_type,
    roadway_surface_cond,
    road_defect,
    crash_type,
    damage,
    date_police_notified,
    prim_contributory_cause,
    sec_contributory_cause,
    street_no,
    street_direction,
    street_name,
    num_units,
    injuries_total,
    injuries_fatal,
    crash_day_of_week
FROM raw.crashes;

---------------------------------------------------
\*
    Limpieza de la tabla limpieza.people
*\
    
-- 1. Limpieza de la columna 'age' 
-- a. Reemplazar NULLs por 0
-- b. Reemplazar valores irreales (-177, -1) por 0
-- c. Convertir negativos restantes a positivos

UPDATE limpieza.people
SET age = 0
WHERE age IS NULL OR age IN (-177, -1);

UPDATE limpieza.people
SET age = ABS(age)
WHERE age < 0;


-- 2. Limpieza de ciudades en people

\*
En la linea de comando se ejecuta lo siguiente:


    CREATE TABLE ciudades_validas (
    nombre TEXT
);

\copy ciudades_validas(nombre) FROM 'ruta/areas_chicagoValidas.csv' WITH (FORMAT CSV, HEADER true);

 *\   


-- Activamos la extensión fuzzystrmatch, que proporciona funciones para comparar cadenas de texto
-- mediante medidas de similitud como la distancia de Levenshtein.
-- Esta herramienta es esencial para detectar errores ortográficos en los nombres de ciudades
-- y poder corregirlos automáticamente comparando con una lista de nombres válidos.
-- Solo se necesita ejecutar una vez por base de datos.

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;

-- a. Reemplazar NULLs o vacíos por 'UNKNOWN'
UPDATE limpieza.people
SET city = 'UNKNOWN'
WHERE city IS NULL OR TRIM(city) = '';

-- b. Unificar variantes de 'UNKNOWN' mal escritas
UPDATE limpieza.people
SET city = 'UNKNOWN'
WHERE levenshtein(UPPER(city), 'UNKNOWN') <= 3;

-- c. Corregir errores ortográficos comparando con ciudades válidas
-- Solo cambiar si la ciudad actual no está en la tabla de válidas
-- y si hay una ciudad parecida con distancia Levenshtein baja, ignora los espacios
UPDATE limpieza.people p
SET city = v.nombre
FROM ciudades_validas v
WHERE levenshtein(UPPER(TRIM(p.city)), UPPER(TRIM(v.nombre))) <= 4
  AND TRIM(p.city) IS NOT NULL
  AND UPPER(TRIM(p.city)) != UPPER(TRIM(v.nombre));

-- d. Marcar como 'INDEFINIDA' las ciudades que no coinciden con ninguna válida ni con 'UNKNOWN'
UPDATE limpieza.people
SET city = 'INDEFINIDA'
WHERE city NOT IN (
    SELECT nombre FROM ciudades_validas
)
AND levenshtein(UPPER(TRIM(city)), 'UNKNOWN') > 3
AND NOT EXISTS (
    SELECT 1
    FROM ciudades_validas v
    WHERE levenshtein(UPPER(TRIM(limpieza.people.city)), UPPER(TRIM(v.nombre))) <= 5
);

-- 3. Limpieza de sexo en people

-- Reemplazar valores NULL o vacíos por 'X' en la columna sex
UPDATE limpieza.people
SET sex = 'X'
WHERE sex IS NULL
   OR TRIM(sex) = '';



-- 4. Limpieza de airbag_deployed en people
-- Reemplazamos los valores nulos en la columna airbag_deployed por 'DEPLOYMENT UNKNOWN'

UPDATE limpieza.people
SET airbag_deployed = 'DEPLOYMENT UNKNOWN'
WHERE airbag_deployed IS NULL;


-- 5. Limpieza de injury_classification en people
-- Reemplazamos los valores NULL en la columna injury_classification por 'UNKNOWN'
UPDATE limpieza.people
SET injury_classification = 'UNKNOWN'
WHERE injury_classification IS NULL;


-- 6. Limpieza de vehicle_id en people
-- Reemplazamos los valores NULL en vehicle_id por -1
-- Esto indica que no se tiene información del vehículo relacionado.
-- Es preferible a dejar NULL para facilitar agrupaciones y evitar errores en joins.

UPDATE limpieza.people
SET vehicle_id = -1
WHERE vehicle_id IS NULL;


-- 7. Limpieza de seat_no en people
-- Reemplazamos los valores NULL en seat_no por -1
-- Esto representa una posición de asiento desconocida o no registrada.
-- Usamos -1 porque seat_no es una columna numérica de código, no texto.

UPDATE limpieza.people
SET seat_no = -1
WHERE seat_no IS NULL;


-------------------------------------

\*
    Limpieza de la tabla limpieza.vehicles
*\


-- 1. Limpieza de vehicle_year
-- Reemplazamos valores irreales (año > 2025 o año <= 1950) y valores NULL por -1
-- para indicar que el dato es desconocido o no confiable.

UPDATE limpieza.vehicles
SET vehicle_year = -1
WHERE vehicle_year IS NULL 
   OR vehicle_year > 2025 
   OR vehicle_year <= 1950;

-- 2. Limpieza de num_passengers

-- Reemplazamos valores extremadamente altos (mayores a 50) o NULL por 0

UPDATE limpieza.vehicles
SET num_passengers = 0
WHERE num_passengers > 50 OR num_passengers IS NULL;

-- 3. Limpieza de unit_type
-- Reemplazamos valores NULL por 'UNKNOWN' para asegurar que todos los registros tengan una categoría asignada.

UPDATE limpieza.vehicles
SET unit_type = 'UNKNOWN'
WHERE unit_type IS NULL;


-- 4. Limpieza de travel_direction
-- Reemplazamos los valores NULL por 'UNKNOWN'
-- para asegurar que todos los registros tengan una categoría válida.

UPDATE limpieza.vehicles
SET travel_direction = 'UNKNOWN'
WHERE travel_direction IS NULL OR TRIM(travel_direction) = '';



-- 5. Limpieza de lic_plate_state
-- Reemplazamos valores NULL o vacíos por 'UNKNOWN'
-- para estandarizar los estados que emiten placas.

UPDATE limpieza.vehicles
SET lic_plate_state = 'UNKNOWN'
WHERE lic_plate_state IS NULL OR TRIM(lic_plate_state) = '';


-- 6. Limpieza de model
-- Reemplazamos los valores NULL o vacíos por 'UNKNOWN'
-- para asegurar que todos los registros tengan información consistente sobre el modelo del vehículo.

UPDATE limpieza.vehicles
SET model = 'UNKNOWN'
WHERE model IS NULL OR TRIM(model) = '';


-- 7. Limpieza de make
-- Reemplazamos valores NULL o vacíos por 'UNKNOWN'
-- para asegurar que todos los registros tengan una marca asignada.

UPDATE limpieza.vehicles
SET make = 'UNKNOWN'
WHERE make IS NULL OR TRIM(make) = '';


-- 8. Limpieza de towed_i
-- Reemplazamos valores NULL o vacíos por 'UNKNOWN'
-- para identificar de forma clara los casos donde no se sabe si el vehículo fue remolcado.

UPDATE limpieza.vehicles
SET towed_i = 'UNKNOWN'
WHERE towed_i IS NULL OR TRIM(towed_i) = '';

-- 9. Limpieza de fire_i
-- Reemplazamos valores NULL o vacíos por 'UNKNOWN'
-- para marcar explícitamente los casos donde no se sabe si el vehículo se incendió.

UPDATE limpieza.vehicles
SET fire_i = 'UNKNOWN'
WHERE fire_i IS NULL OR TRIM(fire_i) = '';


-- 10. Limpieza de exceed_speed_limit_i
-- Reemplazamos valores NULL o vacíos por 'UNKNOWN'
-- para estandarizar los registros donde no se sabe si se excedió el límite de velocidad.

UPDATE limpieza.vehicles
SET exceed_speed_limit_i = 'UNKNOWN'
WHERE exceed_speed_limit_i IS NULL OR TRIM(exceed_speed_limit_i) = '';

