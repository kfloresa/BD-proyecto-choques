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

SELECT vehicle_id, COUNT(*)
FROM limpieza.people
GROUP BY vehicle_id;

SELECT seat_no, COUNT(*)
FROM limpieza.people
GROUP BY seat_no;

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

-- Verificar inconsistencias
SELECT COUNT(*) AS total_menores_igual_cero
FROM limpieza.people
WHERE age <= 0;

--Analisis vehicles
-- Contar valores únicos por columna
SELECT 'crash_unit_id' AS atributos, COUNT(DISTINCT crash_unit_id) AS unique_values FROM limpieza.vehicles
UNION ALL
SELECT 'crash_record_id', COUNT(DISTINCT crash_record_id) FROM limpieza.vehicles
UNION ALL
SELECT 'unit_type', COUNT(DISTINCT unit_type) FROM limpieza.vehicles
UNION ALL
SELECT 'num_passengers', COUNT(DISTINCT num_passengers) FROM limpieza.vehicles
UNION ALL
SELECT 'vehicle_id', COUNT(DISTINCT vehicle_id) FROM limpieza.vehicles
UNION ALL
SELECT 'make', COUNT(DISTINCT make) FROM limpieza.vehicles
UNION ALL
SELECT 'model', COUNT(DISTINCT model) FROM limpieza.vehicles
UNION ALL
SELECT 'lic_plate_state', COUNT(DISTINCT lic_plate_state) FROM limpieza.vehicles
UNION ALL
SELECT 'vehicle_year', COUNT(DISTINCT vehicle_year) FROM limpieza.vehicles
UNION ALL
SELECT 'travel_direction', COUNT(DISTINCT travel_direction) FROM limpieza.vehicles
UNION ALL
SELECT 'towed_i', COUNT(DISTINCT towed_i) FROM limpieza.vehicles
UNION ALL
SELECT 'fire_i', COUNT(DISTINCT fire_i) FROM limpieza.vehicles
UNION ALL
SELECT 'exceed_speed_limit_i', COUNT(DISTINCT exceed_speed_limit_i) FROM limpieza.vehicles;


-- Mínimos, máximos y promedios de valores numéricos
SELECT 
    MIN(vehicle_year) AS min_vehicle_year, 
    MAX(vehicle_year) AS max_vehicle_year, 
    AVG(vehicle_year) AS avg_vehicle_year,
    MIN(num_passengers) AS min_passengers, 
    MAX(num_passengers) AS max_passengers, 
    AVG(num_passengers) AS avg_passengers
FROM limpieza.vehicles;

-- Conteo de tuplas por cada categoría

SELECT unit_type, COUNT(*)
FROM limpieza.vehicles
GROUP BY unit_type
ORDER BY COUNT(*) DESC;

SELECT num_passengers, COUNT(*)
FROM limpieza.vehicles
GROUP BY num_passengers
ORDER BY COUNT(*) DESC;

SELECT make, COUNT(*)
FROM limpieza.vehicles
GROUP BY make
ORDER BY COUNT(*) DESC;

SELECT model, COUNT(*)
FROM limpieza.vehicles
GROUP BY model
ORDER BY COUNT(*) DESC;

SELECT lic_plate_state, COUNT(*)
FROM limpieza.vehicles
GROUP BY lic_plate_state
ORDER BY COUNT(*) DESC;

SELECT vehicle_year, COUNT(*)
FROM limpieza.vehicles
GROUP BY vehicle_year
ORDER BY COUNT(*) DESC;

SELECT travel_direction, COUNT(*)
FROM limpieza.vehicles
GROUP BY travel_direction
ORDER BY COUNT(*) DESC;

SELECT towed_i, COUNT(*)
FROM limpieza.vehicles
GROUP BY towed_i
ORDER BY COUNT(*) DESC;

SELECT fire_i, COUNT(*)
FROM limpieza.vehicles
GROUP BY fire_i
ORDER BY COUNT(*) DESC;

SELECT exceed_speed_limit_i, COUNT(*)
FROM limpieza.vehicles
GROUP BY exceed_speed_limit_i
ORDER BY COUNT(*) DESC;

