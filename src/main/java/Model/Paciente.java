package Model;

public class Paciente {
    private String nombre;
    private String sexo;
    private String fechaNacimiento;
    private String direccion;             // Agregado
    private String telefono;
    private String email;                 // Cambié nombre a email para mantener consistencia
    private double estatura;
    private double peso;
    private double temperatura;
    private double frecuenciaRespiratoria;
    private double presionSistolica;
    private String vacunacion;
    private String alergias;
    private String antecedentesPatologicos;
    private String antecedentesNoPatologicos;
    private String antecedentesPsiquiatricos;

    // Campos para historia clínica
    private String motivoConsulta;
    private String antecedentes;
    private String tratamientosPrevios;
    private String examenClinico;
    private String diagnostico;
    private String planTratamiento;

    // Constructor vacío
    public Paciente() {
    }

    // Getters y Setters

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSexo() {
        return sexo;
    }
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }
    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getDireccion() {
        return direccion;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return email;
    }
    public void setCorreo(String correo) {
        this.email = correo;
    }

    public double getEstatura() {
        return estatura;
    }
    public void setEstatura(double estatura) {
        this.estatura = estatura;
    }

    public double getPeso() {
        return peso;
    }
    public void setPeso(double peso) {
        this.peso = peso;
    }

    public double getTemperatura() {
        return temperatura;
    }
    public void setTemperatura(double temperatura) {
        this.temperatura = temperatura;
    }

    public double getFrecuenciaRespiratoria() {
        return frecuenciaRespiratoria;
    }
    public void setFrecuenciaRespiratoria(double frecuenciaRespiratoria) {
        this.frecuenciaRespiratoria = frecuenciaRespiratoria;
    }

    public double getPresionSistolica() {
        return presionSistolica;
    }
    public void setPresionSistolica(double presionSistolica) {
        this.presionSistolica = presionSistolica;
    }

    public String getVacunacion() {
        return vacunacion;
    }
    public void setVacunacion(String vacunacion) {
        this.vacunacion = vacunacion;
    }

    public String getAlergias() {
        return alergias;
    }
    public void setAlergias(String alergias) {
        this.alergias = alergias;
    }

    public String getAntecedentesPatologicos() {
        return antecedentesPatologicos;
    }
    public void setAntecedentesPatologicos(String antecedentesPatologicos) {
        this.antecedentesPatologicos = antecedentesPatologicos;
    }

    public String getAntecedentesNoPatologicos() {
        return antecedentesNoPatologicos;
    }
    public void setAntecedentesNoPatologicos(String antecedentesNoPatologicos) {
        this.antecedentesNoPatologicos = antecedentesNoPatologicos;
    }

    public String getAntecedentesPsiquiatricos() {
        return antecedentesPsiquiatricos;
    }
    public void setAntecedentesPsiquiatricos(String antecedentesPsiquiatricos) {
        this.antecedentesPsiquiatricos = antecedentesPsiquiatricos;
    }

    // Getters y setters para historia clínica

    public String getMotivoConsulta() {
        return motivoConsulta;
    }
    public void setMotivoConsulta(String motivoConsulta) {
        this.motivoConsulta = motivoConsulta;
    }

    public String getAntecedentes() {
        return antecedentes;
    }
    public void setAntecedentes(String antecedentes) {
        this.antecedentes = antecedentes;
    }

    public String getTratamientosPrevios() {
        return tratamientosPrevios;
    }
    public void setTratamientosPrevios(String tratamientosPrevios) {
        this.tratamientosPrevios = tratamientosPrevios;
    }

    public String getExamenClinico() {
        return examenClinico;
    }
    public void setExamenClinico(String examenClinico) {
        this.examenClinico = examenClinico;
    }

    public String getDiagnostico() {
        return diagnostico;
    }
    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public String getPlanTratamiento() {
        return planTratamiento;
    }
    public void setPlanTratamiento(String planTratamiento) {
        this.planTratamiento = planTratamiento;
    }

    public void setEmail(String email) {
    }
}
