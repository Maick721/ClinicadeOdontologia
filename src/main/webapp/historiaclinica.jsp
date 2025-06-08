<%--
  Created by IntelliJ IDEA.
  User: CLINICA
  Date: 2/6/2025
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Smile Center - Historia Clínica Dental</title>

    <%-- Inclusión de Bootstrap 5 para estilos responsivos --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- Fuente personalizada desde Google Fonts --%>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        <%-- Estilos generales para el diseño visual de la página --%>
        body {
            background: linear-gradient(135deg, #e0f7fa 0%, #ffffff 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            max-width: 800px;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: 500;
            color: #333;
        }

        .btn-submit {
            background: linear-gradient(135deg, #00796b 0%, #004d40 100%);
            color: white;
            border: none;
            border-radius: 10px;
            padding: 12px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 121, 107, 0.4);
        }
    </style>
</head>
<body>

<div class="container">
    <%-- Título de la sección del formulario --%>
    <div class="header">
        <h2>Historia Clínica Dental</h2>
        <p>Complete la información del paciente</p>
    </div>

    <%-- Formulario para enviar datos al servlet GuardarHistoriaClinicaServlet usando POST --%>
    <form method="post" action="GuardarHistoriaClinicaServlet">

        <%-- Campo: Nombre del paciente --%>
        <div class="mb-4">
            <label for="nombre" class="form-label">Nombre Completo</label>
            <input type="text" class="form-control" id="nombre" name="nombre" required placeholder="Ej: Juan Pérez">
        </div>

        <%-- Campo: Fecha de nacimiento --%>
        <div class="mb-4">
            <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento</label>
            <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento" required>
        </div>

        <%-- Campo: Dirección del paciente --%>
        <div class="mb-4">
            <label for="direccion" class="form-label">Dirección</label>
            <input type="text" class="form-control" id="direccion" name="direccion" required placeholder="Ej: Calle Falsa 123">
        </div>

        <%-- Campo: Teléfono de contacto --%>
        <div class="mb-4">
            <label for="telefono" class="form-label">Teléfono</label>
            <input type="tel" class="form-control" id="telefono" name="telefono" required placeholder="Ej: 0991234567">
        </div>

        <%-- Campo: Correo electrónico --%>
        <div class="mb-4">
            <label for="correo" class="form-label">Correo Electrónico</label>
            <input type="email" class="form-control" id="correo" name="correo" required placeholder="Ej: juanperez@gmail.com">
        </div>

        <%-- Campo: Motivo de la consulta odontológica --%>
        <div class="mb-4">
            <label for="motivoConsulta" class="form-label">Motivo de la Consulta</label>
            <textarea class="form-control" id="motivoConsulta" name="motivoConsulta" rows="4" required placeholder="Describa brevemente el motivo de la consulta..."></textarea>
        </div>

        <%-- Campo: Antecedentes médicos generales --%>
        <div class="mb-4">
            <label for="antecedentes" class="form-label">Antecedentes Médicos</label>
            <textarea class="form-control" id="antecedentes" name="antecedentes" rows="4" placeholder="Ej: Enfermedades previas, alergias..."></textarea>
        </div>

        <%-- Campo: Tratamientos dentales anteriores --%>
        <div class="mb-4">
            <label for="tratamientosPrevios" class="form-label">Tratamientos Previos</label>
            <textarea class="form-control" id="tratamientosPrevios" name="tratamientosPrevios" rows="4" placeholder="Ej: Tratamientos dentales anteriores..."></textarea>
        </div>

        <%-- Campo: Resultado del examen clínico --%>
        <div class="mb-4">
            <label for="examenClinico" class="form-label">Examen Clínico</label>
            <textarea class="form-control" id="examenClinico" name="examenClinico" rows="4" placeholder="Resultados del examen clínico..."></textarea>
        </div>

        <%-- Campo: Diagnóstico odontológico --%>
        <div class="mb-4">
            <label for="diagnostico" class="form-label">Diagnóstico</label>
            <textarea class="form-control" id="diagnostico" name="diagnostico" rows="4" placeholder="Diagnóstico basado en la evaluación..."></textarea>
        </div>

        <%-- Campo: Plan de tratamiento propuesto --%>
        <div class="mb-4">
            <label for="planTratamiento" class="form-label">Plan de Tratamiento</label>
            <textarea class="form-control" id="planTratamiento" name="planTratamiento" rows="4" placeholder="Detalles del plan de tratamiento..."></textarea>
        </div>

        <%-- Botón de envío del formulario --%>
        <button type="submit" class="btn btn-submit w-100">Guardar Historia Clínica</button>
    </form>
</div>

<%-- Inclusión del bundle JS de Bootstrap para funcionalidad interactiva --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

