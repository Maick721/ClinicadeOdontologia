<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/6/2025
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.time.*, java.time.format.*" %>
<%
    // Manejo de mensaje de éxito (modal emergente)
    boolean mostrarModalExito = false;
    if ("success".equals(request.getParameter("msg"))) {
        mostrarModalExito = true;
    }
    List<Map<String, String>> citas = (List<Map<String, String>>) session.getAttribute("citasAgendadas");
    if (citas == null) {
        citas = new ArrayList<>();
        session.setAttribute("citasAgendadas", citas);
    }
    String fechaSeleccionada = request.getParameter("fecha");
    if (fechaSeleccionada == null) {
        fechaSeleccionada = java.time.LocalDate.now().toString();
    }
    // Nueva cita
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("nombre") != null) {
        Map<String, String> nuevaCita = new HashMap<>();
        nuevaCita.put("id", UUID.randomUUID().toString());
        nuevaCita.put("nombre", request.getParameter("nombre"));
        nuevaCita.put("fecha", request.getParameter("fecha"));
        nuevaCita.put("hora", request.getParameter("hora"));
        nuevaCita.put("profesional", request.getParameter("profesional"));
        nuevaCita.put("cedula", request.getParameter("cedula"));
        nuevaCita.put("correo", request.getParameter("correo"));
        nuevaCita.put("telefono", request.getParameter("telefono"));
        nuevaCita.put("motivo", request.getParameter("motivo"));
        citas.add(nuevaCita);
        session.setAttribute("citasAgendadas", citas);
        response.sendRedirect("panel_admin.jsp?fecha=" + request.getParameter("fecha") + "&msg=success");
        return;
    }
    if ("eliminar".equals(request.getParameter("accion")) && request.getParameter("idCita") != null) {
        String idEliminar = request.getParameter("idCita");
        Iterator<Map<String, String>> it = citas.iterator();
        while (it.hasNext()) {
            Map<String, String> cita = it.next();
            if (cita.get("id").equals(idEliminar)) {
                it.remove();
                break;
            }
        }
        session.setAttribute("citasAgendadas", citas);
        response.sendRedirect("panel_admin.jsp?fecha=" + fechaSeleccionada);
        return;
    }
    Map<String, String> citaEditar = null;
    if ("editar".equals(request.getParameter("accion")) && request.getParameter("idCita") != null) {
        for (Map<String, String> cita : citas) {
            if (cita.get("id").equals(request.getParameter("idCita"))) {
                citaEditar = cita;
                break;
            }
        }
    }
    List<String> profesionales = Arrays.asList("Dra. López", "Dr. Pérez", "Dra. Sánchez");
