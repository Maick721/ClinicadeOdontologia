
package Servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    // Credenciales fijas
    private static final String USUARIO_CORRECTO = "lesly@gmail.com";
    private static final String PASSWORD_CORRECTO = "odontoloogia145";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validación básica de entrada
        if (username == null || password == null ||
                username.trim().isEmpty() || password.trim().isEmpty()) {
            mostrarError(request, response, "Por favor complete todos los campos");
            return;
        }

        // Validación de credenciales
        if (USUARIO_CORRECTO.equals(username) && PASSWORD_CORRECTO.equals(password)) {
            // Crear sesión
            HttpSession session = request.getSession(true);
            session.setAttribute("username", username);
            session.setMaxInactiveInterval(1800); // 30 minutos

            // Agregar cookie segura
            Cookie sessionCookie = new Cookie("JSESSIONID", session.getId());
            sessionCookie.setHttpOnly(true);
            sessionCookie.setSecure(true);
            response.addCookie(sessionCookie);

            response.sendRedirect("index.jsp");
        } else {
            mostrarError(request, response, "Usuario o contraseña incorrectos");
        }
    }

    private void mostrarError(HttpServletRequest request,
                              HttpServletResponse response,
                              String mensaje) throws ServletException, IOException {
        request.setAttribute("error", mensaje);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}