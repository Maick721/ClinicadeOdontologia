<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Datos del Paciente - Smile Center</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        /* Reset básico */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            line-height: 1.6;
        }

        header {
            background-color: #005f8a;
            color: #fff;
            padding: 30px 0;
            text-align: center;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            font-size: 2em;
            margin-bottom: 5px;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            background: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
        }

        .data-group {
            margin-bottom: 30px;
        }

        h2 {
            margin-bottom: 20px;
            font-size: 1.8em;
            color: #333;
            border-bottom: 2px solid #0073b7;
            padding-bottom: 10px;
        }

        h3 {
            color: #0073b7;
            margin-bottom: 15px;
            font-size: 1.5em;
        }

        .label {
            display: inline-block;
            width: 200px;
            font-weight: 600;
            color: #005f8a;
        }

        p {
            margin: 8px 0;
        }

        .mensaje-exito {
            background-color: #e0f8e9;
            color: #2e7d32;
            padding: 15px 20px;
            border-left: 5px solid #4caf50;
            border-radius: 6px;
            margin-bottom: 25px;
            font-weight: 500;
        }

        .button {
            background-color: #0073b7;
            color: #fff;
            padding: 14px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
            display: inline-block;
            margin-top: 20px;
        }

        .button:hover {
            background-color: #005f8a;
        }
    </style>
</head>
<body>
<header>
    <h1>Smile Center</h1>
    <p>Datos del Paciente</p>
</header>

<div class="container">
    <% if (request.getAttribute("mensaje") != null) { %>
    <div class="mensaje-exito">
        <%= request.getAttribute("mensaje") %>
    </div>
    <% } %>

    <h2>Información del Paciente</h2>

    <% Model.Paciente paciente = (Model.Paciente) request.getAttribute("paciente"); %>

    <div class="data-group">
        <p><span class="label">Nombre:</span> <%= paciente.getNombre() %></p>
        <p><span class="label">Fecha de Nacimiento:</span> <%= paciente.getFechaNacimiento() %></p>
        <p><span class="label">Dirección:</span> <%= paciente.getDireccion() %></p>
        <p><span class="label">Teléfono:</span> <%= paciente.getTelefono() %></p>
        <p><span class="label">Correo:</span> <%= paciente.getCorreo() %></p>
    </div>

    <div class="data-group">
        <h3>Historia Clínica</h3>
        <p><span class="label">Motivo de Consulta:</span> <%= paciente.getMotivoConsulta() %></p>
        <p><span class="label">Antecedentes:</span> <%= paciente.getAntecedentes() %></p>
        <p><span class="label">Tratamientos Previos:</span> <%= paciente.getTratamientosPrevios() %></p>
        <p><span class="label">Examen Clínico:</span> <%= paciente.getExamenClinico() %></p>
        <p><span class="label">Diagnóstico:</span> <%= paciente.getDiagnostico() %></p>
        <p><span class="label">Plan de Tratamiento:</span> <%= paciente.getPlanTratamiento() %></p>
    </div>

    <a href="PacienteServlet" class="button">Nueva Historia Clínica</a>
</div>
</body>
</html>
