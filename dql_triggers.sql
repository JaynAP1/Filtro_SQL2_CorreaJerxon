-- 1.ActualizarTotalAsignaturasProfesor: Al asignar una nueva asignatura a un profesor, actualiza el total de asignaturas impartidas por dicho profesor.

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
-- 4.NotificarCancelacionMatricula: Registra una notificación cuando se elimina una matrícula de un alumno.
-- 5.RestringirAsignacionExcesiva: Evita que un profesor tenga más de 10 asignaturas asignadas en un semestre.