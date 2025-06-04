<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Smile Center - Clínica de Implantes Dentales y Odontología Integral</title>

    <!-- Estilos personalizados -->
    <link rel="stylesheet" href="css/estilos.css" />

    <!-- Esto parece incorrecto: no es un CSS, es un servlet -->
    <link rel="stylesheet" href="/LoginServlet" />

    <!-- Bootstrap CSS y JS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
    <script src="bootstrap/js/bootstrap.bundle.js" defer></script>

    <!-- Icono favicon -->
    <link rel="icon" href="favicon.ico" type="image/x-icon" />

    <!-- Google Fonts y FontAwesome para iconos -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Estilos CSS internos personalizados -->
    <style>
        /* Variables de color y estilos para el tema visual */
        :root {
            --primary-color: #00BCD4;
            --secondary-color: #006064;
            --accent-color: #84FFFF;
            --text-color: #37474F;
            --light-bg: #E0F7FA;
            --white: #FFFFFF;
        }
        /* Fuentes y colores generales */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--white);
            color: var(--text-color);
        }
        /* Estilos navbar para un diseño limpio y sombra */
        .navbar {
            background-color: var(--white) !important;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        }
        /* Marca y links en navbar con colores y transiciones */
        .navbar-brand {
            font-weight: 700;
            color: var(--primary-color) !important;
            font-size: 1.5rem;
        }
        .nav-link {
            color: var(--text-color) !important;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        .nav-link:hover {
            color: var(--primary-color) !important;
        }
        /* Botones personalizados con gradiente y efectos */
        .btn-modern {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: var(--white);
            border: none;
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 4px 15px rgba(0, 188, 212, 0.3);
        }
        .btn-modern:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 188, 212, 0.4);
            color: var(--white);
        }
        /* Botón con borde y cambio de fondo al hover */
        .btn-outline-modern {
            color: var(--primary-color);
            border: 2px solid var(--primary-color);
            background-color: transparent;
            padding: 10px 28px;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .btn-outline-modern:hover {
            background-color: var(--primary-color);
            color: var(--white);
        }
        /* Cartas con sombra y animación al pasar el mouse */
        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card-title {
            color: var(--secondary-color);
            font-weight: 600;
        }
        .display-4 {
            color: var(--secondary-color);
            font-weight: 700;
        }
        .text-success-xl {
            color: var(--primary-color) !important;
        }
        /* Estilos para los textos y fondos de los captions del carrusel */
        .carousel-caption {
            background: linear-gradient(rgba(0, 96, 100, 0.8), rgba(0, 188, 212, 0.8));
            border-radius: 15px;
            padding: 20px;
            backdrop-filter: blur(5px);
        }
        /* Formularios con bordes redondeados y colores personalizados */
        .form-control {
            border-radius: 10px;
            border: 2px solid #E0F7FA;
            padding: 12px;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(0, 188, 212, 0.25);
        }
        /* Botón Agendar Cita con estilo especial */
        .btn-agendar {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: var(--white);
            padding: 15px 40px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1.1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 4px 15px rgba(0, 188, 212, 0.3);
            transition: all 0.3s ease;
            border: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }
        .btn-agendar:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 188, 212, 0.4);
            color: var(--white);
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
        }
        /* Footer con fondo claro y texto en color secundario */
        footer {
            background-color: var(--light-bg);
            color: var(--secondary-color);
        }
    </style>

</head>
<body class="d-flex flex-column min-vh-100">
<header>
    <!-- Barra de navegación responsive -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Smile Center</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Menú colapsable -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="#">Inicio</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Sobre Nosotros</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Servicios</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Contacto</a></li>
                </ul>
                <div class="d-flex">
                    <div class="d-flex gap-3">
                        <!-- Botón para iniciar sesión -->
                        <a href="login.jsp" class="btn btn-outline-modern">Inicio de Sesión</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>

<main class="container text-center mt-5 flex-grow-1">
    <h1 class="display-4 text-success mb-3">Bienvenido a Smile Center</h1>
    <p class="lead mb-5">Especialistas en implantes dentales y odontología integral en Quito con 24 años de experiencia y más de 9.000 implantes exitosos.</p>

    <!-- Carrusel de imágenes con promociones -->
    <section class="mb-5">
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <!-- Cada item es una diapositiva con imagen y texto -->
                <div class="carousel-item active">
                    <img src="img/3.jpg" class="d-block w-100 carousel-image" alt="Imagen 1">
                    <div class="carousel-caption d-none d-md-block">
                        <h5 class="text-success-xl">Promoción de Implantes Dentales</h5>
                        <p class="carousel-caption-text">Aprovecha nuestras ofertas especiales en implantes dentales.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/2.webp" class="d-block w-100 carousel-image" alt="Imagen 2">
                    <div class="carousel-caption d-none d-md-block">
                        <h5 class="text-success-xl">Exámenes Gratuitos</h5>
                        <p class="carousel-caption-text">Realiza tus exámenes dentales sin costo.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/1.png" class="d-block w-100 carousel-image" alt="Imagen 3">
                    <div class="carousel-caption d-none d-md-block">
                        <h5 class="text-success-xl">Tratamientos Integrales</h5>
                        <p class="carousel-caption-text">Descubre nuestros servicios de odontología integral.</p>
                    </div>
                </div>
            </div>
            <!-- Controles del carrusel -->
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>

    <!-- Sección sobre nosotros -->
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

    <!-- Botón para agendar cita -->
    <section class="mb-5 text-center">
        <a href="agendar-cita.jsp" class="btn btn-agendar">
            <i class="fas fa-calendar-plus"></i>
            Agendar Cita
        </a>
    </section>

    <!-- Mapa de ubicación de la clínica -->
    <section class="mb-5">
        <div class="card mx-auto" style="max-width: 600px;">
            <div class="card-body">
                <h2 class="card-title h5 mb-4">Ubicación</h2>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3989.7651537512!2d-78.49600988582161!3d-0.18046789986060375!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x91d59b4c7d0f6d1d%3A0x4a8d11d4f8d8f3b5!2sSmile%20Center%20-%20Cl%C3%ADnica%20de%20Implantes%20Dentales%20y%20Odontolog%C3%ADa%20Integral!5e0!3m2!1ses!2sec!4v1685686800000!5m2!1ses!2sec" width="100%" height="350" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
    </section>
</main>

<!-- Footer con derechos reservados -->
<footer class="bg-light text-success text-center py-3 mt-auto">
    <small>© 2025 Smile Center - Todos los derechos reservados</small>
</footer>
</body>
</html>
