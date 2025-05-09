<%@ page import="org.consultas.viajes_itca.entity.Usuarios" %>
<%@ page import="java.util.List" %><%--
    Document   : detalleUsuario
    Created on : 25 oct 2024, 22:20:19
    Author     : enocc
--%>


<%
    List<Usuarios> usuarios = (List<Usuarios>) session.getAttribute("usuarios");
    int id = Integer.parseInt(request.getParameter("userxd"));
    Usuarios usuario = null;
    for (Usuarios u : usuarios) {
        if (u.getUserId() == id) {
            usuario = u;
            break;
        }
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles del Usuario - Administrador</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

   <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="panelAdmin.jsp">Inicio</a></li>
                    <li class="nav-item"><a class="nav-link" href="gestionUsuario.jsp">Usuarios</a></li>
                    <li class="nav-item"><a class="nav-link" href="gestionDestinos.jsp">Destinos</a></li>
                    <li class="nav-item"><a class="nav-link active" href="analisisReportes.jsp">Análisis</a></li>
                    <li class="nav-item"><a class="nav-link btn btn-danger" href="../../Cerrar-Sesion">Cerrar</a></li>
                </ul>
            </div>
        </div>
    </nav>

<!-- Hero Section -->
<div class="bg-light text-center p-5">
    <h1>Detalles del Usuario</h1>
</div>

<!-- Detalles del Usuario -->
<div class="container my-5">
    <h2 class="mb-4">Información del Usuario</h2>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Nombre: <%=usuario.getNombre()%>
            </h5>
            <p class="card-text">Correo Electrónico: <%=usuario.getEmail()%>
            </p>
            <p class="card-text">Contraseña: <%=usuario.getPassword()%>
            </p>
            <p class="card-text">Preferencias de Viaje:
                <label class="badge bg-primary"><%=usuario.getPreferencias()%>
                </label>
            </p>
            <a href="gestionUsuario.jsp" class="btn btn-primary">Regresar a la Lista</a>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2024 Agencia de Viajes. Todos los derechos reservados.</p>
</footer>

</body>
</html>
