<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 2/6/2025
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Agendar Cita</title>
    <!-- Bootstrap CSS y JS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
    <script src="bootstrap/js/bootstrap.bundle.js" defer></script>
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-7 col-lg-6">
            <div class="card shadow">
                <div class="card-body">
                    <h2 class="card-title text-center mb-4 text-primary fw-bold">Agendar Cita</h2>
                    <form action="${pageContext.request.contextPath}/citas/agendar" method="post" autocomplete="off">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre del paciente</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>
                        <div class="mb-3">
                            <label for="cedula" class="form-label">Cédula</label>
                            <input type="text" class="form-control" id="cedula" name="cedula" required>
                        </div>
                        <div class="mb-3">
                            <label for="correo" class="form-label">Correo electrónico</label>
                            <input type="email" class="form-control" id="correo" name="correo" required>
                        </div>
                        <div class="mb-3">
                            <label for="telefono" class="form-label">Número de teléfono</label>
                            <input type="tel" class="form-control" id="telefono" name="telefono" required pattern="[0-9]{8,15}">
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="fecha" class="form-label">Fecha disponible</label>
                                <input type="date" class="form-control" id="fecha" name="fecha" required min="<%= java.time.LocalDate.now() %>">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="hora" class="form-label">Hora disponible</label>
                                <input type="time" class="form-control" id="hora" name="hora" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="motivo" class="form-label">Motivo de la consulta</label>
                            <textarea class="form-control" id="motivo" name="motivo" rows="3" required></textarea>
                        </div>
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
