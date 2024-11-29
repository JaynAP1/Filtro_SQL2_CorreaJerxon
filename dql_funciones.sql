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

-- 2.PromedioHorasPorAsignatura(AsignaturaID): Retorna el promedio de horas de clases para una asignatura.
-- 3.TotalHorasPorDepartamento(DepartamentoID): Calcula la cantidad total de horas impartidas por un departamento específico.
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


