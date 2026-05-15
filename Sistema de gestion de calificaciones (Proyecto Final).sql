

IF DB_ID('Sistema_Gestion_Calificaciones') IS NOT NULL
BEGIN
    DROP DATABASE Sistema_Gestion_Calificaciones;
END
GO

CREATE DATABASE Sistema_Gestion_Calificaciones;
GO

USE Sistema_Gestion_Calificaciones;
GO

/*=========================================================
1. TABLA ROL
=========================================================*/
CREATE TABLE Rol(
    Id_Rol INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Rol VARCHAR(50) NOT NULL UNIQUE
);
GO

/*=========================================================
2. TABLA USUARIO
=========================================================*/
CREATE TABLE Usuario(
    Id_Usuario INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Usuario VARCHAR(50) NOT NULL UNIQUE,
    Contrasena VARCHAR(100) NOT NULL,
    Id_Rol INT NOT NULL,

    CONSTRAINT FK_Usuario_Rol
    FOREIGN KEY (Id_Rol) REFERENCES Rol(Id_Rol)
);
GO

/*=========================================================
3. TABLA MAESTRO
=========================================================*/
CREATE TABLE Maestro(
    Id_Maestro INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20),
    Correo VARCHAR(100),
    Id_Usuario INT NOT NULL UNIQUE,

    CONSTRAINT FK_Maestro_Usuario
    FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
);
GO

/*=========================================================
4. TABLA ESTUDIANTE
=========================================================*/
CREATE TABLE Estudiante(
    Id_Estudiante INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Direccion VARCHAR(150),
    Genero VARCHAR(15) NOT NULL,
    Fecha_Nacimiento DATE NOT NULL,
    Nombre_Padres VARCHAR(100),
    Telefono_Padre VARCHAR(20),

    CONSTRAINT CK_Estudiante_Genero
    CHECK (Genero IN ('Masculino','Femenino'))
);
GO

/*=========================================================
5. TABLA PERIODO ESCOLAR
=========================================================*/
CREATE TABLE Periodo_Escolar(
    Id_Periodo INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Periodo VARCHAR(50) NOT NULL,
    Fecha_Inicio DATE NOT NULL,
    Fecha_Fin DATE NOT NULL
);
GO

/*=========================================================
6. TABLA ASIGNATURA
=========================================================*/
CREATE TABLE Asignatura(
    Id_Asignatura INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Asignatura VARCHAR(50) NOT NULL UNIQUE
);
GO

/*=========================================================
7. TABLA CURSO
=========================================================*/
CREATE TABLE Curso(
    Id_Curso INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Curso VARCHAR(50) NOT NULL,
    Nivel VARCHAR(50) NOT NULL,
    Tanda VARCHAR(30) NOT NULL,
    Seccion VARCHAR(10),
    Id_Maestro INT NOT NULL,
    Id_Periodo INT NOT NULL,

    CONSTRAINT FK_Curso_Maestro
    FOREIGN KEY (Id_Maestro) REFERENCES Maestro(Id_Maestro),

    CONSTRAINT FK_Curso_Periodo
    FOREIGN KEY (Id_Periodo) REFERENCES Periodo_Escolar(Id_Periodo)
);
GO

/*=========================================================
8. TABLA MATRICULA
=========================================================*/
CREATE TABLE Matricula(
    Id_Matricula INT PRIMARY KEY IDENTITY(1,1),
    Fecha_Ingreso DATE NOT NULL DEFAULT GETDATE(),
    Estado VARCHAR(20) NOT NULL DEFAULT 'Activa',
    Id_Estudiante INT NOT NULL,
    Id_Curso INT NOT NULL,

    CONSTRAINT FK_Matricula_Estudiante
    FOREIGN KEY (Id_Estudiante) REFERENCES Estudiante(Id_Estudiante),

    CONSTRAINT FK_Matricula_Curso
    FOREIGN KEY (Id_Curso) REFERENCES Curso(Id_Curso),

    CONSTRAINT UQ_Matricula UNIQUE(Id_Estudiante, Id_Curso)
);
GO

