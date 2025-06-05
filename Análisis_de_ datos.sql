-- Análisis de datos a través de consultas SQL y creación de atributos analíticos

-- Gravedad de heridas por grupo de edad
SELECT
    CASE -- Tuvimos que invstigar como se hacia un switch
        WHEN age BETWEEN 1 AND 17 THEN '0-17'
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 50 THEN '31-50'
        WHEN age BETWEEN 51 AND 70 THEN '51-70'
        WHEN age > 70 THEN '71+'
        ELSE 'Edad desconocida'
    END AS grupo_edad,
    COUNT(*) AS total_personas,
    SUM(CASE WHEN injury_classification IN ('FATAL', 'INCAPACITATING INJURY') THEN 1 ELSE 0 END) AS heridas_graves,
    ROUND(100.0 * SUM(CASE WHEN injury_classification IN ('FATAL', 'INCAPACITATING INJURY') THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0), 2) AS porcentaje_graves --NULLIF para no dividir entre 0
FROM people
GROUP BY grupo_edad
ORDER BY porcentaje_graves DESC;

-- Relación entre Condición Climática y Superficie de la Carretera
SELECT
    weather_condition AS condicion_climatica,
    roadway_surface_cond AS superficie_carretera,
    COUNT(*) AS total_accidentes,
    SUM(CASE WHEN is_severe THEN 1 ELSE 0 END) AS accidentes_graves,
    ROUND(100.0 * SUM(CASE WHEN is_severe THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0), 2) AS porcentaje_graves
FROM crashes
GROUP BY condicion_climatica, superficie_carretera
HAVING COUNT(*) > 20
ORDER BY porcentaje_graves DESC;

-- Marca del vehículo y gravedad de los accidentes 
SELECT
    vehicles.make AS marca_vehiculo,
    COUNT(*) AS total_accidentes,
    SUM(CASE WHEN crashes.is_severe THEN 1 ELSE 0 END) AS accidentes_graves,
    ROUND(100.0 * SUM(CASE WHEN crashes.is_severe THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0), 2) AS porcentaje_graves
FROM vehicles
JOIN crashes ON vehicles.crash_record_id = crashes.crash_record_id
WHERE vehicles.make IS NOT NULL 
GROUP BY marca_vehiculo
HAVING COUNT(*) > 1000
ORDER BY porcentaje_graves DESC;

-- Gravedad de accidentes por hora del día y día de la semana
SELECT
    EXTRACT(DOW FROM crash_date) AS dia_semana,
    EXTRACT(HOUR FROM crash_date) AS hora_dia,
    COUNT(*) AS total_choques,
    SUM(injuries_fatal) AS total_fallecimientos,
    SUM(injuries_total) AS total_heridos,
    ROUND(100.0 * SUM(injuries_fatal) / NULLIF(COUNT(*), 0), 2) AS porcentaje_fallecimientos,
    ROUND(100.0 * SUM(injuries_total) / NULLIF(COUNT(*), 0), 2) AS porcentaje_heridos
FROM crashes
WHERE crash_date IS NOT NULL
GROUP BY dia_semana, hora_dia
ORDER BY total_fallecimientos DESC, total_heridos DESC;

-- Las 10 calles con más accidentes
SELECT street_name AS nombre_calle, COUNT(*) AS total_choques
FROM crashes
GROUP BY nombre_calle
ORDER BY total_choques DESC
LIMIT 10;

-- Análisis tipo de calles más peligrosas
SELECT 
  trafficway_type AS tipo_calle,
  COUNT(*) AS total_choques,
  SUM(injuries_total) AS total_heridos,
  SUM(injuries_fatal) AS total_fallecimientos,
  ROUND(SUM(injuries_fatal) * 1.0 / NULLIF(COUNT(*), 0), 3) AS tasa_fatalidad
FROM crashes
WHERE tipo_calle IS NOT NULL
GROUP BY tipo_calle
ORDER BY tasa_fatalidad DESC;