-- Conteo de valores nulos
SELECT 'crash_unit_id' AS atributo, COUNT(*) - COUNT(crash_unit_id) AS null_values FROM limpieza.vehicles
UNION ALL
SELECT 'crash_record_id', COUNT(*) - COUNT(crash_record_id) FROM limpieza.vehicles
UNION ALL
SELECT 'unit_type', COUNT(*) - COUNT(unit_type) FROM limpieza.vehicles
UNION ALL
SELECT 'num_passengers', COUNT(*) - COUNT(num_passengers) FROM limpieza.vehicles
UNION ALL
SELECT 'vehicle_id', COUNT(*) - COUNT(vehicle_id) FROM limpieza.vehicles
UNION ALL
SELECT 'make', COUNT(*) - COUNT(make) FROM limpieza.vehicles
UNION ALL
SELECT 'model', COUNT(*) - COUNT(model) FROM limpieza.vehicles
UNION ALL
SELECT 'lic_plate_state', COUNT(*) - COUNT(lic_plate_state) FROM limpieza.vehicles
UNION ALL
SELECT 'vehicle_year', COUNT(*) - COUNT(vehicle_year) FROM limpieza.vehicles
UNION ALL
SELECT 'travel_direction', COUNT(*) - COUNT(travel_direction) FROM limpieza.vehicles
UNION ALL
SELECT 'towed_i', COUNT(*) - COUNT(towed_i) FROM limpieza.vehicles
UNION ALL
SELECT 'fire_i', COUNT(*) - COUNT(fire_i) FROM limpieza.vehicles
UNION ALL
SELECT 'exceed_speed_limit_i', COUNT(*) - COUNT(exceed_speed_limit_i) FROM limpieza.vehicles;

-- Verificar si hay registros duplicados
SELECT vehicle_id, COUNT(*)
FROM limpieza.vehicles
GROUP BY vehicle_id
HAVING COUNT(*) > 1;

--Analisis crashes
-- Contar valores únicos por columna
SELECT 'crash_record_id' AS column_name, COUNT(DISTINCT crash_record_id) AS unique_values FROM limpieza.crashes
UNION ALL
SELECT 'crash_date', COUNT(DISTINCT crash_date) FROM limpieza.crashes
UNION ALL
SELECT 'posted_speed_limit', COUNT(DISTINCT posted_speed_limit) FROM limpieza.crashes
UNION ALL
SELECT 'weather_condition', COUNT(DISTINCT weather_condition) FROM limpieza.crashes
UNION ALL
SELECT 'lighting_condition', COUNT(DISTINCT lighting_condition) FROM limpieza.crashes
UNION ALL
SELECT 'first_crash_type', COUNT(DISTINCT first_crash_type) FROM limpieza.crashes
UNION ALL
SELECT 'trafficway_type', COUNT(DISTINCT trafficway_type) FROM limpieza.crashes
UNION ALL
SELECT 'roadway_surface_cond', COUNT(DISTINCT roadway_surface_cond) FROM limpieza.crashes
UNION ALL
SELECT 'road_defect', COUNT(DISTINCT road_defect) FROM limpieza.crashes
UNION ALL
SELECT 'crash_type', COUNT(DISTINCT crash_type) FROM limpieza.crashes
UNION ALL
SELECT 'damage', COUNT(DISTINCT damage) FROM limpieza.crashes;

