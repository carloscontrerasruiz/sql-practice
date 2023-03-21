SELECT lpad('sql',15,'*');

SELECT lpad('*',id,'*')
FROM platzi.alumnos
WHERE id < 10;

SELECT lpad('*',id,'*')
FROM platzi.alumnos
WHERE id < 10;

SELECT lpad('*',CAST(row_id AS int),'*'), carrera_id
FROM (
    SELECT ROW_NUMBER() OVER(ORDER BY carrera_id) as row_id,* 
    FROM platzi.alumnos
) AS with_row
WHERE row_id <= 10
ORDER BY carrera_id;
