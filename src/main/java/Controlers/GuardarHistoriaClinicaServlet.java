package Controlers;

import Model.HistoriaClinica;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.Conexion;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/GuardarHistoriaClinicaServlet")
public class GuardarHistoriaClinicaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HistoriaClinica hc = new HistoriaClinica();
            hc.setNombre(request.getParameter("nombre"));
            hc.setFechaNacimiento(request.getParameter("fechaNacimiento"));
            hc.setDireccion(request.getParameter("direccion"));
            hc.setTelefono(request.getParameter("telefono"));
            hc.setCorreo(request.getParameter("correo"));
            hc.setMotivoConsulta(request.getParameter("motivoConsulta"));
            hc.setAntecedentes(request.getParameter("antecedentes"));
            hc.setTratamientosPrevios(request.getParameter("tratamientosPrevios"));
            hc.setExamenClinico(request.getParameter("examenClinico"));
            hc.setDiagnostico(request.getParameter("diagnostico"));
            hc.setPlanTratamiento(request.getParameter("planTratamiento"));

            Connection conn = Conexion.getConnection();
            HistoriaClinicaDAO dao = new HistoriaClinicaDAO(conn);
            dao.guardar(hc);
            conn.close();

            response.sendRedirect("historia_clinica_exito.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
