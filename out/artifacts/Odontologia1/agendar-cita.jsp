<%--
  Created by IntelliJ IDEA.
  User: CLINICA
  Date: 2/6/2025
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="java.util.*" %>
<%
    // Obtener datos previos y errores si los hay
    Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
    Map<String, String> cita = (Map<String, String>) request.getAttribute("cita");
    if (cita == null) cita = new HashMap<>();
%>
<html>
<head>
    <title>Agendar Cita</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
    <script src="bootstrap/js/bootstrap.bundle.js"></script>
    <script>
        function soloNumeros(e) {
            const key = e.key;
            if (!/[0-9]/.test(key) && key !== "Backspace" && key !== "Delete" && key !== "ArrowLeft" && key !== "ArrowRight" && key !== "Tab") {
                e.preventDefault();
            }
        }
        function validarFormulario() {
            let valido = true;
            let mensaje = "";

            const nombre = document.getElementById("nombre").value.trim();
            if (nombre.length === 0) {
                valido = false;
                mensaje += "Ingrese el nombre del paciente.<br/>";
            }
            const cedula = document.getElementById("cedula").value.trim();
            if (!/^\d{1,10}$/.test(cedula)) {
                valido = false;
                mensaje += "La cédula solo debe contener números (máx. 10 dígitos).<br/>";
            }
            const correo = document.getElementById("correo").value.trim();
            if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(correo)) {
                valido = false;
                mensaje += "Ingrese un correo electrónico válido.<br/>";
            }
            const telefono = document.getElementById("telefono").value.trim();
            if (!/^\d{10}$/.test(telefono)) {
                valido = false;
                mensaje += "El número de teléfono debe contener exactamente 10 números.<br/>";
            }
            const fecha = document.getElementById("fecha").value;
            if (!fecha) {
                valido = false;
                mensaje += "Seleccione una fecha.<br/>";
            }
            const hora = document.getElementById("hora").value;
            if (!hora) {
                valido = false;
                mensaje += "Seleccione una hora.<br/>";
            }
            const motivo = document.getElementById("motivo").value.trim();
            if (motivo.length === 0) {
                valido = false;
                mensaje += "Ingrese el motivo de la consulta.<br/>";
            }

            document.getElementById("mensaje-error").innerHTML = mensaje;
            return valido;
        }
        window.onload = function() {
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
                    <form id="agendar-cita-form" action="<%=request.getContextPath()%>/citas/agendar" method="post" autocomplete="off" onsubmit="return validarFormulario();">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre del paciente</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" value="<%=cita.getOrDefault("nombre", "")%>">
                            <span style="color:red">
                                <%= errores != null && errores.get("nombre") != null ? errores.get("nombre") : "" %>
                            </span>
                        </div>
                        <div class="mb-3">
                            <label for="cedula" class="form-label">Cédula</label>
                            <input type="text" class="form-control" id="cedula" name="cedula" maxlength="10" value="<%=cita.getOrDefault("cedula", "")%>">
                            <span style="color:red">
                                <%= errores != null && errores.get("cedula") != null ? errores.get("cedula") : "" %>
                            </span>
                        </div>
                        <div class="mb-3">
                            <label for="correo" class="form-label">Correo electrónico</label>
                            <input type="email" class="form-control" id="correo" name="correo" value="<%=cita.getOrDefault("correo", "")%>">
                            <span style="color:red">
                                <%= errores != null && errores.get("correo") != null ? errores.get("correo") : "" %>
                            </span>
                        </div>
                        <div class="mb-3">
                            <label for="telefono" class="form-label">Número de teléfono</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" maxlength="10" value="<%=cita.getOrDefault("telefono", "")%>">
                            <span style="color:red">
                                <%= errores != null && errores.get("telefono") != null ? errores.get("telefono") : "" %>
                            </span>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="fecha" class="form-label">Fecha disponible</label>
                                <input type="date" class="form-control" id="fecha" name="fecha" value="<%=cita.getOrDefault("fecha", "")%>" min="<%= java.time.LocalDate.now() %>">
                                <span style="color:red">
                                    <%= errores != null && errores.get("fecha") != null ? errores.get("fecha") : "" %>
                                </span>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="hora" class="form-label">Hora disponible</label>
                                <input type="time" class="form-control" id="hora" name="hora" value="<%=cita.getOrDefault("hora", "")%>">
                                <span style="color:red">
                                    <%= errores != null && errores.get("hora") != null ? errores.get("hora") : "" %>
                                </span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="motivo" class="form-label">Motivo de la consulta</label>
                            <textarea class="form-control" id="motivo" name="motivo" rows="3"><%=cita.getOrDefault("motivo", "")%></textarea>
                            <span style="color:red">
                                <%= errores != null && errores.get("motivo") != null ? errores.get("motivo") : "" %>
                            </span>
                        </div>
                        <div id="mensaje-error" class="text-danger mb-3 fw-bold" style="min-height:28px"></div>
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