CREATE DATABASE Idiomas;
USE Idiomas;

CREATE TABLE alumnos (
DNI CHAR(9) PRIMARY KEY,
Nombre VARCHAR(50) NOT NULL,
Apellidos VARCHAR(100) NOT NULL,
Direccion VARCHAR(150),
FechaNacimiento DATE NOT NULL,
Sexo ENUM('H', 'M') NOT NULL,
CodigoCurso INT,
FOREIGN KEY (codigo_curso) REFERENCES cursos(codigo)

CREATE TABLE profesores (
DNI CHAR(9) PRIMARY KEY,
Nombre VARCHAR(50) NOT NULL,
Apellidos VARCHAR(100) NOT NULL,
Direccion VARCHAR(150),
Titulo_academico ENUM('LDO', 'DDO', 'CFGS') NOT NULL,
Precio_hora DECIMAL(10, 2) NOT NULL CHECK (precio_hora > 0)
);

CREATE TABLE cursos (
Codigo INT PRIMARY KEY AUTO_INCREMENT,
Nombre VARCHAR(100) NOT NULL,
NumAlumnosRecomendado INT NOT NULL CHECK (num_alumnos_recomendado >= 10),
DNIProfesor CHAR(9) NOT NULL,
FechaInicio DATE NOT NULL,
FechaFin DATE NOT NULL CHECK (fecha_fin > fecha_inicio),
TotalHoras INT NOT NULL CHECK (total_horas >= 80),
FOREIGN KEY (dni_profesor) REFERENCES profesores(dni)
);