/*=========================================================
9. TABLA HORARIO
=========================================================*/
CREATE TABLE Horario(
    Id_Horario INT PRIMARY KEY IDENTITY(1,1),
    Aula VARCHAR(20) NOT NULL,
    Hora_Inicio TIME NOT NULL,
    Hora_Fin TIME NOT NULL,
    Dia VARCHAR(15) NOT NULL,
    Id_Asignatura INT NOT NULL,
    Id_Curso INT NOT NULL,

    CONSTRAINT FK_Horario_Asignatura
    FOREIGN KEY (Id_Asignatura) REFERENCES Asignatura(Id_Asignatura),

    CONSTRAINT FK_Horario_Curso
    FOREIGN KEY (Id_Curso) REFERENCES Curso(Id_Curso),

    CONSTRAINT CK_Horario_Dia
    CHECK (Dia IN ('Lunes','Martes','Miercoles','Jueves','Viernes'))
);
GO

/*=========================================================
10. TABLA CALIFICACION
=========================================================*/
CREATE TABLE Calificacion(
    Id_Calificacion INT PRIMARY KEY IDENTITY(1,1),

    P1 DECIMAL(5,2) NOT NULL DEFAULT 0,
    P2 DECIMAL(5,2) NOT NULL DEFAULT 0,
    P3 DECIMAL(5,2) NOT NULL DEFAULT 0,
    P4 DECIMAL(5,2) NOT NULL DEFAULT 0,

    Promedio AS ((P1 + P2 + P3 + P4)/4),

    Id_Asignatura INT NOT NULL,
    Id_Maestro INT NOT NULL,
    Id_Matricula INT NOT NULL,

    CONSTRAINT FK_Calificacion_Asignatura
    FOREIGN KEY (Id_Asignatura) REFERENCES Asignatura(Id_Asignatura),

    CONSTRAINT FK_Calificacion_Maestro
    FOREIGN KEY (Id_Maestro) REFERENCES Maestro(Id_Maestro),

    CONSTRAINT FK_Calificacion_Matricula
    FOREIGN KEY (Id_Matricula) REFERENCES Matricula(Id_Matricula),

    CONSTRAINT CK_Nota1 CHECK (P1 BETWEEN 0 AND 100),
    CONSTRAINT CK_Nota2 CHECK (P2 BETWEEN 0 AND 100),
    CONSTRAINT CK_Nota3 CHECK (P3 BETWEEN 0 AND 100),
    CONSTRAINT CK_Nota4 CHECK (P4 BETWEEN 0 AND 100)
);
GO

/*=========================================================
11. TABLA ASISTENCIA
=========================================================*/
CREATE TABLE Asistencia(
    Id_Asistencia INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATE NOT NULL DEFAULT GETDATE(),
    Estado VARCHAR(15) NOT NULL,
    Observacion VARCHAR(150),
    Id_Matricula INT NOT NULL,

    CONSTRAINT FK_Asistencia_Matricula
    FOREIGN KEY (Id_Matricula) REFERENCES Matricula(Id_Matricula),

    CONSTRAINT CK_Asistencia_Estado
    CHECK (Estado IN ('Presente','Ausente','Tarde'))
);
GO

/*=========================================================
12. TABLA PAGO
=========================================================*/
CREATE TABLE Pago(
    Id_Pago INT PRIMARY KEY IDENTITY(1,1),
    Fecha_Pago DATE NOT NULL DEFAULT GETDATE(),
    Concepto VARCHAR(100) NOT NULL,
    Monto DECIMAL(10,2) NOT NULL,
    Estado VARCHAR(20) NOT NULL DEFAULT 'Pagado',
    Id_Estudiante INT NOT NULL,

    CONSTRAINT FK_Pago_Estudiante
    FOREIGN KEY (Id_Estudiante) REFERENCES Estudiante(Id_Estudiante)
);
GO

/*=========================================================
INSERTS INICIALES
=========================================================*/

