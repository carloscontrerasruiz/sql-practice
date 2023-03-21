-- Active: 1675369738083@@127.0.0.1@5432@postgres@platzi
SELECT fecha_incorporacion
FROM platzi.alumnos
ORDER BY fecha_incorporacion DESC;

SELECT carrera_id, fecha_incorporacion
FROM platzi.alumnos
GROUP BY carrera_id, fecha_incorporacion
ORDER BY fecha_incorporacion DESC;

SELECT carrera_id, MAX(fecha_incorporacion)
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY carrera_id DESC;