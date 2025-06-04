<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Smile Center - Inicio de Sesión</title>

    <%-- Bootstrap para estilos modernos --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <%-- Estilo personalizado para clínica odontológica --%>
    <style>
        body {
            background: linear-gradient(to right, #e0f7fa, #ffffff);
            font-family: 'Segoe UI', sans-serif;
        }

        .card {
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            border: none;
        }

        .card-title {
            font-weight: 600;
            color: #00796b;
        }

        .form-control {
            border-radius: 10px;
        }

        .btn-primary {
            background-color: #00796b;
            border-color: #00796b;
            border-radius: 10px;
        }

        .btn-primary:hover {
            background-color: #004d40;
            border-color: #004d40;
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4" style="width: 400px;">
        <div class="card-body">
            <h2 class="card-title text-center mb-4">Iniciar Sesión</h2>

            <%-- Formulario de login sin el campo de rol --%>
            <form method="post" action="LoginServlet">
                <div class="mb-3">
                    <label for="username" class="form-label">Usuario</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Ingresar</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