INSERT INTO Rol (Nombre_Rol)
VALUES
('Administrador'),
('Maestro'),
('Secretaria');
GO

INSERT INTO Usuario (Nombre_Usuario,Contrasena,Id_Rol)
VALUES
('admin','1234',1),
('juanp','1234',2),
('maria','1234',2),
('secretaria','1234',3);
GO

INSERT INTO Maestro (Nombre,Apellido,Telefono,Correo,Id_Usuario)
VALUES
('Juan','Perez','8091111111','juan@gmail.com',2),
('Maria','Lopez','8092222222','maria@gmail.com',3);
GO

INSERT INTO Periodo_Escolar (Nombre_Periodo,Fecha_Inicio,Fecha_Fin)
VALUES
('2026-2027','2026-08-15','2027-06-30');
GO

INSERT INTO Estudiante
(Nombre,Apellido,Direccion,Genero,Fecha_Nacimiento,Nombre_Padres,Telefono_Padre)
VALUES
('Carlos','Ramirez','Los Mina','Masculino','2010-05-10','Pedro Ramirez','8095551111'),
('Ana','Gomez','Villa Mella','Femenino','2011-08-15','Luisa Gomez','8095552222'),
('Luis','Martinez','San Isidro','Masculino','2010-09-20','Jose Martinez','8095553333');
GO

INSERT INTO Asignatura (Nombre_Asignatura)
VALUES
('Matematica'),
('Lengua Española'),
('Ciencias Sociales'),
('Naturales'),
('Ingles');
GO

INSERT INTO Curso
(Nombre_Curso,Nivel,Tanda,Seccion,Id_Maestro,Id_Periodo)
VALUES
('6to','Primaria','Matutina','A',1,1),
('6to','Primaria','Vespertina','B',2,1);
GO

INSERT INTO Matricula
(Id_Estudiante,Id_Curso)
VALUES
(1,1),
(2,1),
(3,2);
GO

INSERT INTO Horario
(Aula,Hora_Inicio,Hora_Fin,Dia,Id_Asignatura,Id_Curso)
VALUES
('A1','08:00','09:00','Lunes',1,1),
('A1','09:00','10:00','Martes',2,1),
('B1','01:00','02:00','Lunes',1,2);
GO

INSERT INTO Calificacion
(P1,P2,P3,P4,Id_Asignatura,Id_Maestro,Id_Matricula)
VALUES
(90,85,88,92,1,1,1),
(80,78,82,84,1,1,2),
(95,96,94,93,1,2,3);
GO

INSERT INTO Asistencia
(Estado,Observacion,Id_Matricula)
VALUES
('Presente','Sin novedad',1),
('Ausente','Excusa medica',2),
('Tarde','Llego tarde',3);
GO

INSERT INTO Pago
(Concepto,Monto,Estado,Id_Estudiante)
VALUES
('Inscripcion',2500,'Pagado',1),
('Mensualidad Septiembre',3000,'Pagado',2),
('Mensualidad Septiembre',3000,'Pendiente',3);
GO



/*=========================================================
1. ESTUDIANTE
=========================================================*/

-- CREATE
CREATE PROC SP_InsertarEstudiante
(
    @Nombre VARCHAR(50),
    @Apellido VARCHAR(50),
    @Direccion VARCHAR(150),
    @Genero VARCHAR(15),
    @Fecha_Nacimiento DATE,
    @Nombre_Padres VARCHAR(100),
    @Telefono_Padre VARCHAR(20)
)
AS
BEGIN
    INSERT INTO Estudiante
    (Nombre,Apellido,Direccion,Genero,Fecha_Nacimiento,Nombre_Padres,Telefono_Padre)
    VALUES
    (@Nombre,@Apellido,@Direccion,@Genero,@Fecha_Nacimiento,@Nombre_Padres,@Telefono_Padre)
END
GO

-- READ
CREATE PROC SP_MostrarEstudiantes
AS
BEGIN
    SELECT * FROM Estudiante
END
GO

