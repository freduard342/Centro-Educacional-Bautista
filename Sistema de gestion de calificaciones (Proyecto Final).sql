CREATE DATABASE Sistema_Gestion_Calificaciones;
GO

USE Sistema_Gestion_Calificaciones;
GO

-- Tabla: Rol
CREATE TABLE Rol (
    Id_Rol INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Rol VARCHAR(50) NOT NULL
);

-- Tabla: Usuario
CREATE TABLE Usuario (
    Id_Usuario INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Usuario VARCHAR(50) NOT NULL,
    Contraseña VARCHAR(100) NOT NULL,
    Id_Rol INT NOT NULL,
    FOREIGN KEY (Id_Rol) REFERENCES Rol(Id_Rol)
);

-- Tabla: Maestro
CREATE TABLE Maestro (
    Id_Maestro INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20),
    Id_Usuario INT NOT NULL,
    FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
);

-- Tabla: Estudiante
CREATE TABLE Estudiante (
    Id_Estudiante INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100),
    Genero VARCHAR(20),
    Fecha_Nacimiento DATE NOT NULL,
    Nombre_Padres VARCHAR(100),
    Telefono_Padre VARCHAR(20)
);

-- Tabla: Curso
CREATE TABLE Curso (
    Id_Curso INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Curso VARCHAR(50) NOT NULL,
    Nivel VARCHAR(50),
    Tanda VARCHAR(50),
    Id_Maestro INT NOT NULL,
    FOREIGN KEY (Id_Maestro) REFERENCES Maestro(Id_Maestro)
);

-- Tabla: Asignatura
CREATE TABLE Asignatura (
    Id_Asignatura INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Asignatura VARCHAR(50) NOT NULL
);

-- Tabla: Matricula
CREATE TABLE Matricula (
    Id_Matricula INT PRIMARY KEY IDENTITY(1,1),
    Fecha_Ingreso DATE NOT NULL,
    Id_Estudiante INT NOT NULL,
    Id_Curso INT NOT NULL,
    FOREIGN KEY (Id_Estudiante) REFERENCES Estudiante(Id_Estudiante),
    FOREIGN KEY (Id_Curso) REFERENCES Curso(Id_Curso)
);

-- Tabla: Horario
CREATE TABLE Horario (
    Id_Horario INT PRIMARY KEY IDENTITY(1,1),
    Aula VARCHAR(20),
    Hora_Inicio TIME NOT NULL,
    Hora_Fin TIME NOT NULL,
    Dia VARCHAR(20),
    Id_Asignatura INT NOT NULL,
    Id_Curso INT NOT NULL,
    FOREIGN KEY (Id_Asignatura) REFERENCES Asignatura(Id_Asignatura),
    FOREIGN KEY (Id_Curso) REFERENCES Curso(Id_Curso)
);

-- Tabla: Calificacion
CREATE TABLE Calificacion (
    Id_Calificacion INT PRIMARY KEY IDENTITY(1,1),
    P1 DECIMAL(5,2),
    P2 DECIMAL(5,2),
    P3 DECIMAL(5,2),
    P4 DECIMAL(5,2),
    Id_Asignatura INT NOT NULL,
    Id_Maestro INT NOT NULL,
    Id_Matricula INT NOT NULL,
    FOREIGN KEY (Id_Asignatura) REFERENCES Asignatura(Id_Asignatura),
    FOREIGN KEY (Id_Maestro) REFERENCES Maestro(Id_Maestro),
    FOREIGN KEY (Id_Matricula) REFERENCES Matricula(Id_Matricula)
);


/* =========================================================
   INSERTS PARA TABLA ROL
========================================================= */
INSERT INTO Rol (Nombre_Rol)
VALUES 
('Administrador'),
('Maestro'),
('Secretaria');
GO

/* =========================================================
   INSERTS PARA TABLA USUARIO
========================================================= */
INSERT INTO Usuario (Nombre_Usuario, Contraseña, Id_Rol)
VALUES
('admin01', 'Admin123', 1),
('maestro01', 'Maestro123', 2),
('secretaria01', 'Secret123', 3);
GO

