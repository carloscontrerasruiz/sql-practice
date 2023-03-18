SELECT int4range(10, 20) @> 3;
-- el simbolo @> devuelve un boleano si o si no encuentra el valor

SELECT numrange(11.1,22.2) && numrange(20.0,30.0);
--Compara si los rangos se encuantran en algun pg_function_is_visible

SELECT UPPER(int8range(15,25));

SELECT LOWER(int8range(15,25));

SELECT int4range(10,20) * int4range(15,25);
--Nos muestra donde se intersecatn estos rangos

SELECT *
FROM platzi.alumnos
WHERE int4range(10,20) @> tutor_id;

SELECT numrange(
    (SELECT MIN(tutor_id) FROM platzi.alumnos),
    (SELECT MAX(tutor_id) FROM platzi.alumnos)
) * numrange(
    (SELECT MIN(carrera_id) FROM platzi.alumnos),
    (SELECT MAX(carrera_id) FROM platzi.alumnos)
);