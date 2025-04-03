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



-- Limpieza de la columna 'age' 
-- 1. Reemplazar NULLs por 0
-- 2. Reemplazar valores irreales (-177, -1) por 0
-- 3. Convertir negativos restantes a positivos

UPDATE limpieza.people
SET age = 0
WHERE age IS NULL OR age IN (-177, -1);

UPDATE limpieza.people
SET age = ABS(age)
WHERE age < 0;

