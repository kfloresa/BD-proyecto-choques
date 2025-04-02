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

-- Analisis People
-- Contar valores únicos por columna
SELECT 'person_id' AS atributo, COUNT(DISTINCT person_id) AS unique_values FROM limpieza.people
UNION ALL
SELECT 'person_type', COUNT(DISTINCT person_type) FROM limpieza.people
UNION ALL
SELECT 'crash_record_id', COUNT(DISTINCT crash_record_id) FROM limpieza.people
UNION ALL
SELECT 'vehicle_id', COUNT(DISTINCT vehicle_id) FROM limpieza.people
UNION ALL
SELECT 'seat_no', COUNT(DISTINCT seat_no) FROM limpieza.people
UNION ALL
SELECT 'city', COUNT(DISTINCT city) FROM limpieza.people
UNION ALL
SELECT 'sex', COUNT(DISTINCT sex) FROM limpieza.people
UNION ALL
SELECT 'age', COUNT(DISTINCT age) FROM limpieza.people
UNION ALL
SELECT 'airbag_deployed', COUNT(DISTINCT airbag_deployed) FROM limpieza.people
UNION ALL
SELECT 'injury_classification', COUNT(DISTINCT injury_classification) FROM limpieza.people;


-- Mínimos, máximos y promedios de valores numéricos
SELECT 
    MIN(age) AS min_age, MAX(age) AS max_age, AVG(age) AS avg_age
FROM limpieza.people;

-- Conteo de tuplas por cada categoría
SELECT person_type, COUNT(*)
FROM limpieza.people
GROUP BY person_type;

SELECT city, COUNT(*)
FROM limpieza.people
GROUP BY city;

SELECT sex, COUNT(*)
FROM limpieza.people
GROUP BY sex;

SELECT airbag_deployed, COUNT(*)
FROM limpieza.people
GROUP BY airbag_deployed;

SELECT injury_classification, COUNT(*)
FROM limpieza.people
GROUP BY injury_classification;

-- Conteo de valores nulos
SELECT 'person_id' AS atributo, COUNT(*) - COUNT(person_id) AS null_values FROM limpieza.people
UNION ALL
SELECT 'person_type', COUNT(*) - COUNT(person_type) FROM limpieza.people
UNION ALL
SELECT 'crash_record_id', COUNT(*) - COUNT(crash_record_id) FROM limpieza.people
UNION ALL
SELECT 'vehicle_id', COUNT(*) - COUNT(vehicle_id) FROM limpieza.people
UNION ALL
SELECT 'seat_no', COUNT(*) - COUNT(seat_no) FROM limpieza.people
UNION ALL
SELECT 'city', COUNT(*) - COUNT(city) FROM limpieza.people
UNION ALL
SELECT 'sex', COUNT(*) - COUNT(sex) FROM limpieza.people
UNION ALL
SELECT 'age', COUNT(*) - COUNT(age) FROM limpieza.people
UNION ALL
SELECT 'airbag_deployed', COUNT(*) - COUNT(airbag_deployed) FROM limpieza.people
UNION ALL
SELECT 'injury_classification', COUNT(*) - COUNT(injury_classification) FROM limpieza.people;

-- Verificar si hay registros duplicados
SELECT person_id, COUNT(*)
FROM limpieza.people
GROUP BY person_id
HAVING COUNT(*) > 1;