-- Conteo de valores nulos
SELECT 'crash_record_id' AS atributo, COUNT(*) - COUNT(crash_record_id) AS null_values FROM limpieza.crashes
UNION ALL
SELECT 'crash_date', COUNT(*) - COUNT(crash_date) FROM limpieza.crashes
UNION ALL
SELECT 'posted_speed_limit', COUNT(*) - COUNT(posted_speed_limit) FROM limpieza.crashes
UNION ALL
SELECT 'weather_condition', COUNT(*) - COUNT(weather_condition) FROM limpieza.crashes
UNION ALL
SELECT 'lighting_condition', COUNT(*) - COUNT(lighting_condition) FROM limpieza.crashes
UNION ALL
SELECT 'first_crash_type', COUNT(*) - COUNT(first_crash_type) FROM limpieza.crashes
UNION ALL
SELECT 'trafficway_type', COUNT(*) - COUNT(trafficway_type) FROM limpieza.crashes
UNION ALL
SELECT 'roadway_surface_cond', COUNT(*) - COUNT(roadway_surface_cond) FROM limpieza.crashes
UNION ALL
SELECT 'road_defect', COUNT(*) - COUNT(road_defect) FROM limpieza.crashes
UNION ALL
SELECT 'crash_type', COUNT(*) - COUNT(crash_type) FROM limpieza.crashes
UNION ALL
SELECT 'damage', COUNT(*) - COUNT(damage) FROM limpieza.crashes
UNION ALL
SELECT 'date_police_notified', COUNT(*) - COUNT(date_police_notified) FROM limpieza.crashes
UNION ALL
SELECT 'prim_contributory_cause', COUNT(*) - COUNT(prim_contributory_cause) FROM limpieza.crashes
UNION ALL
SELECT 'sec_contributory_cause', COUNT(*) - COUNT(sec_contributory_cause) FROM limpieza.crashes
UNION ALL
SELECT 'street_no', COUNT(*) - COUNT(street_no) FROM limpieza.crashes
UNION ALL
SELECT 'street_direction', COUNT(*) - COUNT(street_direction) FROM limpieza.crashes
UNION ALL
SELECT 'street_name', COUNT(*) - COUNT(street_name) FROM limpieza.crashes
UNION ALL
SELECT 'num_units', COUNT(*) - COUNT(num_units) FROM limpieza.crashes
UNION ALL
SELECT 'injuries_total', COUNT(*) - COUNT(injuries_total) FROM limpieza.crashes
UNION ALL
SELECT 'injuries_fatal', COUNT(*) - COUNT(injuries_fatal) FROM limpieza.crashes
UNION ALL
SELECT 'crash_day_of_week', COUNT(*) - COUNT(crash_day_of_week) FROM limpieza.crashes;

-- Mínimos y máximos de fechas
SELECT 'crash_date' AS column_name, MIN(crash_date) AS min_value, MAX(crash_date) AS max_value FROM limpieza.crashes;

-- Mínimos, máximos y promedios de valores numéricos
SELECT 'posted_speed_limit' AS column_name, MIN(posted_speed_limit) AS min_value, MAX(posted_speed_limit) AS max_value, AVG(posted_speed_limit) AS avg_value FROM limpieza.crashes
UNION ALL
SELECT 'num_units', MIN(num_units), MAX(num_units), AVG(num_units) FROM limpieza.crashes
UNION ALL
SELECT 'injuries_total', MIN(injuries_total), MAX(injuries_total), AVG(injuries_total) FROM limpieza.crashes
UNION ALL
SELECT 'injuries_fatal', MIN(injuries_fatal), MAX(injuries_fatal), AVG(injuries_fatal) FROM limpieza.crashes;

-- Conteo de tuplas por cada categoría
SELECT weather_condition, COUNT(*)
FROM limpieza.crashes
GROUP BY weather_condition;

SELECT lighting_condition, COUNT(*)
FROM limpieza.crashes
GROUP BY lighting_condition;

SELECT first_crash_type, COUNT(*)
FROM limpieza.crashes
GROUP BY first_crash_type;

SELECT trafficway_type, COUNT(*)
FROM limpieza.crashes
GROUP BY trafficway_type;

-- Verificar si hay registros duplicados
SELECT crash_record_id, COUNT(*)
FROM limpieza.crashes
GROUP BY crash_record_id
HAVING COUNT(*) > 1;

-- Identificación de inconsistencias en los datos
SELECT 'injuries_fatal > injuries_total' AS inconsistency_check, COUNT(*) FROM limpieza.crashes WHERE injuries_fatal > injuries_total
UNION ALL
SELECT 'date_police_notified < crash_date', COUNT(*) FROM limpieza.crashes WHERE date_police_notified < crash_date
UNION ALL
SELECT 'posted_speed_limit = 0', COUNT(*) FROM limpieza.crashes WHERE posted_speed_limit = 0;
