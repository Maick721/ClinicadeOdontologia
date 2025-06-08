package Controlers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "AgendarController", urlPatterns = {"/citas/agendar"})
public class AgendarController extends HttpServlet {
    // HashMap para almacenar las citas (clave: UUID, valor: Map con datos de la cita)
    public static HashMap<String, Map<String, String>> citas = new HashMap<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> errores = new HashMap<>();
        Map<String, String> cita = new HashMap<>();

        String nombre = request.getParameter("nombre");
        String cedula = request.getParameter("cedula");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        String motivo = request.getParameter("motivo");

        cita.put("nombre", nombre != null ? nombre : "");
        cita.put("cedula", cedula != null ? cedula : "");
        cita.put("correo", correo != null ? correo : "");
        cita.put("telefono", telefono != null ? telefono : "");
        cita.put("fecha", fecha != null ? fecha : "");
        cita.put("hora", hora != null ? hora : "");
        cita.put("motivo", motivo != null ? motivo : "");

        // Validación campo a campo
        if (nombre == null || nombre.trim().isEmpty()) {
            errores.put("nombre", "Ingrese el nombre del paciente.");
        }
        if (cedula == null || !cedula.matches("\\d{1,10}")) {
            errores.put("cedula", "La cédula solo debe contener números (máx. 10 dígitos).");
        }
        if (correo == null || !correo.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$")) {
            errores.put("correo", "Ingrese un correo electrónico válido.");
        }
        if (telefono == null || !telefono.matches("\\d{10}")) {
            errores.put("telefono", "El número de teléfono debe contener exactamente 10 números.");
        }
        if (fecha == null || fecha.isEmpty()) {
            errores.put("fecha", "Seleccione una fecha.");
        }
        if (hora == null || hora.isEmpty()) {
            errores.put("hora", "Seleccione una hora.");
        }
        if (motivo == null || motivo.trim().isEmpty()) {
            errores.put("motivo", "Ingrese el motivo de la consulta.");
        }

        if (!errores.isEmpty()) {
            request.setAttribute("errores", errores);
            request.setAttribute("cita", cita);
            request.getRequestDispatcher("/WEB-INF/agendar-cita.jsp").forward(request, response);
            return;
        }

        // Si no hay errores, guardar la cita
        String id = UUID.randomUUID().toString();
        citas.put(id, cita);

        // Puedes guardar el id en la sesión si luego quieres mostrar la cita agendada
        request.getSession().setAttribute("citaAgendada", id);

        // Redirigir a index.jsp con mensaje de éxito
        response.sendRedirect(request.getContextPath() + "/index.jsp?exito=1");
    }
}