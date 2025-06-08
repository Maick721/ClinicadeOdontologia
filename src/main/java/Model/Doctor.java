package Model;

public class Doctor {
    private int id;
    private String nombre;
    private String especialidad;
    private String numeroColegiado;
    private String correo;
    private String telefono;

    public boolean crearHistoriaClinica(HistoriaClinica historia) {
        // Lógica para crear una historia clínica
        return true;
    }

    public boolean actualizarHistoriaClinica(int idHistoria, HistoriaClinica historia) {
        // Lógica para actualizar una historia clínica existente
        return true;
    }

    public HistoriaClinica consultarHistoriaClinica(int idPaciente) {
        // Lógica para consultar una historia clínica
        return null;
    }

    public boolean registrarDiagnostico(int idHistoria, String diagnostico) {
        // Lógica para registrar un diagnóstico
        return true;
    }

    public boolean registrarTratamiento(int idHistoria, String tratamiento) {
        // Lógica para registrar un tratamiento
        return true;
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

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public String getNumeroColegiado() {
        return numeroColegiado;
    }

    public void setNumeroColegiado(String numeroColegiado) {
        this.numeroColegiado = numeroColegiado;
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