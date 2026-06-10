function cargarSidebar(paginaActiva) {
    const sidebar = `
        <div class="sidebar">
            <div class="sidebar-logo">Sistema de Gestión</div>
            <nav>
                <a href="index.html" class="${paginaActiva === 'inicio' ? 'activo' : ''}">
                    🏠 Inicio
                </a>
                <a href="usuarios.html" class="${paginaActiva === 'usuarios' ? 'activo' : ''}">
                    👤 Usuarios
                </a>
                <a href="clientes.html" class="${paginaActiva === 'clientes' ? 'activo' : ''}">
                    🧑‍💼 Clientes
                </a>
                <a href="proveedores.html" class="${paginaActiva === 'proveedores' ? 'activo' : ''}">
                    🏢 Proveedores
                </a>
            </nav>
            <a href="#" class="cerrar-sesion" onclick="cerrarSesion()">
                ➡️ Cerrar sesión
            </a>
        </div>
    `;
    document.getElementById("sidebar-container").innerHTML = sidebar;
}

function cerrarSesion() {
    localStorage.removeItem("usuario");
    window.location.href = "login.html";
}