/* =====================================================================
   Sistema de Gestion - Trabajo Integrador Programacion III
   Script 2: Carga de datos de prueba
   ---------------------------------------------------------------------
   Ejecutar DESPUES del script 01_CrearBaseDeDatos.sql.
   Carga usuarios, clientes y proveedores de ejemplo.

   Usuario para iniciar sesion en el sistema:
       Email: admin@sistema.com
       Clave: admin123
   ===================================================================== */

USE SistemaGestion;
GO

-- ------------------------- Usuarios -------------------------
INSERT INTO Usuarios (Email, Clave, Rol, Activo) VALUES
('admin@sistema.com',   'admin123', 'Administrador', 1),
('ventas@sistema.com',  'ventas123', 'Ventas',       1),
('soporte@sistema.com', 'soporte123', 'Soporte',     1),
('viejo@sistema.com',   'viejo123', 'Usuario',       0);   -- inactivo (baja logica)
GO

-- ------------------------- Clientes -------------------------
INSERT INTO Clientes (Nombre, Apellido, DNI, Email, Telefono, Direccion, Localidad, Provincia, FechaAlta, Activo) VALUES
('Juan',     'Perez',     '30111222', 'juan.perez@mail.com',    '11-4567-8900', 'Av. Siempre Viva 123', 'La Plata',   'Buenos Aires', GETDATE(), 1),
('Maria',    'Gomez',     '28999888', 'maria.gomez@mail.com',   '11-4111-2222', 'Calle 7 N 456',        'Rosario',    'Santa Fe',     GETDATE(), 1),
('Carlos',   'Rodriguez', '33444555', 'carlos.rodri@mail.com',  '351-555-6666', 'Bv. San Juan 789',     'Cordoba',    'Cordoba',      GETDATE(), 1),
('Lucia',    'Fernandez', '35666777', 'lucia.fer@mail.com',     '261-777-8888', 'San Martin 1010',      'Mendoza',    'Mendoza',      GETDATE(), 0);
GO

-- ------------------------- Proveedores -------------------------
INSERT INTO Proveedores (RazonSocial, CUIT, Email, Telefono, Direccion, Localidad, Provincia, Rubro, FechaAlta, Activo) VALUES
('Distribuidora del Sur SA', '30-12345678-9', 'ventas@delsur.com',     '11-5000-1000', 'Ruta 2 Km 50',     'La Plata',  'Buenos Aires', 'Alimentos',    GETDATE(), 1),
('Insumos Tecnologicos SRL', '30-87654321-0', 'info@insumostec.com',   '11-5000-2000', 'Av. Tecno 200',    'CABA',      'Buenos Aires', 'Informatica',  GETDATE(), 1),
('Ferreteria Central SA',    '33-55667788-9', 'compras@fcentral.com',  '341-600-3000', 'Pellegrini 1500',  'Rosario',   'Santa Fe',     'Ferreteria',   GETDATE(), 1),
('Papelera Norte SRL',       '30-44556677-8', 'contacto@papnorte.com', '387-700-4000', 'Belgrano 850',     'Salta',     'Salta',        'Papeleria',    GETDATE(), 0);
GO

PRINT 'Datos de prueba cargados correctamente.';
GO

-- Verificacion rapida
SELECT 'Usuarios'    AS Tabla, COUNT(*) AS Total FROM Usuarios
UNION ALL SELECT 'Clientes',    COUNT(*) FROM Clientes
UNION ALL SELECT 'Proveedores', COUNT(*) FROM Proveedores;
GO
