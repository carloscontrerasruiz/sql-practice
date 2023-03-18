SELECT EXTRACT(YEAR FROM fecha_incorporacion) AS anio_incorporacion
FROM platzi.alumnos;

SELECT DATE_PART('YEAR',fecha_incorporacion) AS anio_incorporacion
FROM platzi.alumnos;

SELECT DATE_PART('YEAR',fecha_incorporacion) AS anio_incorporacion,
DATE_PART('MONTH',fecha_incorporacion) AS mes_incorporacion,
DATE_PART('DAY',fecha_incorporacion) AS dia_incorporacion
FROM platzi.alumnos;

SELECT *
FROM platzi.alumnos
WHERE (DATE_PART('YEAR',fecha_incorporacion)) >= 2018;

SELECT DATE_PART('HOUR',fecha_incorporacion) AS hora_incorporacion,
DATE_PART('MINUTE',fecha_incorporacion) AS minuto_incorporacion,
DATE_PART('SECOND',fecha_incorporacion) AS segundo_incorporacion
FROM platzi.alumnos;

SELECT *, DATE_PART('YEAR',fecha_incorporacion) as anio, 
        DATE_PART('MONTH',fecha_incorporacion) as mes
FROM platzi.alumnos
WHERE (DATE_PART('YEAR',fecha_incorporacion)) = 2018 
AND (DATE_PART('MONTH',fecha_incorporacion)) = 5;

SELECT *, 
        CASE 
            WHEN  mes = 1 THEN  'ENERO'
            WHEN  mes = 2 THEN  'FEBRERRO'
            WHEN  mes = 3 THEN  'MARZO'
            WHEN  mes = 4 THEN  'ABRIL'
            WHEN  mes = 5 THEN  'MAYO'
            WHEN  mes = 6 THEN  'JUNIO'
            WHEN  mes = 7 THEN  'JULIO'
            ELSE  'MES DESCONOCIDO'
        END AS mes_nombre
FROM (
    SELECT *, DATE_PART('YEAR',fecha_incorporacion) as anio, 
        DATE_PART('MONTH',fecha_incorporacion) as mes
    FROM platzi.alumnos
) AS alumnos_mes
WHERE anio = 2018 
AND mes = 5;