%>
<html>
<head>
    <title>Panel de Administrador - Smile Center</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.17/index.global.min.js'></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet"/>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0;}
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5fafd;
            color: #212f3d;
            line-height: 1.6;
        }
        header {
            background-color: #fff;
            color: #007fa3;
            padding: 24px 0 14px 0;
            border-bottom: 2px solid #e3eafc;
            text-align: center;
            box-shadow: 0 2px 10px rgba(21,101,192,0.03);
        }
        header h1 {
            font-size: 2.4em;
            font-weight: 700;
            letter-spacing: 1px;
            color: #0096c7;
            margin-bottom: 2px;
        }
        header .panel-desc {
            font-size: 1.1em;
            color: #24344d;
            opacity: 0.8;
        }
        .container {
            max-width: 1150px;
            margin: 40px auto;
            background: #ffffff;
            padding: 36px 34px 36px 34px;
            border-radius: 16px;
            box-shadow: 0 10px 32px rgba(0, 87, 158, 0.07);
        }
        .row {
            display: flex;
            flex-wrap: wrap;
            gap: 36px;
            justify-content: space-between;
        }
        .calendar-col {
            flex: 2 1 480px;
            min-width: 350px;
        }
        .citas-col {
            flex: 1 1 340px;
            min-width: 320px;
        }
        .calendar-card {
            background: #fff;
            border-radius: 14px;
            box-shadow: 0 3px 12px 0 rgba(21,101,192,0.08);
            overflow: hidden;
            border: 1.5px solid #e3eafc;
        }
        .calendar-header {
            background: #0096c7;
            color: #fff;
            padding: 1.1rem 2rem;
            font-size: 1.25rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.65rem;
            border-top-left-radius: 14px;
            border-top-right-radius: 14px;
        }
        .calendar-body {
            padding: 1.2rem 1.2rem 1.6rem 1.2rem;
        }
        .citas-dia-card {
            background: #f4fbff;
            color: #05445e;
            border-radius: 12px;
            box-shadow: 0 4px 20px 0 rgba(21,101,192,0.06);
            padding: 1.3rem 1.1rem 1.8rem 1.1rem;
            margin-bottom: 2rem;
            border: 1.5px solid #b3e0fc;
        }
        .citas-dia-header {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 1rem;
            letter-spacing: 1px;
            color: #007fa3;
        }
        .cita-item {
            background: #e3f0fb;
            color: #24344d;
            border-radius: 10px;
            padding: 1rem 1.25rem;
            margin-bottom: 1rem;
            box-shadow: 0 2px 8px 0 rgba(21,101,192,0.04);
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            gap: 1.2rem;
        }
        .cita-info {
            flex: 1;
        }
        .cita-actions {
            display: flex;
            flex-direction: row;
            align-items: center;
            gap: 0.65rem;
        }
        .cita-actions button {
            border: none;
            background: none;
            font-size: 1.1rem;
            color: #1976d2;
            transition: color 0.2s;
            cursor: pointer;
        }
        .cita-actions button.delete {
            color: #e53935;
        }
        .btn-nueva-cita {
            background: #0096c7;
            border: none;
            color: #fff;
            font-weight: 600;
            font-size: 1.07rem;
            padding: 0.82rem 1.3rem;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(21,101,192,0.09);
            transition: background 0.2s;
            width: 100%;
            margin-top: 4px;
        }
        .btn-nueva-cita:hover {
            background: #005f8a;
        }
        .modal-fondo {
            display: none;
            position: fixed;
            z-index: 1050;
            left: 0;
            top: 0;
            width: 100vw;
            height: 100vh;
            background: rgba(52, 152, 219, 0.10);
            justify-content: center;
            align-items: center;
        }
        .modal-fondo.open {
            display: flex;
        }
        .modal-cita {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 8px 32px 0 rgba(21,101,192,0.18);
            padding: 32px 24px;
            max-width: 540px;
            width: 95vw;
            max-height: 90vh;
            overflow-y: auto;
            position: relative;
            animation: modalIn .2s;
            display: flex;
            flex-direction: column;
        }
        @keyframes modalIn {
            from { transform: translateY(40px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .modal-cita .close-btn {
            position: absolute;
            top: 16px;
            right: 22px;
            font-size: 1.3em;
            color: #0096c7;
            background: none;
            border: none;
            cursor: pointer;
        }
        .modal-cita .titulo-modal {
            font-size: 1.35em;
            color: #0096c7;
            font-weight: 700;
            margin-bottom: 24px;
        }
        .form-label {
            font-weight: 500;
            color: #003049;
        }
        .modal-cita input[readonly] { background-color: #f2f8fb; color: #0a4e6b;}
        .form-control, .form-select {
            width: 100%;
            margin-bottom: 16px;
            padding: 9px 10px;
            border-radius: 8px;
            border: 1.3px solid #b3e0fc;
            font-size: 1em;
        }

        #motivoCita {
            min-height: 90px; /* O el alto que desees */
            resize: vertical; /* permite cambiar el alto manualmente si quieres */
        }

        .form-control:focus, .form-select:focus {
            border-color: #0096c7;
            outline: none;
            box-shadow: 0 0 0 0.10rem #b9e6fc44;
        }
        .form-btns {
            display: flex;
            justify-content: flex-end;
            gap: 18px;
            margin-top: 14px;
        }
        .btn-cancelar {
            background: #eaeaea;
            color: #24344d;
            border: none;
            border-radius: 8px;
            padding: 8px 22px;
            font-weight: 500;
        }
        .btn-agendar {
            background: #0096c7;
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 9px 28px;
            font-weight: 600;
            font-size: 1em;
        }
        .btn-agendar:hover { background: #005f8a; }
        .modal-exito {
            display: none;
            position: fixed;
            z-index: 2000;
            left: 0; top: 0; width: 100vw; height: 100vh;
            background: rgba(0,0,0,0.1);
            justify-content: center;
            align-items: center;
        }
        .modal-exito.open {
            display: flex;
        }
        .modal-exito-box {
            background: #e0f8e9;
            color: #2e7d32;
            border-left: 7px solid #4caf50;
            border-radius: 8px;
            font-weight: 600;
            font-size: 1.18em;
            box-shadow: 0 6px 32px rgba(0,0,0,0.07);
            padding: 32px 38px;
            text-align: center;
            position: relative;
        }
        .modal-exito .close-btn {
            position: absolute;
            top: 18px;
            right: 32px;
            font-size: 1.7em;
            color: #2e7d32;
            background: none;
            border: none;
            cursor: pointer;
        }
        /* Responsive for modal form fields */
        @media (max-width: 600px) {
            .modal-cita { padding: 18px 3vw; }
        }
    </style>
</head>
<body>
<header>
    <h1>Smile Center</h1>
    <div class="panel-desc">Panel de Administrador · Gestión de Citas Odontológicas</div>
</header>
<div class="container">
    <div class="row">
        <div class="calendar-col">
            <div class="calendar-card">
                <div class="calendar-header">
                    <i class="bi bi-calendar3"></i>
                    Calendario de Citas
                </div>
                <div class="calendar-body">
                    <div id="calendar"></div>
                </div>
            </div>
        </div>
        <div class="citas-col">
            <div class="citas-dia-card">
                <div class="citas-dia-header">
                    <i class="bi bi-info-circle"></i>
                    Citas Agendadas
                </div>
                <div class="mb-2" id="citasDiaFecha">
                    Citas para <span id="citasDiaFechaTexto"><%= java.time.LocalDate.parse(fechaSeleccionada).format(java.time.format.DateTimeFormatter.ofPattern("d 'de' MMMM 'de' yyyy", new java.util.Locale("es"))) %></span>
                </div>
                <div id="listaCitasDia">
                    <%
                        boolean hayCitas = false;
                        for (Map<String, String> cita : citas) {
                            if (fechaSeleccionada.equals(cita.get("fecha"))) {
                                hayCitas = true;
                    %>
                    <div class="cita-item" data-cita-id="<%= cita.get("id") %>">
                        <div class="cita-info">
                            <div class="fw-bold fs-6"><%= cita.get("nombre") %></div>
                            <div class="small mb-1">
                                <i class="bi bi-clock"></i> <%= cita.get("hora") %>
                                &nbsp;–&nbsp;
                                <i class="bi bi-person-badge"></i> <%= cita.get("profesional") %>
                            </div>
                            <div class="small text-muted"><%= cita.get("motivo") %></div>
                        </div>
                        <div class="cita-actions">
                            <form method="get" action="panel_admin.jsp" style="display:inline;">
                                <input type="hidden" name="accion" value="editar"/>
                                <input type="hidden" name="idCita" value="<%= cita.get("id") %>"/>
                                <input type="hidden" name="fecha" value="<%= fechaSeleccionada %>"/>
                                <button class="edit" title="Editar" type="submit"><i class="bi bi-pencil"></i></button>
                            </form>
                            <form method="post" action="panel_admin.jsp" style="display:inline;" onsubmit="return confirm('¿Está seguro de eliminar esta cita?');">
                                <input type="hidden" name="accion" value="eliminar"/>
                                <input type="hidden" name="idCita" value="<%= cita.get("id") %>"/>
                                <input type="hidden" name="fecha" value="<%= fechaSeleccionada %>"/>
                                <button class="delete" title="Eliminar" type="submit"><i class="bi bi-trash"></i></button>
                            </form>
                        </div>
                    </div>
                    <%
                            }
                        }
                        if (!hayCitas) {
                    %>
                    <div class="text-secondary">No hay citas para este día.</div>
                    <% } %>
                </div>
                <button class="btn-nueva-cita" id="btnNuevaCita">
                    <i class="bi bi-plus-circle"></i>
                    Agendar Nueva Cita para esta Fecha
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Agendar/Editar Cita -->
<div class="modal-fondo" id="modalCitaFondo">
    <form class="modal-cita" id="formCita" action="panel_admin.jsp" method="post" autocomplete="off">
        <button type="button" class="close-btn" onclick="cerrarModalCita()">&times;</button>
        <div class="titulo-modal" id="modalCitaLabel">Agendar Nueva Cita</div>
        <input type="hidden" name="idCita" id="idCita" value="<%= citaEditar != null ? citaEditar.get("id") : "" %>">
        <label class="form-label">Fecha</label>
        <input type="text" class="form-control" name="fecha" id="fechaCita" readonly
               value="<%= citaEditar != null ? citaEditar.get("fecha") : "" %>">
        <label class="form-label">Hora</label>
        <select class="form-select" name="hora" id="horaCita" required>
            <option value="">Seleccione hora</option>
            <% for (int h = 8; h <= 19; h++) {
                String horaStr = String.format("%02d:00", h);
            %>
            <option value="<%=horaStr%>" <%= citaEditar != null && horaStr.equals(citaEditar.get("hora")) ? "selected" : "" %>><%=horaStr%></option>
            <% } %>
        </select>
        <label class="form-label">Profesional</label>
        <select class="form-select" name="profesional" id="profesionalCita" required>
            <option value="">Seleccione profesional</option>
            <% for (String prof : profesionales) { %>
            <option value="<%= prof %>" <%= citaEditar != null && prof.equals(citaEditar.get("profesional")) ? "selected" : "" %>><%= prof %></option>
            <% } %>
        </select>
        <label class="form-label">Nombre del Paciente</label>
        <input type="text" class="form-control" name="nombre" id="nombreCita" required
               value="<%= citaEditar != null ? citaEditar.get("nombre") : "" %>">
        <label class="form-label">Cédula o Pasaporte</label>
        <input type="text" class="form-control" name="cedula" id="cedulaCita" pattern="[0-9]*" maxlength="15" inputmode="numeric"
               value="<%= citaEditar != null ? citaEditar.get("cedula") : "" %>" required>
        <label class="form-label">Correo Electrónico</label>
        <input type="email" class="form-control" name="correo" id="correoCita"
               value="<%= citaEditar != null ? citaEditar.get("correo") : "" %>">
        <label class="form-label">Teléfono</label>
        <input type="text" class="form-control" name="telefono" id="telefonoCita" pattern="[0-9]*" maxlength="15" inputmode="numeric"
               value="<%= citaEditar != null ? citaEditar.get("telefono") : "" %>" required>
        <label class="form-label">Motivo de la Consulta</label>
        <textarea class="form-control" name="motivo" id="motivoCita" rows="5"><%= citaEditar != null ? citaEditar.get("motivo") : "" %></textarea>
        <div class="form-btns">
            <button type="button" class="btn-cancelar" onclick="cerrarModalCita()">Cancelar</button>
            <button type="submit" class="btn-agendar" id="btnGuardarCita">Agendar Cita</button>
        </div>
    </form>
</div>

<!-- Modal de Éxito (emergente) -->
<div id="modalExito" class="modal-exito">
    <div class="modal-exito-box">
        <button type="button" class="close-btn" onclick="cerrarModalExito()">&times;</button>
        Tu cita se ha agendado con éxito
    </div>
</div>

<script>
    // FullCalendar obligatorio y personalizado
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            locale: 'es',
            selectable: true,
            dateClick: function(info) {
                abrirModalCita(info.dateStr);
            }
        });
        calendar.render();

        document.getElementById('btnNuevaCita').addEventListener('click', function() {
            abrirModalCita('<%= fechaSeleccionada %>');
        });

        <% if (mostrarModalExito) { %>
        setTimeout(function() {
            document.getElementById("modalExito").classList.add('open');
        }, 200);
        <% } %>
    });

    // Guarda la fecha seleccionada REAL yyyy-MM-dd
    var fechaSeleccionadaModal = "";

    function abrirModalCita(fecha) {
        limpiarModalCita();
        document.getElementById("modalCitaLabel").textContent = 'Agendar Nueva Cita';
        fechaSeleccionadaModal = fecha;
        document.getElementById("fechaCita").value = fecha; // yyyy-MM-dd para backend y correcto
        document.getElementById("modalCitaFondo").classList.add('open');
    }
    function cerrarModalCita() {
        document.getElementById("modalCitaFondo").classList.remove('open');
        if(window.location.search.indexOf("accion=editar") > -1){
            window.location.href = "panel_admin.jsp?fecha=" + document.getElementById("fechaCita").value;
        }
    }
    function cerrarModalExito() {
        document.getElementById("modalExito").classList.remove('open');
        if(window.location.search.indexOf("msg=success") > -1){
            let url = window.location.href.replace(/([&?])msg=success(&?)/, function(match, p1, p2) {
                return p2 === '&' ? p1 : '';
            });
            url = url.replace(/[?&]$/, '');
            window.history.replaceState({}, document.title, url);
        }
    }
    <% if (citaEditar != null) { %>
    window.onload = function() {
        document.getElementById("modalCitaLabel").textContent = 'Editar Cita';
        document.getElementById("modalCitaFondo").classList.add('open');
    }
    <% } %>
    function limpiarModalCita() {
        document.getElementById("idCita").value = '';
        document.getElementById("horaCita").value = '';
        document.getElementById("profesionalCita").value = '';
        document.getElementById("nombreCita").value = '';
        document.getElementById("cedulaCita").value = '';
        document.getElementById("correoCita").value = '';
        document.getElementById("telefonoCita").value = '';
        document.getElementById("motivoCita").value = '';
    }
    document.addEventListener("input", function(e){
        if(e.target && (e.target.id === "cedulaCita" || e.target.id === "telefonoCita")){
            e.target.value = e.target.value.replace(/\D/g, '').slice(0,15);
        }
    });
</script>
</body>
</html>