/* =========================================================
   INSERTS PARA TABLA MAESTRO
========================================================= */
INSERT INTO Maestro (Nombre, Apellido, Telefono, Id_Usuario)
VALUES
('Carlos', 'Perez', '809-555-1001', 2),
('Ana', 'Lopez', '809-555-1002', 2);
GO

/* =========================================================
   INSERTS PARA TABLA ESTUDIANTE
========================================================= */
INSERT INTO Estudiante 
(Nombre, Apellido, Direccion, Genero, Fecha_Nacimiento, Nombre_Padres, Telefono_Padre)
VALUES
('Luis', 'Martinez', 'Santo Domingo', 'Masculino', '2008-05-12', 'Pedro Martinez', '809-444-1111'),
('Maria', 'Gomez', 'Santiago', 'Femenino', '2007-11-20', 'Juana Gomez', '809-444-2222'),
('Jose', 'Rodriguez', 'La Vega', 'Masculino', '2009-03-10', 'Carlos Rodriguez', '809-444-3333');
GO

/* =========================================================
   INSERTS PARA TABLA CURSO
========================================================= */
INSERT INTO Curso (Nombre_Curso, Nivel, Tanda, Id_Maestro)
VALUES
('1ro A', 'Secundaria', 'Matutina', 1),
('2do B', 'Secundaria', 'Vespertina', 2);
GO

/* =========================================================
   INSERTS PARA TABLA ASIGNATURA
========================================================= */
INSERT INTO Asignatura (Nombre_Asignatura)
VALUES
('Matematica'),
('Lengua Española'),
('Ciencias Sociales'),
('Informatica');
GO

/* =========================================================
   INSERTS PARA TABLA MATRICULA
========================================================= */
INSERT INTO Matricula (Fecha_Ingreso, Id_Estudiante, Id_Curso)
VALUES
('2025-08-15', 1, 1),
('2025-08-15', 2, 1),
('2025-08-15', 3, 2);
GO

/* =========================================================
   INSERTS PARA TABLA HORARIO
========================================================= */
INSERT INTO Horario 
(Aula, Hora_Inicio, Hora_Fin, Dia, Id_Asignatura, Id_Curso)
VALUES
('A1', '08:00', '09:00', 'Lunes', 1, 1),
('A1', '09:00', '10:00', 'Martes', 2, 1),
('B2', '10:00', '11:00', 'Miercoles', 4, 2);
GO

/* =========================================================
   INSERTS PARA TABLA CALIFICACION
========================================================= */
INSERT INTO Calificacion
(P1, P2, P3, P4, Id_Asignatura, Id_Maestro, Id_Matricula)
VALUES
(85, 90, 88, 92, 1, 1, 1),
(78, 80, 82, 85, 2, 1, 2),
(90, 91, 93, 95, 4, 2, 3);
GO


/* =========================================================
   PROCEDIMIENTOS CRUD - TABLA ROL
========================================================= */

-- INSERTAR
CREATE PROCEDURE SP_InsertarRol
    @Nombre_Rol VARCHAR(50)
AS
BEGIN
    INSERT INTO Rol(Nombre_Rol)
    VALUES(@Nombre_Rol)
END
GO

-- MOSTRAR
CREATE PROCEDURE SP_MostrarRol
AS
BEGIN
    SELECT * FROM Rol
END
GO

-- ACTUALIZAR
CREATE PROCEDURE SP_ActualizarRol
    @Id_Rol INT,
    @Nombre_Rol VARCHAR(50)
AS
BEGIN
    UPDATE Rol
    SET Nombre_Rol = @Nombre_Rol
    WHERE Id_Rol = @Id_Rol
END
GO

-- ELIMINAR
CREATE PROCEDURE SP_EliminarRol
    @Id_Rol INT
AS
BEGIN
    DELETE FROM Rol
    WHERE Id_Rol = @Id_Rol
END
GO


/* =========================================================
   CRUD - USUARIO
========================================================= */

