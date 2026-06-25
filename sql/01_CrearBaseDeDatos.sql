
IF DB_ID('SistemaGestion') IS NOT NULL
BEGIN
    ALTER DATABASE SistemaGestion SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE SistemaGestion;
END
GO


CREATE DATABASE SistemaGestion;
GO

USE SistemaGestion;
GO

CREATE TABLE Usuarios (
    IdUsuario INT IDENTITY(1,1) NOT NULL,
    Email     NVARCHAR(150)     NOT NULL,
    Clave     NVARCHAR(100)     NOT NULL,
    Rol       NVARCHAR(50)      NOT NULL,
    Activo    BIT               NOT NULL DEFAULT 1,
    CONSTRAINT PK_Usuarios PRIMARY KEY (IdUsuario)
);
GO


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
