-- 1.Encuentra el profesor que ha impartido más asignaturas en el último año académico.
	select profesor.id, profesor.nombre, profesor.apellido1, count(asignatura.id) from profesor inner join asignatura on profesor.id = asignatura.id_profesor group by 1,2 order by 3 asc limit 1;
    
-- 2.Lista los cinco departamentos con mayor cantidad de asignaturas asignadas.
	select departamento.nombre, count(*) as cantidad_asignaturas from departamento inner join profesor on departamento.id = profesor.id_departamento group by 1 order by 2 desc limit 5;
    
-- 3.Obtén el total de alumnos y docentes por departamento.
	select departamento. nombre, count(profesor.nombre) as cantidad 
    from departamento inner join profesor on departamento.id = profesor.id_departamento
    group by 1;

-- 4.Calcula el número total de alumnos matriculados en asignaturas de un género específico en un semestre determinado.
	select asignatura.nombre, count(*) from alumno inner join alumno_se_matricula_asignatura asma on alumno.id = asma.id_alumno
    inner join asignatura on asma.id_asignatura = asignatura.id inner join curso_escolar on asma.id_curso_escolar = curso_escolar.id where curso_escolar.id = 1 group by 1;
    
-- 5.Encuentra los alumnos que han cursado todas las asignaturas de un grado específico.
	select  distinct alumno.* from alumno inner join alumno_se_matricula_asignatura asma on alumno.id = asma.id_alumno
    inner join asignatura on asma.id_asignatura = asignatura.id inner join grado on asignatura.id_grado = grado.id where grado.id = 4;

-- 6.Lista los tres grados con mayor número de asignaturas cursadas en el último semestre.
	select grado.nombre , count(grado.id) from grado inner join asignatura on grado.id = asignatura.id_grado group by 1 order by 2 desc;
    
-- 7.Muestra los cinco profesores con menos asignaturas impartidas en el último año académico.
	select profesor.nombre,apellido1,apellido2, count(asignatura.id) as cantidad_asignaturas  from profesor inner join asignatura on profesor.id = asignatura.id_profesor group by 1,2,3 order by 4 asc;

-- 8.Calcula el promedio de edad de los alumnos al momento de su primera matrícula.
	select distinct alumno.nombre,anyo_inicio - year(fecha_nacimiento) from alumno inner join alumno_se_matricula_asignatura asma on alumno.id = asma.id_alumno inner join curso_escolar on asma.id_curso_escolar = curso_escolar.id where curso_escolar.id = 1;

-- 9.Encuentra los cinco profesores que han impartido más clases de un mismo grado.
	select profesor.nombre, grado.nombre, count(grado.id) from profesor inner join asignatura on profesor.id = asignatura.id_profesor inner join grado on asignatura.id_grado = grado.id group by 1, 2 order by 3 desc;

-- 10.Genera un informe con los alumnos que han cursado más de 10 asignaturas en el último año.
	select  alumno.nombre, count(alumno.nombre) from alumno inner join alumno_se_matricula_asignatura asma on alumno.id = asma.id_alumno
    inner join asignatura on asma.id_asignatura = asignatura.id inner join curso_escolar on asma.id_curso_escolar = curso_escolar.id group by 1 having count(alumno.nombre) >= 10;
    
-- 11.Calcula el promedio de créditos de las asignaturas por grado.
	select grado.id, grado.nombre, avg(creditos) from asignatura inner join grado on asignatura.id_grado = grado.id group by 1;
    
-- 12.Lista las cinco asignaturas más largas (en horas) impartidas en el último semestre.
	
    -- ??????

-- 13.Muestra los alumnos que han cursado más asignaturas de un género específico.
	select  alumno.nombre, count(alumno.nombre) from alumno inner join alumno_se_matricula_asignatura asma on alumno.id = asma.id_alumno
    inner join asignatura on asma.id_asignatura = asignatura.id where alumno.sexo = "M" group by 1;

-- 14.Encuentra la cantidad total de horas cursadas por cada alumno en el último semestre.
	
    -- ??????
    
-- 15.Muestra el número de asignaturas impartidas diariamente en cada mes del último trimestre.

	-- 

-- 16.Calcula el total de asignaturas impartidas por cada profesor en el último semestre.
	select profesor.nombre, count(asignatura.nombre) as Cantidad from profesor inner join asignatura on profesor.id = asignatura.id_profesor where asignatura.cuatrimestre = 2 group by 1;
    
-- 17.Encuentra al alumno con la matrícula más reciente.
	select * from alumno inner join alumno_se_matricula_asignatura asma on alumno.id = asma.id_alumno inner join curso_escolar on asma.id_curso_escolar = curso_escolar.id where curso_escolar.id= 4;

-- 18.Lista los cinco grados con mayor número de alumnos matriculados durante los últimos tres meses.
	select * from grado inner join asignatura on grado.id = asignatura.id_grado inner join alumno_se_matricula_asignatura asma on asignatura.id = asma.id_asignatura
    inner join curso_escolar on asma.id_curso_escolar = curso_escolar.id where curso_escolar.id = 4;
    
-- 19.Obtén la cantidad de asignaturas cursadas por cada alumno en el último semestre.
	select alumno.nombre, count(*) as cantidad_asignaturas from asignatura inner join alumno_se_matricula_asignatura asma on asignatura.id = asma.id_asignatura
    inner join curso_escolar on asma.id_curso_escolar = curso_escolar.id inner join alumno on asma.id_alumno = alumno.id where curso_escolar.id = 4 group by 1;

-- 20.Lista los profesores que no han impartido clases en el último año académico.
	select profesor.nombre from profesor left join asignatura on profesor.id = asignatura.id_Profesor where asignatura.id_profesor is null;