CREATE PROCEDURE SP_InsertarUsuario
    @Nombre_Usuario VARCHAR(50),
    @Contraseña VARCHAR(100),
    @Id_Rol INT
AS
BEGIN
    INSERT INTO Usuario(Nombre_Usuario, Contraseña, Id_Rol)
    VALUES(@Nombre_Usuario, @Contraseña, @Id_Rol)
END
GO

CREATE PROCEDURE SP_MostrarUsuario
AS
BEGIN
    SELECT * FROM Usuario
END
GO

CREATE PROCEDURE SP_ActualizarUsuario
    @Id_Usuario INT,
    @Nombre_Usuario VARCHAR(50),
    @Contraseña VARCHAR(100),
    @Id_Rol INT
AS
BEGIN
    UPDATE Usuario
    SET Nombre_Usuario = @Nombre_Usuario,
        Contraseña = @Contraseña,
        Id_Rol = @Id_Rol
    WHERE Id_Usuario = @Id_Usuario
END
GO

CREATE PROCEDURE SP_EliminarUsuario
    @Id_Usuario INT
AS
BEGIN
    DELETE FROM Usuario
    WHERE Id_Usuario = @Id_Usuario
END
GO


/* =========================================================
   CRUD - MAESTRO
========================================================= */

CREATE PROCEDURE SP_InsertarMaestro
    @Nombre VARCHAR(50),
    @Apellido VARCHAR(50),
    @Telefono VARCHAR(20),
    @Id_Usuario INT
AS
BEGIN
    INSERT INTO Maestro(Nombre, Apellido, Telefono, Id_Usuario)
    VALUES(@Nombre, @Apellido, @Telefono, @Id_Usuario)
END
GO

CREATE PROCEDURE SP_MostrarMaestro
AS
BEGIN
    SELECT * FROM Maestro
END
GO

CREATE PROCEDURE SP_ActualizarMaestro
    @Id_Maestro INT,
    @Nombre VARCHAR(50),
    @Apellido VARCHAR(50),
    @Telefono VARCHAR(20),
    @Id_Usuario INT
AS
BEGIN
    UPDATE Maestro
    SET Nombre = @Nombre,
        Apellido = @Apellido,
        Telefono = @Telefono,
        Id_Usuario = @Id_Usuario
    WHERE Id_Maestro = @Id_Maestro
END
GO

CREATE PROCEDURE SP_EliminarMaestro
    @Id_Maestro INT
AS
BEGIN
    DELETE FROM Maestro
    WHERE Id_Maestro = @Id_Maestro
END
GO


/* =========================================================
   CRUD - ESTUDIANTE
========================================================= */

CREATE PROCEDURE SP_InsertarEstudiante
    @Nombre VARCHAR(50),
    @Apellido VARCHAR(50),
    @Direccion VARCHAR(100),
    @Genero VARCHAR(20),
    @Fecha_Nacimiento DATE,
    @Nombre_Padres VARCHAR(100),
    @Telefono_Padre VARCHAR(20)
AS
BEGIN
    INSERT INTO Estudiante
    VALUES
    (@Nombre,@Apellido,@Direccion,@Genero,@Fecha_Nacimiento,@Nombre_Padres,@Telefono_Padre)
END
GO

CREATE PROCEDURE SP_MostrarEstudiante
AS
BEGIN
    SELECT * FROM Estudiante
END
GO

CREATE PROCEDURE SP_ActualizarEstudiante
    @Id_Estudiante INT,
    @Nombre VARCHAR(50),
    @Apellido VARCHAR(50),
    @Direccion VARCHAR(100),
    @Genero VARCHAR(20),
    @Fecha_Nacimiento DATE,
    @Nombre_Padres VARCHAR(100),
    @Telefono_Padre VARCHAR(20)
AS
BEGIN
    UPDATE Estudiante
    SET Nombre = @Nombre,
        Apellido = @Apellido,
        Direccion = @Direccion,
        Genero = @Genero,
        Fecha_Nacimiento = @Fecha_Nacimiento,
        Nombre_Padres = @Nombre_Padres,
        Telefono_Padre = @Telefono_Padre
    WHERE Id_Estudiante = @Id_Estudiante
