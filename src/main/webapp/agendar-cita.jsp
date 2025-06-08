<%--
  Created by IntelliJ IDEA.
  User: CLINICA
  Date: 2/6/2025
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Agendar Cita</title>

    <!-- Enlaces a Bootstrap CSS y JS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
    <script src="bootstrap/js/bootstrap.bundle.js" defer></script>

    <script>
        // Función para permitir solo números en campos específicos (cedula y telefono)
        function soloNumeros(e) {
            const key = e.key;
            // Permite solo números, flechas, borrar y tabulador
            if (!/[0-9]/.test(key) && key !== "Backspace" && key !== "Delete" && key !== "ArrowLeft" && key !== "ArrowRight" && key !== "Tab") {
                e.preventDefault();
            }
        }

        // Función que valida el formulario antes de enviarlo
        function validarFormulario() {
            let valido = true;
            let mensaje = "";

            // Validación del campo "nombre"
            const nombre = document.getElementById("nombre").value.trim();
            if (nombre.length === 0) {
                valido = false;
                mensaje += "Ingrese el nombre del paciente.<br/>";
            }

            // Validación del campo "cedula" (máx. 10 dígitos numéricos)
            const cedula = document.getElementById("cedula").value.trim();
            if (!/^\d{1,10}$/.test(cedula)) {
                valido = false;
                mensaje += "La cédula solo debe contener números (máx. 10 dígitos).<br/>";
            }

            // Validación del correo electrónico (formato básico)
            const correo = document.getElementById("correo").value.trim();
            if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(correo)) {
                valido = false;
                mensaje += "Ingrese un correo electrónico válido.<br/>";
            }

            // Validación del teléfono (exactamente 10 dígitos)
            const telefono = document.getElementById("telefono").value.trim();
            if (!/^\d{10}$/.test(telefono)) {
                valido = false;
                mensaje += "El número de teléfono debe contener exactamente 10 números.<br/>";
            }

            // Validación de la fecha (no vacía)
            const fecha = document.getElementById("fecha").value;
            if (!fecha) {
                valido = false;
                mensaje += "Seleccione una fecha.<br/>";
            }

            // Validación de la hora (no vacía)
            const hora = document.getElementById("hora").value;
            if (!hora) {
                valido = false;
                mensaje += "Seleccione una hora.<br/>";
            }

            // Validación del motivo de la consulta
            const motivo = document.getElementById("motivo").value.trim();
            if (motivo.length === 0) {
                valido = false;
                mensaje += "Ingrese el motivo de la consulta.<br/>";
            }

            // Mostrar mensajes de error
            document.getElementById("mensaje-error").innerHTML = mensaje;

            if (valido) {
                // Si todo está correcto, guarda un indicador en localStorage
                localStorage.setItem("citaAgendada", "ok");
                // Redirige al index.jsp
                window.location.href = "index.jsp";
            }

            return false; // Impide el envío tradicional del formulario
        }

        // Configura los eventos al cargar la página
        window.onload = function () {
            document.getElementById("cedula").addEventListener("keypress", soloNumeros);
            document.getElementById("telefono").addEventListener("keypress", soloNumeros);
        }
    </script>
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-7 col-lg-6">
            <div class="card shadow">
                <div class="card-body">
                    <h2 class="card-title text-center mb-4 text-primary fw-bold">Agendar Cita</h2>

                    <!-- Formulario de agendamiento de cita -->
                    <form id="agendar-cita-form" action="#" method="post" autocomplete="off" onsubmit="return validarFormulario();">
                        <!-- Campo nombre -->
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre del paciente</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>

                        <!-- Campo cédula -->
                        <div class="mb-3">
                            <label for="cedula" class="form-label">Cédula</label>
                            <input type="text" class="form-control" id="cedula" name="cedula" maxlength="10" required pattern="\d{1,10}" inputmode="numeric" autocomplete="off">
                        </div>

                        <!-- Campo correo electrónico -->
                        <div class="mb-3">
                            <label for="correo" class="form-label">Correo electrónico</label>
                            <input type="email" class="form-control" id="correo" name="correo" required>
                        </div>

                        <!-- Campo teléfono -->
                        <div class="mb-3">
                            <label for="telefono" class="form-label">Número de teléfono</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" maxlength="10" required pattern="\d{10}" inputmode="numeric" autocomplete="off">
                        </div>

                        <!-- Campo fecha y hora en dos columnas -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="fecha" class="form-label">Fecha disponible</label>
                                <!-- Usa la fecha actual como mínimo -->
                                <input type="date" class="form-control" id="fecha" name="fecha" required min="<%= java.time.LocalDate.now() %>">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="hora" class="form-label">Hora disponible</label>
                                <input type="time" class="form-control" id="hora" name="hora" required>
                            </div>
                        </div>

                        <!-- Campo motivo de la consulta -->
                        <div class="mb-3">
                            <label for="motivo" class="form-label">Motivo de la consulta</label>
                            <textarea class="form-control" id="motivo" name="motivo" rows="3" required></textarea>
                        </div>

                        <!-- Área para mostrar errores de validación -->
                        <div id="mensaje-error" class="text-danger mb-3 fw-bold" style="min-height:28px"></div>

                        <!-- Botón para agendar cita -->
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn-lg">Agendar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
