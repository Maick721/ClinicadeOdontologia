<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Smile Center - Clínica de Implantes Dentales y Odontología Integral</title>

    <!-- Estilos personalizados -->
    <link rel="stylesheet" href="css/estilos.css" />
    <!-- Bootstrap -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
    <script src="bootstrap/js/bootstrap.bundle.js" defer></script>

    <!-- Favicon simple -->
    <link rel="icon" href="favicon.ico" type="image/x-icon" />
</head>
<body class="bg-light d-flex flex-column min-vh-100">
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Smile Center</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Sobre Nosotros</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Servicios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contacto</a>
                    </li>
                </ul>
                <div class="d-flex">
                    <a href="agendar-cita.jsp" class="btn btn-outline-light me-2">Agendar Cita</a>
                    <a href="login.jsp" class="btn btn-outline-light">Inicio de Sesión</a>
                </div>
            </div>
        </div>
    </nav>
</header>

<main class="container text-center mt-5 flex-grow-1">
    <h1 class="display-4 text-primary mb-3">Bienvenido a Smile Center</h1>
    <p class="lead mb-5">Especialistas en implantes dentales y odontología integral en Quito con 24 años de experiencia y más de 9.000 implantes exitosos.</p>

    <section class="mb-5">
        <div class="card mx-auto" style="max-width: 500px;">
            <div class="card-body">
                <h2 class="card-title h5">Sobre Nosotros</h2>
                <p class="card-text">
                    Somos una clínica especializada en implantes dentales y odontología integral, con un equipo de profesionales altamente capacitados y con amplia experiencia en el campo.
                </p>
            </div>
        </div>
    </section>

    <section class="mb-5">
        <div class="card mx-auto" style="max-width: 600px;">
            <div class="card-body">
                <h2 class="card-title h5 mb-4">Solicita tu cita</h2>
                <form method="post" action="CitaServlet" novalidate>
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Correo Electrónico</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Teléfono</label>
                        <input type="tel" class="form-control" id="telefono" name="telefono" required>
                    </div>
                    <div class="mb-3">
                        <label for="fecha" class="form-label">Fecha de Cita</label>
                        <input type="date" class="form-control" id="fecha" name="fecha" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Solicitar Cita</button>
                </form>
            </div>
        </div>
    </section>

    <section class="mb-5">
        <div class="card mx-auto" style="max-width: 600px;">
            <div class="card-body">
                <h2 class="card-title h5 mb-4">Ubicación</h2>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3989.7651537512!2d-78.49600988582161!3d-0.18046789986060375!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x91d59b4c7d0f6d1d%3A0x4a8d11d4f8d8f3b5!2sSmile%20Center%20-%20Cl%C3%ADnica%20de%20Implantes%20Dentales%20y%20Odontolog%C3%ADa%20Integral!5e0!3m2!1ses!2sec!4v1685686800000!5m2!1ses!2sec" width="100%" height="350" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
    </section>
</main>

<footer class="bg-primary text-white text-center py-3 mt-auto">
    <small>© 2025 Smile Center - Todos los derechos reservados</small>
</footer>
</body>
</html>
