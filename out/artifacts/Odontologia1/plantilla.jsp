<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 7/6/2025
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="WEB-INF/privados/cabecero.jsp"/>
<!--Contenido-->
<div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h1 class="box-title">Historial Clínico
                            <button class="btn btn-success" id="btnagregar" onclick="mostrarform(true)">
                                <i class="fa fa-plus-circle"></i> Agregar
                            </button>
                        </h1>
                    </div>

                    <!-- Tabla de registros -->
                    <div class="panel-body table-responsive" id="listadoregistros">
                        <table id="tbllistado"
                               class="table table-striped table-bordered table-hover">
                            <thead>
                            <th>Opciones</th>
                            <th>Paciente</th>
                            <th>Fecha</th>
                            <th>Motivo</th>
                            <th>Diagnóstico</th>
                            <th>Estado</th>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                            <th>Opciones</th>
                            <th>Paciente</th>
                            <th>Fecha</th>
                            <th>Motivo</th>
                            <th>Diagnóstico</th>
                            <th>Estado</th>
                            </tfoot>
                        </table>
                    </div>

                    <!-- Formulario de ingreso/edición -->
                    <div class="panel-body" style="height: 600px;" id="formularioregistros">
                        <form name="formulario" id="formulario" method="POST">
                            <input type="hidden" name="idhistorial" id="idhistorial">

                            <div class="form-group col-lg-6">
                                <label>Paciente:</label>
                                <select id="idpaciente" name="idpaciente" class="form-control" required>
                                    <!-- Opciones dinámicas desde la base de datos -->
                                </select>
                            </div>

                            <div class="form-group col-lg-6">
                                <label>Fecha:</label>
                                <input type="date" class="form-control" name="fecha" id="fecha" required>
                            </div>

                            <div class="form-group col-lg-12">
                                <label>Motivo de consulta:</label>
                                <textarea class="form-control" name="motivo" id="motivo" maxlength="500" required></textarea>
                            </div>

                            <div class="form-group col-lg-12">
                                <label>Diagnóstico:</label>
                                <textarea class="form-control" name="diagnostico" id="diagnostico" maxlength="1000" required></textarea>
                            </div>

                            <div class="form-group col-lg-12">
                                <label>Tratamiento:</label>
                                <textarea class="form-control" name="tratamiento" id="tratamiento" maxlength="1000"></textarea>
                            </div>

                            <div class="form-group col-lg-12">
                                <label>Notas del médico:</label>
                                <textarea class="form-control" name="notas" id="notas" maxlength="1000"></textarea>
                            </div>

                            <div class="form-group col-lg-12">
                                <button class="btn btn-primary" type="submit" id="btnGuardar"><i class="fa fa-save"></i> Guardar</button>
                                <button class="btn btn-danger" onclick="cancelarform()" type="button"><i class="fa fa-arrow-circle-left"></i> Cancelar</button>
                            </div>
                        </form>
                    </div>
                    <!-- Fin del formulario -->
                </div>
            </div>
        </div>
    </section>
</div>
<!--Fin-Contenido-->
<jsp:include page="WEB-INF/privados/footer.jsp"/>