-- Días del año con más choques
WITH choques_por_dia_mes AS (
    SELECT 
        EXTRACT(MONTH FROM crash_date) AS mes,
        EXTRACT(DAY FROM crash_date) AS dia,
        COUNT(*) AS total_choques
    FROM crashes
    GROUP BY mes, dia
)
SELECT
    mes,
    dia,
    total_choques
FROM choques_por_dia_mes
ORDER BY total_choques DESC
LIMIT 10;

-- Daño por límite de velocidad
SELECT
    posted_speed_limit AS limite_velocidad,
    COUNT(*) AS total_choques,
    SUM(CASE WHEN damage = 'OVER $1,500' THEN 1 ELSE 0 END) AS choques_graves,
    ROUND(100.0 * SUM(CASE WHEN damage = 'OVER $1,500' THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0), 2) AS porcentaje_graves
FROM crashes
WHERE limite_velocidad IS NOT NULL AND damage IS NOT NULL
GROUP BY limite_velocidad
HAVING COUNT(*) > 20
ORDER BY porcentaje_graves DESC;

-- Año del vehículo vs severidad del accidente
SELECT 
    vehicles.vehicle_year AS anio_vehiculo,
    COUNT(*) AS total_accidentes,
    SUM(CASE WHEN crashes.is_severe THEN 1 ELSE 0 END) AS accidentes_graves,
    ROUND(100.0 * SUM(CASE WHEN crashes.is_severe THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0), 2) AS porcentaje_graves
FROM vehicles
JOIN crashes ON vehicles.crash_record_id = crashes.crash_record_id
WHERE anio_vehiculo IS NOT NULL 
  AND anio_vehiculo BETWEEN 1 AND EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY anio_vehiculo
HAVING COUNT(*) > 50
ORDER BY porcentaje_graves DESC;

-- Efectividad de la bolsa de aire en protección
SELECT
    airbag_deployed AS bolsa_aire,
    total_accidents AS total_accidentes,
    fatalities AS total_fallecimientos,
    serious_injuries AS total_heridas_graves,
    ROUND(100.0 * fatalities / NULLIF(total_accidents, 0), 2) AS tasa_fatalidad,
    ROUND(100.0 * serious_injuries / NULLIF(total_accidents, 0), 2) AS tasa_heridas_graves
FROM (
    SELECT
        airbag_deployed,
        COUNT(*) AS total_accidents,
        SUM(CASE WHEN injury_classification = 'FATAL' THEN 1 ELSE 0 END) AS fatalities,
        SUM(CASE WHEN injury_classification IN ('INCAPACITATING INJURY', 'NON-INCAPACITATING INJURY') THEN 1 ELSE 0 END) AS serious_injuries
    FROM people
    WHERE airbag_deployed IS NOT NULL
    GROUP BY airbag_deployed
) AS subconsulta
ORDER BY tasa_heridas_graves DESC;

-- Día del año con menor promedio de edad de personas involucradas en un choque
SELECT 
    ROUND(AVG(age),2) AS promedio_edad,
    EXTRACT(MONTH FROM crash_date) AS mes,
    EXTRACT(DAY FROM crash_date) AS dia
FROM people
JOIN vehicles ON people.vehicle_id = vehicles.vehicle_id
JOIN crashes ON crashes.crash_record_id = vehicles.crash_record_id
WHERE age > 0
GROUP BY mes, dia
ORDER BY promedio_edad;

-- Otra manera, viendo el porcentaje de menores de edad en la poblaciónn 
SELECT
    EXTRACT(MONTH FROM crash_date) AS mes,
    EXTRACT(DAY FROM crash_date) AS dia,
    COUNT(*) AS total_personas,
    SUM(CASE WHEN age < 18 THEN 1 ELSE 0 END) AS menores_18,
    ROUND(100.0 * SUM(CASE WHEN age < 18 THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0), 2) AS porcentaje_menores_18
FROM people
JOIN vehicles ON people.vehicle_id = vehicles.vehicle_id
JOIN crashes ON vehicles.crash_record_id = crashes.crash_record_id
WHERE age IS NOT NULL AND age > 0
GROUP BY mes, dia
ORDER BY porcentaje_menores_18 DESC;

