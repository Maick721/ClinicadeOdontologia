
package Servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import Model.Paciente;

@WebServlet("/historia_clinica")
public class HistoriaClinicaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

            // Datos numéricos
            String estaturaStr = request.getParameter("estatura");
            String pesoStr = request.getParameter("peso");
            String temperaturaStr = request.getParameter("temperatura");
            String frecuenciaRespiratoriaStr = request.getParameter("frecuenciaRespiratoria");
            String presionSistolicaStr = request.getParameter("presionSistolica");

            if (estaturaStr != null && !estaturaStr.isEmpty()) {
                paciente.setEstatura(Double.parseDouble(estaturaStr));
            }
            if (pesoStr != null && !pesoStr.isEmpty()) {
                paciente.setPeso(Double.parseDouble(pesoStr));
            }
            if (temperaturaStr != null && !temperaturaStr.isEmpty()) {
                paciente.setTemperatura(Double.parseDouble(temperaturaStr));
            }
            if (frecuenciaRespiratoriaStr != null && !frecuenciaRespiratoriaStr.isEmpty()) {
                paciente.setFrecuenciaRespiratoria(Double.parseDouble(frecuenciaRespiratoriaStr));
            }
            if (presionSistolicaStr != null && !presionSistolicaStr.isEmpty()) {
                paciente.setPresionSistolica(Double.parseDouble(presionSistolicaStr));
            }

            // Antecedentes y otros datos
            paciente.setVacunacion(request.getParameter("vacunacion"));
            paciente.setAlergias(request.getParameter("alergias"));
            paciente.setAntecedentesPatologicos(request.getParameter("antecedentesPatologicos"));
            paciente.setAntecedentesNoPatologicos(request.getParameter("antecedentesNoPatologicos"));
            paciente.setAntecedentesPsiquiatricos(request.getParameter("antecedentesPsiquiatricos"));

            // Aquí podrías agregar la lógica para guardar en base de datos

            // Enviar el paciente a la vista de confirmación
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