Create Database if not exists Universitario;

Use Universitario;

Create table if not exists Departamento (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

Create table if not exists Profesor (
id INT AUTO_INCREMENT PRIMARY KEY,
nif VARCHAR(9),
nombre VARCHAR(25) NOT NULL,
apellido1 VARCHAR(50) NOT NULL,
apellido2 VARCHAR(50),
ciudad VARCHAR(25) NOT NULL,
direccion VARCHAR(50) NOT NULL,
telefono VARCHAR(9),
fecha_nacimiento DATE NOT NULL,
sexo ENUM('H','M') NOT NULL,
id_departamento INT NOT NULL,
foreign key (id_departamento) references departamento(id)
);

Create table if not exists Grado(
id INT PRIMARY KEY,
nombre VARCHAR(100)
);

Create table if not exists Asignatura (
id INT(10) PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
creditos FLOAT NOT NULL,
tipo ENUM("basica","obligatoria","optativa") NOT NULL,
curso TINYINT(3) NOT NULL,
cuatrimestre TINYINT(3),
id_profesor INT(10),
id_grado INT(10) NOT NULL,
foreign key (id_profesor) references profesor (id),
foreign key (id_grado) references Grado(id)
);

Create table if not exists Curso_escolar (
id INT PRIMARY KEY,
anyo_inicio VARCHAR(20) NOT NULL,
anyo_fin VARCHAR(20) NOT NULL
);

Create table if not exists Alumno (
id INT PRIMARY KEY,
nif VARCHAR(9),
nombre VARCHAR(25) NOT NULL,
apellido1 VARCHAR(50) NOT NULL,
apellido2 VARCHAR(50),
ciudad VARCHAR(25) NOT NULL,
direccion VARCHAR(50) NOT NULL,
telefono VARCHAR(9),
fecha_nacimiento DATE NOT NULL,
sexo ENUM('H','M') NOT NULL
);

Create table if not exists alumno_se_matricula_asignatura(
id_alumno INT(10),
id_asignatura INT(10),
id_curso_escolar INT(10)
);

Create table if not exists Historial (
id INT AUTO_INCREMENT PRIMARY KEY,
caso VARCHAR(100),
descripcion VARCHAR(100),
tipo VARCHAR(100),
nombre VARCHAR(100),
id_afectada INT
)
