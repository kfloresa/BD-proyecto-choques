DROP SCHEMA IF EXISTS normalizacion CASCADE;
CREATE SCHEMA normalizacion;

DROP TABLE IF EXISTS normalizacion.crashes CASCADE;
CREATE TABLE normalizacion.crashes AS
SELECT * FROM limpieza.crashes;

DROP TABLE IF EXISTS normalizacion.vehicles CASCADE;
CREATE TABLE normalizacion.vehicles AS
SELECT * FROM limpieza.vehicles;

DROP TABLE IF EXISTS normalizacion.people CASCADE;
CREATE TABLE normalizacion.people AS
SELECT * FROM limpieza.people;

--Dependencias funcionales:
--Crashes:
--crash_record_id -> E (key)

--Vehicles:
--crash_unit_id -> E (key)
--vehicle_id -> crash_unit_id (Excepciones)

--People:
--person_id -> E (key)
--crash_record_id ->-> vehicle_id (Excepciones)
--(Y aunque no están en la misma tabla, crash_record_id ->-> vehicles.crash_unit_id, generando redundancias)

ALTER TABLE normalizacion.people ADD COLUMN crash_unit_id INT;
WITH w AS (
	SELECT v.crash_unit_id, p.person_id
	FROM normalizacion.vehicles as v INNER JOIN normalizacion.people as p
	ON v.crash_record_id = p.crash_record_id
	WHERE v.vehicle_id = p.vehicle_id
	AND v.unit_type = p.person_type
	OR (v.unit_type = 'DRIVER' 
	AND p.person_type = 'PASSENGER')
	LIMIT 10
)
UPDATE normalizacion.people as p
SET crash_unit_id = (
	SELECT crash_unit_id
	FROM w
	WHERE w.person_id = p.person_id
	AND w.crash_unit_id NOT IN (
		SELECT crash_unit_id
		FROM normalizacion.people
	)
	LIMIT 1
);
ALTER TABLE normalizacion.people DROP COLUMN crash_record_id, DROP COLUMN vehicle_id;
ALTER TABLE normalizacion.vehicles DROP COLUMN vehicle_id;

--crashes.num_units cumpla hasta 4fn, pero hay redundancia.

ALTER TABLE normalizacion.crashes DROP COLUMN num_units;

--No hay dependencias funcionales de ubicaciones, que nos esperábamos.

--Se pasa todo al schema public con restricciones, primary keys y foreign keys
CREATE TABLE crashes (
	crash_record_id VARCHAR(200) PRIMARY KEY,
	crash_date TIMESTAMP NOT NULL,
	posted_speed_limit SMALLINT NOT NULL,
	weather condition VARCHAR(100),
	lighting_condition VARCHAR(100),
	first_crash_type VARCHAR(100),
	trafficway_type VARCHAR(100),
	roadway_surface_condition VARCHAR(100),
	road_defect VARCHAR(100),
	damage VARCHAR(100),
	prim_contributory_cause VARCHAR(100),
	sec_contributory_cause VARCHAR(100),
	street_name VARCHAR(100),
	injuries_total SMALLINT,
	injuries_fatal SMALLINT,
	crash_day_of_week SMALLINT
);

INSERT INTO crashes (crash_record_id, crash_date, posted_speed_limit, weather_condition, lighting_condition, first_crash_type, trafficway_type, roadway_surface_cond, road_defect, damage, prim_contributory_cause, sec_contributory_cause, street_name, injuries_total, injuries_fatal, crash_day_of_week)
SELECT crash_record_id, crash_date, posted_speed_limit, weather_condition, lighting_condition, first_crash_type, trafficway_type, roadway_surface_cond, road_defect, damage, prim_contributory_cause, sec_contributory_cause, street_name, injuries_total, injuries_fatal, crash_day_of_week
FROM normalizacion.crashes;

CREATE TABLE vehicles (
	crash_unit_id BIGINT PRIMARY KEY,
	crash_record_id VARCHAR(200) NOT NULL REFERENCES crashes(crash_record_id),
	unit_type VARCHAR(20) NOT NULL,
	num_passengers SMALLINT,
	make VARCHAR(100),
	model VARCHAR(100),
	vehicle_year INT
);

INSERT INTO vehicles (crash_unit_id, crash_record_id, unit_type, num_passengers, make, model, vehicle_year)
SELECT crash_unit_id, crash_record_id, unit_type, num_passengers, make, model, vehicle_year
FROM normalizacion.vehicles;

CREATE TABLE people (
	person_id VARCHAR(20) PRIMARY KEY,
	person_type VARCHAR(20) NOT NULL,
	crash_unit_id BIGINT NOT NULL REFERENCES vehicles(crash_unit_id),
	seat_no SMALLINT,
	age SMALLINT NOT NULL,
	airbag_deployed VARCHAR(100),
	injury_classification VARCHAR(100)
);

INSERT INTO people (person_id, person_type. crash_unit_id, seat_no, age, airbag_deployed, injury_classification)
SELECT person_id, person_type. crash_unit_id, seat_no, age, airbag_deployed, injury_classification
FROM normalizacion.people;
