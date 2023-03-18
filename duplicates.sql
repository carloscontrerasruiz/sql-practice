insert into platzi.alumnos 
(id, nombre, apellido, email, colegiatura, fecha_incorporacion, carrera_id, tutor_id) 
values (1001, 'Pamelina', null, 'pmylchreestrr@salon.com', 4800, '2020-04-26 10:18:51', 12, 16);

SELECT *
FROM platzi.alumnos AS oute
WHERE (
    SELECT COUNT(*) 
    FROM platzi.alumnos AS inne 
    WHERE oute.email = inne.email
) > 1;

-- COMPARAR VALORES DE UN REGISTRO
SELECT (platzi.alumnos.*)::text, COUNT(*)
FROM platzi.alumnos 
GROUP BY platzi.alumnos.*
LIMIT 10;

SELECT (
        platzi.alumnos.nombre,
        platzi.alumnos.apellido,
        platzi.alumnos.email,
        platzi.alumnos.fecha_incorporacion
    )::text, COUNT(*)
FROM platzi.alumnos 
GROUP BY platzi.alumnos.nombre,
        platzi.alumnos.apellido,
        platzi.alumnos.email,
        platzi.alumnos.fecha_incorporacion
HAVING COUNT(*) > 1;
-- ::text | vuelve texto todos los campos que indiquemos

SELECT *
FROM (
    SELECT id,
    ROW_NUMBER() OVER(
        PARTITION BY 
        nombre,apellido,email,fecha_incorporacion
        ORDER BY id ASC
    ) as row,
    *
    FROM platzi.alumnos
) AS duplicados
WHERE duplicados.row > 1;