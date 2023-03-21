SELECT * FROM generate_series(5,100);

SELECT * FROM generate_series(5, 1, -2);

SELECT current_date + s.a AS dates
FROM generate_series(0,14,7) AS s(a);

SELECT * FROM generate_series('2020-09-01'::TIMESTAMP,
'2020-09-09','10 hours');

SELECT * FROM generate_series('2020-09-01'::TIMESTAMP,
'2020-09-09','1 day');

SELECT a.id, a.nombre, a.apellido,a.carrera_id, s.serie
FROM platzi.alumnos AS a
INNER JOIN generate_series(0,10) AS s(serie)
    ON s.serie = a.carrera_id
ORDER BY a.carrera_id;