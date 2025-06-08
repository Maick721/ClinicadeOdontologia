package Model;

import java.time.LocalDate;
import java.util.List;
import java.util.ArrayList;

public class Secretaria {
    private int id;
    private String nombre;
    private String correo;
    private String telefono;

    public boolean agendarCita(Cita cita) {
        // Lógica para agendar una cita
        return true;
    }

    public boolean modificarCita(int idCita, Cita nuevaCita) {
        // Lógica para modificar una cita existente
        return true;
    }

    public boolean cancelarCita(int idCita) {
        // Lógica para cancelar una cita
        return true;
    }

    public List<Cita> consultarCitas(LocalDate fecha) {
        // Lógica para consultar citas por fecha
        return new ArrayList<>();
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}