<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 8/6/2025
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Historia Clínica - Smile Center</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Estilos embebidos -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #0073b7;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .container {
            max-width: 900px;
            margin: 30px auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #0073b7;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="date"],
        input[type="number"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-top: 5px;
        }
        textarea {
            resize: vertical;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .button {
            background-color: #0073b7;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #005f8a;
        }
    </style>
</head>
<body>

<header>
    <h1>Smile Center</h1>
    <p>Registro de Historia Clínica</p>
</header>

<div class="container">
    <h2>Historia Clínica del Paciente</h2>
    <form method="post" action="PacienteServlet">

        <div class="form-group">
            <label>Nombre completo</label>
            <input type="text" name="nombre" required>
        </div>

        <div class="form-group">
            <label>Sexo</label>
            <select name="sexo" required>
                <option value="">Seleccione...</option>
                <option value="Masculino">Masculino</option>
                <option value="Femenino">Femenino</option>
            </select>
        </div>

        <div class="form-group">
            <label>Fecha de Nacimiento</label>
            <input type="date" name="fechaNacimiento" required>
        </div>

        <div class="form-group">
            <label>Teléfono</label>
            <input type="text" name="telefono">
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="text" name="email">
        </div>

        <div class="form-group">
            <label>Estatura (m)</label>
            <input type="number" step="0.01" name="estatura">
        </div>

        <div class="form-group">
            <label>Peso (kg)</label>
            <input type="number" step="0.1" name="peso">
        </div>

        <div class="form-group">
            <label>Temperatura (°C)</label>
            <input type="number" step="0.1" name="temperatura">
        </div>

        <div class="form-group">
            <label>Frecuencia respiratoria (rpm)</label>
            <input type="number" step="0.1" name="frecuenciaRespiratoria">
        </div>

        <div class="form-group">
            <label>Presión sistólica (mmHg)</label>
            <input type="number" step="0.1" name="presionSistolica">
        </div>

        <div class="form-group">
            <label>Vacunación</label>
            <textarea name="vacunacion" rows="3"></textarea>
        </div>

        <div class="form-group">
            <label>Alergias</label>
            <textarea name="alergias" rows="3"></textarea>
        </div>

        <div class="form-group">
            <label>Antecedentes Patológicos</label>
            <textarea name="antecedentesPatologicos" rows="3"></textarea>
        </div>

        <div class="form-group">
            <label>Antecedentes No Patológicos</label>
            <textarea name="antecedentesNoPatologicos" rows="3"></textarea>
        </div>

        <div class="form-group">
            <label>Antecedentes Psiquiátricos</label>
            <textarea name="antecedentesPsiquiatricos" rows="3"></textarea>
        </div>

        <button type="submit" class="button">Guardar Historia Clínica</button>
    </form>
</div>

</body>
</html>