-- UPDATE
CREATE PROC SP_ActualizarEstudiante
(
    @Id INT,
    @Direccion VARCHAR(150)
)
AS
BEGIN
    UPDATE Estudiante
    SET Direccion=@Direccion
    WHERE Id_Estudiante=@Id
END
GO

-- DELETE
CREATE PROC SP_EliminarEstudiante
(
    @Id INT
)
AS
BEGIN
    DELETE FROM Estudiante
    WHERE Id_Estudiante=@Id
END
GO


/*=========================================================
2. MAESTRO
=========================================================*/

CREATE PROC SP_InsertarMaestro
(
    @Nombre VARCHAR(50),
    @Apellido VARCHAR(50),
    @Telefono VARCHAR(20),
    @Correo VARCHAR(100),
    @Id_Usuario INT
)
AS
BEGIN
    INSERT INTO Maestro
    (Nombre,Apellido,Telefono,Correo,Id_Usuario)
    VALUES
    (@Nombre,@Apellido,@Telefono,@Correo,@Id_Usuario)
END
GO

CREATE PROC SP_MostrarMaestros
AS
BEGIN
    SELECT * FROM Maestro
END
GO

CREATE PROC SP_ActualizarMaestro
(
    @Id INT,
    @Telefono VARCHAR(20)
)
AS
BEGIN
    UPDATE Maestro
    SET Telefono=@Telefono
    WHERE Id_Maestro=@Id
END
GO

CREATE PROC SP_EliminarMaestro
(
    @Id INT
)
AS
BEGIN
    DELETE FROM Maestro
    WHERE Id_Maestro=@Id
END
GO


/*=========================================================
3. CURSO
=========================================================*/

CREATE PROC SP_InsertarCurso
(
    @Nombre_Curso VARCHAR(50),
    @Nivel VARCHAR(50),
    @Tanda VARCHAR(30),
    @Seccion VARCHAR(10),
    @Id_Maestro INT,
    @Id_Periodo INT
)
AS
BEGIN
    INSERT INTO Curso
    (Nombre_Curso,Nivel,Tanda,Seccion,Id_Maestro,Id_Periodo)
    VALUES
    (@Nombre_Curso,@Nivel,@Tanda,@Seccion,@Id_Maestro,@Id_Periodo)
END
GO

CREATE PROC SP_MostrarCursos
AS
BEGIN
    SELECT * FROM Curso
END
GO

CREATE PROC SP_ActualizarCurso
(
    @Id INT,
    @Tanda VARCHAR(30)
)
AS
BEGIN
    UPDATE Curso
    SET Tanda=@Tanda
    WHERE Id_Curso=@Id
END
GO

CREATE PROC SP_EliminarCurso
(
    @Id INT
)
AS
BEGIN
    DELETE FROM Curso
    WHERE Id_Curso=@Id
END
GO


/*=========================================================
4. MATRICULA
=========================================================*/

CREATE PROC SP_InsertarMatricula
(
    @Id_Estudiante INT,
    @Id_Curso INT
)
AS
BEGIN
    INSERT INTO Matricula
    (Fecha_Ingreso,Estado,Id_Estudiante,Id_Curso)
    VALUES
    (GETDATE(),'Activa',@Id_Estudiante,@Id_Curso)
END
GO

CREATE PROC SP_MostrarMatriculas
AS
BEGIN
    SELECT
    M.Id_Matricula,
    E.Nombre + ' ' + E.Apellido AS Estudiante,
    C.Nombre_Curso + ' ' + C.Seccion AS Curso,
    M.Fecha_Ingreso,
    M.Estado
    FROM Matricula M
    INNER JOIN Estudiante E ON M.Id_Estudiante=E.Id_Estudiante
    INNER JOIN Curso C ON M.Id_Curso=C.Id_Curso
END
GO

CREATE PROC SP_ActualizarMatricula
(
    @Id INT,
    @Estado VARCHAR(20)
)
AS
BEGIN
    UPDATE Matricula
    SET Estado=@Estado
    WHERE Id_Matricula=@Id
