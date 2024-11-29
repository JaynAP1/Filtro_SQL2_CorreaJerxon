# Universitario
El proyecto universitario a proporcionado una base de datos que requeria hacer consultas, funciones, triggers y eventos para su completa funcionalidad.

Como desarrolladores de base de datos nos dimos a la tarea de completar las tareas propuestas por el cliente y siempre teniendo en cuenta la accesibilidad de la base de datos.

## Uso
Para hacer uso del proyecto es necesario tener las siguientes herramientas instaladas en nuestro computador.

* MySQL Workbench.
* MySQL Client Server.
* Git.
* Bash.

 1. Como primer paso debemos dirigirnos a github page y copiar el link del repositorio donde se encuentra el proyecto.
 2. Luego nos dirigeremos a una carpeta de nuestra preferencia y procederemos a abrir la terminar de linux. (bash)
 3. Procederemos a pegar el link del repositorio junto con un comando de git.
    
    ```bash
    git clone https://github.com/JaynAP1/Filtro_SQL2_CorreaJerxon.git
    ```
4. Una vez terminado el paso anterior ya deberiamos tener el repositorio en nuestro local.
5. Procedemos a abir los archivos con workbench.
6. Una vez tenemos los scripts en workbench iniciaremos ejecutando el script ddl.sql.
7. Luego de ejecutar el script anterior seguiremos con el script dml.sql.
8. Una vez hecho eso podremos seguir con cualquiera de los scripts restantes.

## Codigos
### Consultas
```sql
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
	select profesor.nombre from profesor left join asignatura on profesor.id = asignatura.id_Profesor where asignatura.id_pr
```

### Funciones
```sql
-- 1.TotalCreditosAlumno(AlumnoID, Anio): Calcula el total de créditos cursados por un alumno en un año específico.

Delimiter //
Create function TotalCreditosAlumno(AlumnoID int, Anio varchar(20))
returns int deterministic
begin
	Declare Retorno int;
    select sum(creditos) Into Retorno from asignatura inner join alumno_se_matricula_asignatura asma on asignatura.id = asma.id_asignatura
	inner join alumno on asma.id_alumno = alumno.id inner join curso_escolar on asma.id_curso_escolar = curso_escolar.id where curso_escolar.anyo_inicio like Anio and alumno.id = AlumnoID; 
    
    return Retorno;
end
// Delimiter ;

select TotalCreditosAlumno(1,"2014")

-- 4.VerificarAlumnoActivo(AlumnoID): Verifica si un alumno está activo en el semestre actual basándose en su matrícula.
Delimiter //
Create function VerificarAlumnoActivo(AlumnoID int, Anio varchar(20))
returns varchar(100) deterministic
begin
	Declare Contador int;
    Declare Retorno varchar(100);
    set Contador = (select count(*) from alumno inner join alumno_se_matricula_asignatura asma on alumno.id = asma.id_alumno inner join 
	curso_escolar on asma.id_curso_escolar = curso_escolar.id where curso_escolar.anyo_inicio like Anio and alumno.id = AlumnoID);
    
	if contador > 0 then
    select "Activo" into Retorno;
    else 
    select "Inactivo" into Retorno;
    end if;
    return Retorno;
    
end
// Delimiter ;

select VerificarAlumnoActivo(1,"2016");

-- 5.EsProfesorVIP(ProfesorID): Verifica si un profesor es "VIP" basándose en el número de asignaturas impartidas y evaluaciones de desempeño.
Delimiter //
Create function EsProfesorVIP(ProfesorID int)
returns varchar(100) deterministic
begin
	Declare Contador int;
    Declare Retorno varchar (100);
    set Contador = (select count(asignatura.id) from profesor inner join asignatura on profesor.id = asignatura.id_profesor where profesor.id = ProfesorID);
    
    if contador > 5 then
    select "Es un profesor VIP" into Retorno;
    else 
    select "No es profesor VIP" into Retorno;
    end if;
    return Retorno;
    
end
// Delimiter ;

select EsProfesorVIP(14)
```

### Triggers
```sql

-- 2.AuditarActualizacionAlumno: Cada vez que se modifica un registro de un alumno, guarda el cambio en una tabla de auditoría.
// Delimiter 
Create trigger ActualizacionAlumno
before update on alumno
for each row
begin
	insert into historial (Caso,Descripcion,Tipo,Nombre_Completo,id_afectada)
    values ("Actualizacion","Posiblemente se a modificado un dato del estudiante","Estudiante",old.nombre, old.id)
end
// Delimiter ;

update alumno set nombre = "Alexandermega"; 

-- 3.RegistrarHistorialCreditos: Al modificar los créditos de una asignatura, guarda un historial de los cambios.
// Delimiter 
Create trigger ActualizacionAlumno
before update on Asignatura
for each row
begin
	insert into historial (Caso,Descripcion,Tipo,Nombre_Completo,id_afectada)
    values ("Actualizacion","Posiblemente se a modificado un dato de la asignatura","asignatura",old.nombre, old.id)
end
// Delimiter ;

```

# Desarrollado por
Proyecto desarrollado por Jerxon Jair Correa Amaris.