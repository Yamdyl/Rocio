-- Base de datos de prueba en MSSQL
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'sistema_ejemplo')
BEGIN
    CREATE DATABASE sistema_ejemplo;
END
GO

USE sistema_ejemplo;
GO

-- Tabla de Usuarios
CREATE TABLE usuarios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de Tareas
CREATE TABLE tareas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descripcion VARCHAR(MAX),
    completada BIT DEFAULT 0,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Datos de prueba
INSERT INTO usuarios (nombre, email) 
VALUES ('Rocío', 'rocio@email.com');

INSERT INTO tareas (titulo, descripcion, usuario_id) 
VALUES ('Crear archivo en GitHub', 'Subir la base de datos al repositorio', 1);