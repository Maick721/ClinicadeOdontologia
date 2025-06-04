package Servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;


public class LoginServlet extends HttpServlet {

    // Usuario y contraseña definidos manualmente
    private final String USERNAME = "admin";
    private final String PASSWORD = "123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validación simple
        boolean isValid = username.equals(USERNAME) && password.equals(PASSWORD);

        if (!isValid) {
            request.setAttribute("error", "Usuario o contraseña incorrectos");
            try {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("index.jsp");
        }
    }
}