END
GO

CREATE PROCEDURE SP_EliminarEstudiante
    @Id_Estudiante INT
AS
BEGIN
    DELETE FROM Estudiante
    WHERE Id_Estudiante = @Id_Estudiante
END
GO


/* =========================================================
   CRUD - CURSO
========================================================= */

CREATE PROCEDURE SP_InsertarCurso
    @Nombre_Curso VARCHAR(50),
    @Nivel VARCHAR(50),
    @Tanda VARCHAR(50),
    @Id_Maestro INT
AS
BEGIN
    INSERT INTO Curso
    VALUES(@Nombre_Curso,@Nivel,@Tanda,@Id_Maestro)
END
GO

CREATE PROCEDURE SP_MostrarCurso
AS
BEGIN
    SELECT * FROM Curso
END
GO

CREATE PROCEDURE SP_ActualizarCurso
    @Id_Curso INT,
    @Nombre_Curso VARCHAR(50),
    @Nivel VARCHAR(50),
    @Tanda VARCHAR(50),
    @Id_Maestro INT
AS
BEGIN
    UPDATE Curso
    SET Nombre_Curso = @Nombre_Curso,
        Nivel = @Nivel,
        Tanda = @Tanda,
        Id_Maestro = @Id_Maestro
    WHERE Id_Curso = @Id_Curso
END
GO

CREATE PROCEDURE SP_EliminarCurso
    @Id_Curso INT
AS
BEGIN
    DELETE FROM Curso
    WHERE Id_Curso = @Id_Curso
END
GO


/* =========================================================
   CRUD - ASIGNATURA
========================================================= */

CREATE PROCEDURE SP_InsertarAsignatura
    @Nombre_Asignatura VARCHAR(50)
AS
BEGIN
    INSERT INTO Asignatura(Nombre_Asignatura)
    VALUES(@Nombre_Asignatura)
END
GO

CREATE PROCEDURE SP_MostrarAsignatura
AS
BEGIN
    SELECT * FROM Asignatura
END
GO

CREATE PROCEDURE SP_ActualizarAsignatura
    @Id_Asignatura INT,
    @Nombre_Asignatura VARCHAR(50)
AS
BEGIN
    UPDATE Asignatura
    SET Nombre_Asignatura = @Nombre_Asignatura
    WHERE Id_Asignatura = @Id_Asignatura
END
GO

CREATE PROCEDURE SP_EliminarAsignatura
    @Id_Asignatura INT
AS
BEGIN
    DELETE FROM Asignatura
    WHERE Id_Asignatura = @Id_Asignatura
END
GO


/* =========================================================
   CRUD - MATRICULA
========================================================= */

CREATE PROCEDURE SP_InsertarMatricula
    @Fecha_Ingreso DATE,
    @Id_Estudiante INT,
    @Id_Curso INT
AS
BEGIN
    INSERT INTO Matricula
    VALUES(@Fecha_Ingreso,@Id_Estudiante,@Id_Curso)
END
GO

CREATE PROCEDURE SP_MostrarMatricula
AS
BEGIN
    SELECT * FROM Matricula
END
GO

CREATE PROCEDURE SP_ActualizarMatricula
    @Id_Matricula INT,
    @Fecha_Ingreso DATE,
    @Id_Estudiante INT,
    @Id_Curso INT
AS
BEGIN
    UPDATE Matricula
    SET Fecha_Ingreso = @Fecha_Ingreso,
        Id_Estudiante = @Id_Estudiante,
        Id_Curso = @Id_Curso
    WHERE Id_Matricula = @Id_Matricula
END
GO

CREATE PROCEDURE SP_EliminarMatricula
    @Id_Matricula INT
AS
BEGIN
    DELETE FROM Matricula
    WHERE Id_Matricula = @Id_Matricula
END
GO


/* =========================================================
   CRUD - HORARIO
========================================================= */

