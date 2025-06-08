package Servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import Model.Paciente;

@WebServlet("/PacienteServlet")
public class PacienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirigir al formulario
        RequestDispatcher dispatcher = request.getRequestDispatcher("historia_clinica.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            // Crear nuevo paciente
            Paciente paciente = new Paciente();

            // Datos básicos
            paciente.setNombre(request.getParameter("nombre"));
            paciente.setSexo(request.getParameter("sexo"));
            paciente.setFechaNacimiento(request.getParameter("fechaNacimiento"));
            paciente.setTelefono(request.getParameter("telefono"));
            paciente.setEmail(request.getParameter("email"));

            // Datos numéricos - con manejo de posibles valores vacíos
            try {
                paciente.setEstatura(Double.parseDouble(request.getParameter("estatura")));
                paciente.setPeso(Double.parseDouble(request.getParameter("peso")));
                paciente.setTemperatura(Double.parseDouble(request.getParameter("temperatura")));
                paciente.setFrecuenciaRespiratoria(Double.parseDouble(request.getParameter("frecuenciaRespiratoria")));
                paciente.setPresionSistolica(Double.parseDouble(request.getParameter("presionSistolica")));
            } catch (NumberFormatException e) {
                // Manejar campos numéricos vacíos o inválidos
            }

            // Antecedentes y otros datos
            paciente.setVacunacion(request.getParameter("vacunacion"));
            paciente.setAlergias(request.getParameter("alergias"));
            paciente.setAntecedentesPatologicos(request.getParameter("antecedentesPatologicos"));
            paciente.setAntecedentesNoPatologicos(request.getParameter("antecedentesNoPatologicos"));
            paciente.setAntecedentesPsiquiatricos(request.getParameter("antecedentesPsiquiatricos"));

            // Aquí podrías agregar la lógica para guardar en base de datos

            // Enviar el paciente a la vista
            request.setAttribute("paciente", paciente);
            request.setAttribute("mensaje", "Historia clínica guardada exitosamente");
            RequestDispatcher dispatcher = request.getRequestDispatcher("vista_paciente.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error al procesar la historia clínica: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("historia_clinica.jsp");
            dispatcher.forward(request, response);
        }
    }
}