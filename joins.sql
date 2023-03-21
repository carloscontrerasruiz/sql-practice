SELECT CONCAT(a.nombre, a.apellido) AS alumno, 
        CONCAT(t.nombre, t.apellido) AS tutor
FROM platzi.alumnos a
INNER JOIN platzi.alumnos t
ON a.tutor_id = t.id;

SELECT CONCAT(t.nombre, t.apellido) AS tutor,
        COUNT(*) AS alumnos_por_tutor
FROM platzi.alumnos a
INNER JOIN platzi.alumnos t ON a.tutor_id = t.id
GROUP BY tutor;

SELECT AVG(alumnos_por_tutor) AS promedio_de_alumno_tutor
FROM(
    SELECT CONCAT(t.nombre, t.apellido) AS tutor,
        COUNT(*) AS alumnos_por_tutor
    FROM platzi.alumnos a
    INNER JOIN platzi.alumnos t ON a.tutor_id = t.id
    GROUP BY tutor
) AS promedio;


SELECT a.nombre, a .apellido, a.carrera_id, c.id, c.carrera
FROM platzi.alumnos a
LEFT JOIN platzi.carreras c ON a.carrera_id = c.id
WHERE c.id IS NULL;

--DELETE FROM platzi.carreras WHERE id BETWEEN 35 AND 40;

SELECT a.nombre, a .apellido, a.carrera_id, c.id, c.carrera
FROM platzi.alumnos a
RIGHT JOIN platzi.carreras c ON a.carrera_id = c.id
WHERE c.id IS NOT NULL;

SELECT a.nombre, a .apellido, a.carrera_id, c.id, c.carrera
FROM platzi.alumnos a
INNER JOIN platzi.carreras c ON a.carrera_id = c.id;

SELECT a.nombre, a .apellido, a.carrera_id, c.id, c.carrera
FROM platzi.alumnos a
FULL OUTER JOIN platzi.carreras c ON a.carrera_id = c.id
ORDER BY a.carrera_id;