CREATE PROCEDURE SP_InsertarHorario
    @Aula VARCHAR(20),
    @Hora_Inicio TIME,
    @Hora_Fin TIME,
    @Dia VARCHAR(20),
    @Id_Asignatura INT,
    @Id_Curso INT
AS
BEGIN
    INSERT INTO Horario
    VALUES(@Aula,@Hora_Inicio,@Hora_Fin,@Dia,@Id_Asignatura,@Id_Curso)
END
GO

CREATE PROCEDURE SP_MostrarHorario
AS
BEGIN
    SELECT * FROM Horario
END
GO

CREATE PROCEDURE SP_ActualizarHorario
    @Id_Horario INT,
    @Aula VARCHAR(20),
    @Hora_Inicio TIME,
    @Hora_Fin TIME,
    @Dia VARCHAR(20),
    @Id_Asignatura INT,
    @Id_Curso INT
AS
BEGIN
    UPDATE Horario
    SET Aula = @Aula,
        Hora_Inicio = @Hora_Inicio,
        Hora_Fin = @Hora_Fin,
        Dia = @Dia,
        Id_Asignatura = @Id_Asignatura,
        Id_Curso = @Id_Curso
    WHERE Id_Horario = @Id_Horario
END
GO

CREATE PROCEDURE SP_EliminarHorario
    @Id_Horario INT
AS
BEGIN
    DELETE FROM Horario
    WHERE Id_Horario = @Id_Horario
END
GO


/* =========================================================
   CRUD - CALIFICACION
========================================================= */

CREATE PROCEDURE SP_InsertarCalificacion
    @P1 DECIMAL(5,2),
    @P2 DECIMAL(5,2),
    @P3 DECIMAL(5,2),
    @P4 DECIMAL(5,2),
    @Id_Asignatura INT,
    @Id_Maestro INT,
    @Id_Matricula INT
AS
BEGIN
    INSERT INTO Calificacion
    VALUES(@P1,@P2,@P3,@P4,@Id_Asignatura,@Id_Maestro,@Id_Matricula)
END
GO

CREATE PROCEDURE SP_MostrarCalificacion
AS
BEGIN
    SELECT * FROM Calificacion
END
GO

CREATE PROCEDURE SP_ActualizarCalificacion
    @Id_Calificacion INT,
    @P1 DECIMAL(5,2),
    @P2 DECIMAL(5,2),
    @P3 DECIMAL(5,2),
    @P4 DECIMAL(5,2),
    @Id_Asignatura INT,
    @Id_Maestro INT,
    @Id_Matricula INT
AS
BEGIN
    UPDATE Calificacion
    SET P1 = @P1,
        P2 = @P2,
        P3 = @P3,
        P4 = @P4,
        Id_Asignatura = @Id_Asignatura,
        Id_Maestro = @Id_Maestro,
        Id_Matricula = @Id_Matricula
    WHERE Id_Calificacion = @Id_Calificacion
END
GO

CREATE PROCEDURE SP_EliminarCalificacion
    @Id_Calificacion INT
AS
BEGIN
    DELETE FROM Calificacion
    WHERE Id_Calificacion = @Id_Calificacion
END
GO


/* =========================================================
   VISTAS
========================================================= */

CREATE VIEW Vista_Rol AS
SELECT * FROM Rol;
GO

CREATE VIEW Vista_Usuario AS
SELECT * FROM Usuario;
GO

CREATE VIEW Vista_Maestro AS
SELECT * FROM Maestro;
GO

CREATE VIEW Vista_Estudiante AS
SELECT * FROM Estudiante;
GO

CREATE VIEW Vista_Curso AS
SELECT * FROM Curso;
GO

CREATE VIEW Vista_Asignatura AS
SELECT * FROM Asignatura;
GO

CREATE VIEW Vista_Matricula AS
SELECT * FROM Matricula;
GO

CREATE VIEW Vista_Horario AS
SELECT * FROM Horario;
GO

CREATE VIEW Vista_Calificacion AS
SELECT * FROM Calificacion;
GO
