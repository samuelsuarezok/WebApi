/* =====================================================================
   Sistema de Gestion - Trabajo Integrador Programacion III
   Script 1: Creacion de la base de datos y las tablas
   Motor: SQL Server
   ---------------------------------------------------------------------
   Como ejecutarlo:
   1) Abrir SQL Server Management Studio (SSMS) o Azure Data Studio.
   2) Conectarse a tu instancia local (ej: NOMBRE\SQLEXPRESS).
   3) Abrir este archivo y ejecutar todo (F5).
   Este script se puede volver a correr: borra la base si ya existe.
   ===================================================================== */

-- Si la base ya existe, la elimina para crearla desde cero
IF DB_ID('SistemaGestion') IS NOT NULL
BEGIN
    ALTER DATABASE SistemaGestion SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE SistemaGestion;
END
GO

-- Crea la base de datos
CREATE DATABASE SistemaGestion;
GO

USE SistemaGestion;
GO

/* ---------------------------------------------------------------------
   Tabla: Usuarios
   Representa a las personas que pueden acceder al sistema (login).
   --------------------------------------------------------------------- */
CREATE TABLE Usuarios (
    IdUsuario INT IDENTITY(1,1) NOT NULL,
    Email     NVARCHAR(150)     NOT NULL,
    Clave     NVARCHAR(100)     NOT NULL,
    Rol       NVARCHAR(50)      NOT NULL,
    Activo    BIT               NOT NULL DEFAULT 1,
    CONSTRAINT PK_Usuarios PRIMARY KEY (IdUsuario)
);
GO

/* ---------------------------------------------------------------------
   Tabla: Clientes
   --------------------------------------------------------------------- */
CREATE TABLE Clientes (
    IdCliente INT IDENTITY(1,1) NOT NULL,
    Nombre    NVARCHAR(100)     NOT NULL,
    Apellido  NVARCHAR(100)     NOT NULL,
    DNI       NVARCHAR(20)      NOT NULL,
    Email     NVARCHAR(150)     NOT NULL,
    Telefono  NVARCHAR(50)      NOT NULL,
    Direccion NVARCHAR(150)     NOT NULL,
    Localidad NVARCHAR(100)     NOT NULL,
    Provincia NVARCHAR(100)     NOT NULL,
    FechaAlta DATETIME2         NOT NULL DEFAULT GETDATE(),
    Activo    BIT               NOT NULL DEFAULT 1,
    CONSTRAINT PK_Clientes PRIMARY KEY (IdCliente)
);
GO

/* ---------------------------------------------------------------------
   Tabla: Proveedores
   --------------------------------------------------------------------- */
CREATE TABLE Proveedores (
    IdProveedor INT IDENTITY(1,1) NOT NULL,
    RazonSocial NVARCHAR(150)     NOT NULL,
    CUIT        NVARCHAR(20)      NOT NULL,
    Email       NVARCHAR(150)     NOT NULL,
    Telefono    NVARCHAR(50)      NOT NULL,
    Direccion   NVARCHAR(150)     NOT NULL,
    Localidad   NVARCHAR(100)     NOT NULL,
    Provincia   NVARCHAR(100)     NOT NULL,
    Rubro       NVARCHAR(100)     NOT NULL,
    FechaAlta   DATETIME2         NOT NULL DEFAULT GETDATE(),
    Activo      BIT               NOT NULL DEFAULT 1,
    CONSTRAINT PK_Proveedores PRIMARY KEY (IdProveedor)
);
GO

PRINT 'Base de datos SistemaGestion y tablas creadas correctamente.';
GO
