package Controlers;

import Model.HistoriaClinica;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class HistoriaClinicaDAO {
    private Connection conn;

    public HistoriaClinicaDAO(Connection conn) {
        this.conn = conn;
    }

    public void guardar(HistoriaClinica hc) throws Exception {
        String sql = "INSERT INTO historia_clinica(nombre, fechaNacimiento, direccion, telefono, correo, motivoConsulta, antecedentes, tratamientosPrevios, examenClinico, diagnostico, planTratamiento) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, hc.getNombre());
        stmt.setString(2, hc.getFechaNacimiento());
        stmt.setString(3, hc.getDireccion());
        stmt.setString(4, hc.getTelefono());
        stmt.setString(5, hc.getCorreo());
        stmt.setString(6, hc.getMotivoConsulta());
        stmt.setString(7, hc.getAntecedentes());
        stmt.setString(8, hc.getTratamientosPrevios());
        stmt.setString(9, hc.getExamenClinico());
        stmt.setString(10, hc.getDiagnostico());
        stmt.setString(11, hc.getPlanTratamiento());
        stmt.executeUpdate();
        stmt.close();
    }
}