END
GO

CREATE PROC SP_EliminarMatricula
(
    @Id INT
)
AS
BEGIN
    DELETE FROM Matricula
    WHERE Id_Matricula=@Id
END
GO


/*=========================================================
5. CALIFICACION
=========================================================*/

CREATE PROC SP_InsertarCalificacion
(
    @P1 DECIMAL(5,2),
    @P2 DECIMAL(5,2),
    @P3 DECIMAL(5,2),
    @P4 DECIMAL(5,2),
    @Id_Asignatura INT,
    @Id_Maestro INT,
    @Id_Matricula INT
)
AS
BEGIN
    INSERT INTO Calificacion
    (P1,P2,P3,P4,Id_Asignatura,Id_Maestro,Id_Matricula)
    VALUES
    (@P1,@P2,@P3,@P4,@Id_Asignatura,@Id_Maestro,@Id_Matricula)
END
GO

CREATE PROC SP_MostrarCalificaciones
AS
BEGIN
    SELECT
    E.Nombre + ' ' + E.Apellido AS Estudiante,
    A.Nombre_Asignatura,
    C.P1,C.P2,C.P3,C.P4,
    C.Promedio
    FROM Calificacion C
    INNER JOIN Matricula M ON C.Id_Matricula=M.Id_Matricula
    INNER JOIN Estudiante E ON M.Id_Estudiante=E.Id_Estudiante
    INNER JOIN Asignatura A ON C.Id_Asignatura=A.Id_Asignatura
END
GO

CREATE PROC SP_ActualizarCalificacion
(
    @Id INT,
    @P1 DECIMAL(5,2)
)
AS
BEGIN
    UPDATE Calificacion
    SET P1=@P1
    WHERE Id_Calificacion=@Id
END
GO

CREATE PROC SP_EliminarCalificacion
(
    @Id INT
)
AS
BEGIN
    DELETE FROM Calificacion
    WHERE Id_Calificacion=@Id
END
GO


/*=========================================================
6. PAGO
=========================================================*/

CREATE PROC SP_InsertarPago
(
    @Concepto VARCHAR(100),
    @Monto DECIMAL(10,2),
    @Estado VARCHAR(20),
    @Id_Estudiante INT
)
AS
BEGIN
    INSERT INTO Pago
    (Fecha_Pago,Concepto,Monto,Estado,Id_Estudiante)
    VALUES
    (GETDATE(),@Concepto,@Monto,@Estado,@Id_Estudiante)
END
GO

CREATE PROC SP_MostrarPagos
AS
BEGIN
    SELECT
    P.Id_Pago,
    E.Nombre + ' ' + E.Apellido AS Estudiante,
    P.Concepto,
    P.Monto,
    P.Estado
    FROM Pago P
    INNER JOIN Estudiante E ON P.Id_Estudiante=E.Id_Estudiante
END
GO

CREATE PROC SP_ActualizarPago
(
    @Id INT,
    @Estado VARCHAR(20)
)
AS
BEGIN
    UPDATE Pago
    SET Estado=@Estado
    WHERE Id_Pago=@Id
END
GO

CREATE PROC SP_EliminarPago
(
    @Id INT
)
AS
BEGIN
    DELETE FROM Pago
    WHERE Id_Pago=@Id
END
GO


/*=========================================================
EJEMPLOS DE USO
=========================================================*/

-- INSERTAR ESTUDIANTE
EXEC SP_InsertarEstudiante
'Luis',
'Diaz',
'Los Alcarrizos',
'Masculino',
'2011-05-10',
'Pedro Diaz',
'8099990000'

-- MOSTRAR ESTUDIANTES
EXEC SP_MostrarEstudiantes

-- ACTUALIZAR ESTUDIANTE
EXEC SP_ActualizarEstudiante 1,'Villa Mella'

-- ELIMINAR ESTUDIANTE
EXEC SP_EliminarEstudiante 4

-- VER CALIFICACIONES
EXEC SP_MostrarCalificaciones
GO