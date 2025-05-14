DROP SCHEMA IF EXISTS limpieza CASCADE;
CREATE SCHEMA limpieza;

DROP TABLE IF EXISTS limpieza.vehicles CASCADE;
CREATE TABLE limpieza.vehicles AS
SELECT 
    crash_unit_id,
    crash_record_id,
    unit_type,
    num_passengers,
    vehicle_id,
    make,
    model,
    vehicle_year
FROM raw.vehicles;

DROP TABLE IF EXISTS limpieza.people CASCADE;
CREATE TABLE limpieza.people AS
SELECT 
    person_id,
    person_type,
    crash_record_id,
    vehicle_id,
    seat_no,
    age,
    airbag_deployed,
    injury_classification
FROM raw.people;

DROP TABLE IF EXISTS limpieza.crashes CASCADE;
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
    prim_contributory_cause,
    sec_contributory_cause,
    street_name,
    num_units,
    injuries_total,
    injuries_fatal,
    crash_day_of_week
FROM raw.crashes;

---------------------------------------------------
--Limpieza de la tabla limpieza.people
    
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


-- 2. Limpieza de airbag_deployed en people
-- Reemplazamos los valores nulos en la columna airbag_deployed por 'DEPLOYMENT UNKNOWN'

UPDATE limpieza.people
SET airbag_deployed = 'DEPLOYMENT UNKNOWN'
WHERE airbag_deployed IS NULL;


-- 3. Limpieza de injury_classification en people
-- Reemplazamos los valores NULL en la columna injury_classification por 'UNKNOWN'
UPDATE limpieza.people
SET injury_classification = 'UNKNOWN'
WHERE injury_classification IS NULL;


-- 4. Limpieza de vehicle_id en people
-- Reemplazamos los valores NULL en vehicle_id por -1
-- Esto indica que no se tiene información del vehículo relacionado.
-- Es preferible a dejar NULL para facilitar agrupaciones y evitar errores en joins.

UPDATE limpieza.people
SET vehicle_id = -1
WHERE vehicle_id IS NULL;


-- 5. Limpieza de seat_no en people
-- Reemplazamos los valores NULL en seat_no por -1
-- Esto representa una posición de asiento desconocida o no registrada.
-- Usamos -1 porque seat_no es una columna numérica de código, no texto.

UPDATE limpieza.people
SET seat_no = -1
WHERE seat_no IS NULL;


-------------------------------------
--Limpieza de la tabla limpieza.vehicles

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


-- 4. Limpieza de model
-- Reemplazamos los valores NULL o vacíos por 'UNKNOWN'
-- para asegurar que todos los registros tengan información consistente sobre el modelo del vehículo.

UPDATE limpieza.vehicles
SET model = 'UNKNOWN'
WHERE model IS NULL OR TRIM(model) = '';


-- 5. Limpieza de make
-- Reemplazamos valores NULL o vacíos por 'UNKNOWN'
-- para asegurar que todos los registros tengan una marca asignada.

UPDATE limpieza.vehicles
SET make = 'UNKNOWN'
WHERE make IS NULL OR TRIM(make) = '';

-- 6. Limpieza de vehicle_id en vehicle
-- Reemplazamos los valores NULL en vehicle_id por -1
-- Esto indica que no se tiene información del vehículo relacionado.
-- Es preferible a dejar NULL para facilitar agrupaciones y evitar errores en joins.

UPDATE limpieza.vehicles
SET vehicle_id = -1
WHERE vehicle_id IS NULL;

------------------------------------------
--Limpieza de la tabla limpieza.crashes

-- 1. Limpieza de weather_condition
-- Unificamos 'UNKNOWN' en 'OTHER' para consolidar categorías imprecisas
UPDATE limpieza.crashes
SET weather_condition = 'OTHER'
WHERE weather_condition = 'UNKNOWN';


-- 2. Limpieza de trafficway_type
-- Unificamos 'UNKNOWN' dentro de 'OTHER' para simplificar categorías generales
UPDATE limpieza.crashes
SET trafficway_type = 'OTHER'
WHERE trafficway_type = 'UNKNOWN';

-- 3. Limpieza de road_defect
-- Unificamos 'UNKNOWN' dentro de 'OTHER' para reducir ambigüedad
UPDATE limpieza.crashes
SET road_defect = 'OTHER'
WHERE road_defect = 'UNKNOWN';

-- 4. Limpieza de roadway_surface_cond
-- Unificamos 'UNKNOWN' en 'OTHER'
UPDATE limpieza.crashes
SET roadway_surface_cond = 'OTHER'
WHERE roadway_surface_cond = 'UNKNOWN';


-- 5. Limpieza de prim_contributory_cause
-- Unificar causas no determinadas o no aplicables
UPDATE limpieza.crashes
SET prim_contributory_cause = 'UNDETERMINED/NOT APPLICABLE'
WHERE prim_contributory_cause IN ('UNABLE TO DETERMINE', 'NOT APPLICABLE');

-- 6. Limpieza de sec_contributory_cause
-- Unificar causas secundarias no determinadas o no aplicables
UPDATE limpieza.crashes
SET sec_contributory_cause = 'UNDETERMINED/NOT APPLICABLE'
WHERE sec_contributory_cause IN ('UNABLE TO DETERMINE', 'NOT APPLICABLE');

-- 7. Limpieza de street_name
-- Reemplazamos valores NULL o vacíos por 'UNKNOWN' para estandarizar registros sin nombre de calle disponible.
UPDATE limpieza.crashes
SET street_name = 'UNKNOWN'
WHERE street_name IS NULL OR TRIM(street_name) = '';


-- 8. Limpieza de injuries_total
-- Reemplazar valores NULL por 0 en la columna injuries_total, permite análisis más fáciles (promedios, sumas, etc.) sin ignorar esos casos

UPDATE limpieza.crashes
SET injuries_total = 0
WHERE injuries_total IS NULL;

-- 9. Limpieza de injuries_fatal
-- Reemplazar valores NULL por 0 en la columna injuries_fatal, esto permite análisis sin problemas por valores faltantes
UPDATE limpieza.crashes
SET injuries_fatal = 0
WHERE injuries_fatal IS NULL;

--10. Limpieza de crash_type
--Reemplazar columna que solo tiene dos valores posibles, nombrados confusamente, por un boolean
ALTER TABLE limpieza.crashes ADD COLUMN is_severe BOOL;
UPDATE limpieza.crashes SET is_severe = TRUE WHERE crash_type = 'INJURY AND / OR TOW DUE TO CRASH';
UPDATE limpieza.crashes SET is_severe = FALSE WHERE crash_type = 'NO INJURY / DRIVE AWAY';
ALTER TABLE limpieza.crashes DROP COLUMN crash_type;
