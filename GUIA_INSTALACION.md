# Guía de instalación y puesta en marcha

Pasos para dejar el sistema funcionando de punta a punta en tu PC con Windows.

## 1. Instalar SQL Server

1. Descargá **SQL Server Express** (gratis) desde la página de Microsoft e instalalo con la opción **Basic**.
2. Anotá el nombre de la instancia que te muestra al final. Lo más común es `SQLEXPRESS`.
3. Descargá e instalá **SQL Server Management Studio (SSMS)** para poder ver y administrar la base con interfaz gráfica.

> No uses MySQL Workbench: es para MySQL, no para SQL Server, y este proyecto está hecho para SQL Server.

## 2. Confirmar el nombre de tu instancia

1. Abrí SSMS.
2. En "Server name" probá con `.\SQLEXPRESS` (el punto significa "esta PC"). Si conecta, ese es tu servidor.
3. Si no conecta, probá `localhost\SQLEXPRESS` o el nombre de tu PC seguido de `\SQLEXPRESS`.

## 3. Configurar la cadena de conexión

Abrí `appsettings.json` y revisá la línea `DefaultConnection`. Ya quedó configurada así:

```
Server=.\SQLEXPRESS;Database=SistemaGestion;Trusted_Connection=True;TrustServerCertificate=True;
```

Si tu instancia tiene otro nombre (lo viste en el paso 2), cambiá la parte `.\SQLEXPRESS` por el nombre correcto. Por ejemplo `localhost\SQLEXPRESS`.

`Trusted_Connection=True` usa tu usuario de Windows, así que no hace falta usuario ni contraseña.

## 4. Crear la base de datos

Tenés **dos opciones equivalentes**, elegí una:

**Opción A — Con los scripts SQL (recomendada, y es entregable):**
1. En SSMS, abrí `sql/01_CrearBaseDeDatos.sql` y ejecutalo (F5). Crea la base y las tres tablas.
2. Abrí `sql/02_DatosDePrueba.sql` y ejecutalo. Carga usuarios, clientes y proveedores de prueba.

**Opción B — Con migraciones de Entity Framework:**
1. Abrí `WebApi.sln` con Visual Studio 2022 (abrí el `.sln`, no la carpeta).
2. En el menú: Herramientas → Administrador de paquetes NuGet → Consola.
3. Ejecutá: `Update-Database`. Esto crea la base y las tablas.
4. Si usás esta opción, cargá igual los datos de prueba con `sql/02_DatosDePrueba.sql`.

## 5. Correr la API

1. En Visual Studio, asegurate de que el perfil de ejecución sea **https** (arriba, al lado del botón Play).
2. Presioná Play. Se abre el navegador con Swagger en `https://localhost:7001/swagger`.
3. La API quedó fijada en el puerto **7001**, que es el mismo que usa el frontend.

## 6. Abrir la aplicación web

1. En la carpeta `frontend`, abrí `login.html` con la extensión **Live Server** de VS Code (clic derecho → Open with Live Server). Esto evita problemas de CORS y rutas.
2. Iniciá sesión con el usuario de prueba:
   - **Email:** `admin@sistema.com`
   - **Clave:** `admin123`
3. Navegá por Inicio, Usuarios, Clientes y Proveedores. Probá crear, editar y dar de baja en cada sección.

## 7. Lo único que queda por tu cuenta

- **Capturas de pantalla:** sacá capturas del sistema funcionando (login, inicio, cada listado y cada formulario) para adjuntar a la entrega.
- **Subir los cambios a GitHub** una vez que probaste que todo anda.

## Resumen de lo que se arregló en el código

- El puerto del frontend y de la API ahora coinciden (7001).
- `Proveedor` usa **CUIT** (antes decía CUIL, y por eso el CUIT no se guardaba).
- Se agregó el campo **DNI** al modelo `Cliente` (lo pedía la consigna y el frontend ya lo usaba).
- Los archivos HTML se renombraron a `usuarios.html`, `clientes.html`, `proveedores.html` para que la navegación del menú funcione.
- Se agregaron validaciones de email por JavaScript, control de campos obligatorios y mensajes de éxito al guardar/editar.
