package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Aquí debes implementar la lógica de autenticación
        // y verificar si el usuario y contraseña son válidos
        boolean isValid = false /* Lógica de autenticación */;

        if (!isValid) {
            // Si las credenciales son inválidas, redirige de vuelta a login.jsp
            // con un mensaje de error
            request.setAttribute("error", "Credenciales inválidas");
            try {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);

            // Redirige al usuario a la página principal o de bienvenida
            response.sendRedirect("index.jsp");
        }
    }
}
