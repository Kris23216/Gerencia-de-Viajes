package org.consultas.viajes_itca.Servlet.Utils;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.consultas.viajes_itca.control.Control;
import org.consultas.viajes_itca.entity.Usuarios;

import java.io.IOException;

@WebServlet(name = "ModificarUser", urlPatterns = {"/Modificar-User"})
public class ActualizarUser extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        Control control = new Control();
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String preferencias = request.getParameter("preferencia");
        Usuarios user = control.getUsuario(id);

        if (nombre != null && !nombre.equals(user.getNombre())) {
            user.setNombre(nombre);
        }
        if (email != null && !email.equals(user.getEmail())) {
            user.setEmail(email);
        }
        if (password != null && !password.isEmpty()) {
            user.setPassword(password);
        }
        if (preferencias != null && !preferencias.equals(user.getPreferencias())) {
            user.setPreferencias(preferencias);
        }


        try {
            control.updateUsuario(user);
            response.sendRedirect("Pages/admin/gestionUsuario.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
