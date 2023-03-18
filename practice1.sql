-- Active: 1675369738083@@127.0.0.1@5432@postgres@platzi
--select * from platzi.alumnos limit 10;
--select * from platzi.carreras limit 10;

--select * from platzi.alumnos order by nombre limit 1;
--select * from platzi.alumnos fetch first 1 rows only;
--select * from platzi.alumnos fetch first 5 rows only;

SELECT *
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY nombre) AS row_id, *
	FROM platzi.alumnos
) as alumnos_with_row_number
limit 5;

SELECT *
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY nombre) AS row_id, *
	FROM platzi.alumnos
) as alumnos_with_row_number
where row_id <= 5;

SELECT DISTINCT colegiatura
FROM platzi.alumnos as a1
WHERE 2 = (
	SELECT COUNT(DISTINCT colegiatura)
	FROM platzi.alumnos a2
	WHERE a1.colegiatura <= a2.colegiatura
);

-- Segunda colegiatura mas alta
SELECT DISTINCT colegiatura
FROM platzi.alumnos as a1
ORDER BY colegiatura DESC
OFFSET 1
LIMIT 1;

SELECT * FROM platzi.alumnos as datos_alumno
INNER JOIN (
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
) as segunda_mayor_colegiatura
ON datos_alumno.colegiatura = segunda_mayor_colegiatura.colegiatura;

SELECT *
FROM platzi.alumnos as datos_alumnos
WHERE colegiatura = (
    SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
);

SELECT ROW_NUMBER() OVER() AS row_id, *
FROM platzi.alumnos
OFFSET (
    SELECT COUNT(nombre)/2
    FROM platzi.alumnos
);

SELECT *
FROM platzi.alumnos
WHERE id IN (1,5,6);

SELECT *
FROM platzi.alumnos
WHERE id IN (
    SELECT id FROM platzi.alumnos WHERE tutor_id = 30
);

SELECT *
FROM platzi.alumnos
WHERE id NOT IN (
    SELECT id FROM platzi.alumnos WHERE tutor_id = 30
);