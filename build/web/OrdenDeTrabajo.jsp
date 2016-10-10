<%-- 
    Document   : OrdenDeTrabajo
    Created on : 7/10/2016, 11:29:08 AM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Orden de Trabajo</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/jasny-bootstrap.min.css" rel="stylesheet">
        <link href="css/jquery.datetimepicker.css" rel="stylesheet">
        <link href="css/bootstrap-radio.css" rel="stylesheet">
        <link href="css/bootstrap-checkbox.css" rel="stylesheet">
        <link href="css/select2.min.css" rel="stylesheet">
    </head>
    <body>
         <%
                Usuario u = (Usuario)session.getAttribute("usr");
                if(u==null){
                    out.print("<h1>Debes <strong><a href='index.jsp'>INICIAR SESION</a></strong> para acceder a este servicio</h1>");
                }else{
                
                
        %>
        <style>
            .border{
                border: 1px solid #269abc;
                border-radius: 10px;
/*                background-image: url("../images/fondo-estrellas.jpg");
                background-repeat: no-repeat;
                background-size: cover;*/
            }
            .imagen{
                width: 20%;
                position: relative;
                margin-right: 0px;
            }
        </style>
        <div class="container-fluid"><%-- inicio container fluid --%>
            <div class="border">

                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 colsm-10 col-sm-offset-1">
                        <h1 class="text-info bg-primary text-center">
                            Orden de Trabajo
                            <img src="images/logotipo3.png" class="imagen"/>
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-sm-2 col-sm-offset-1">
                        <label for="ordtrabajo">Orden de Trabajo N°:</label>
                        <input type="text" class="form-control" id="ordtrabajo" placeholder="">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-sm-4 col-sm-offset-1">
                        <label for="solicita">Solicita:</label>
                        <input type="text" class="form-control" id="solicita" placeholder="">
                    </div>
                    <div class="form-group col-lg-2 col-md-2 col-sm-2">
                        <label for="fechainicio">Fecha de Inicio:</label>
                        <input type="text" class="form-control" id="fechainicio" placeholder="">
                    </div>
                    <div class="form-group col-lg-2 col-md-2 col-sm-2">
                        <label for="fechafinal">Fecha de Finalizacion:</label>
                        <input type="text" class="form-control" id="fechafinal" placeholder="">
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 colsm-10 col-sm-offset-1 ">
                        <fieldset>
                            <legend class="text-primary"><strong>Tipo de Mantenimiento</strong></legend>
                            <div class="row">
                                <div class="funkyradio-danger col-lg-4 funkyradio col-md-4 col-sm-4 ">
                                    <input type="radio" name="radio" id="radio1" />
                                    <label  for="radio1"><strong>Emergencia</strong></label>
                                </div>
                                <div class="funkyradio-success col-lg-4 funkyradio col-md-4 col-sm-4">
                                    <input type="radio" name="radio" id="radio2" checked/>
                                    <label  for="radio2"><strong>Preventivo</strong></label>
                                </div>
                                <div class="funkyradio-primary col-lg-4 funkyradio col-md-4 col-sm-4">
                                    <input type="radio" name="radio" id="radio3" />
                                    <label  for="radio3"><strong>Correctivo</strong></label>
                                </div>
                            </div>
                        </fieldset>
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5 col-lg-offset-1 form-group col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
                        <label  for="select-equipos"><strong>Equipo:</strong></label>
                        <select id="select2-equipos" class="form-control">
                            <option></option>
                            <option value="requirements">Requirements</option>
                            <option value="design">Design</option>
                            <option value="construction">Construction</option>
                            <option value="testing">Testing</option>
                            <option value="debugging">Debugging</option>
                            <option value="deployment">Deployment</option>
                            <option value="maintenance">Maintenance</option>
                        </select>
                    </div>
                    <div class="col-lg-5 col-md-5 col-sm-5">
                        <label for="fechainicio">Codigo:</label>
                        <input type="text" class="form-control" id="fechainicio" placeholder="">
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1">
                        <fieldset>
                            <legend class="text-primary"><strong>Tipo de Daño</strong></legend>
                            <div class="row">
                                <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                    <input type="checkbox" name="electrico" id="electrico" autocomplete="off" />
                                    <div class="btn-group" style="width:  100%">
                                        <label for="electrico" class="btn btn-danger col-lg-2 col-md-2 col-sm-2">
                                            <span class="glyphicon glyphicon-ok"></span>
                                            <span> </span>
                                        </label>
                                        <label for="electrico" class="btn btn-default active col-lg-10 col-md-10 col-sm-10">
                                            <strong>Daño Eléctrico</strong>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <input type="checkbox" name="mecanico" id="mecanico" autocomplete="off" />
                                    <div class="btn-group" style="width:  100%">
                                        <label for="mecanico" class="btn btn-success col-lg-2 col-md-2 col-sm-2">
                                            <span class="glyphicon glyphicon-ok"></span>
                                            <span> </span>
                                        </label>
                                        <label for="mecanico" class="btn btn-default active col-lg-10 col-md-10 col-sm-10">
                                            <strong>Daño Mecánico</strong>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                    <input type="checkbox" name="electronico" id="electronico" autocomplete="off" />
                                    <div class="btn-group" style="width:  100%">
                                        <label for="electronico" class="btn btn-primary col-lg-2 col-md-2 col-sm-2">
                                            <span class="glyphicon glyphicon-ok"></span>
                                            <span> </span>
                                        </label>
                                        <label for="electronico" class="btn btn-default active col-lg-10">
                                            <strong>Daño Electrónico</strong>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1">
                        <fieldset>
                            <legend class="text-primary"><strong>Diagnostico</strong></legend>
                            <div class="row">
                                <div class="form-group col-lg-12 col-md-12 col-sm-12 ">
                                    <textarea  class="form-control"id="diagnostico"  name="diagnostico" value="" style="width: 100%; height: 80px" ></textarea>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1">
                        <table class="table-bordered table-responsive table table-hover">
                            <thead class="bg-primary">
                            <th style="width: 40%">TAREA</th>
                            <th>DURACION TAREA</th>
                            <th>MATERIALES</th>
                            <th>CANTIDAD</th>
                            <th>COSTO</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <textarea  class="form-control"id="diagnostico"  name="diagnostico" value="" style="width: 100%; height: 80px" ></textarea>
                                    </td>
                                    <td>
                                        <div class="form-group">
                                            <input type="text" class="form-control fechainicio-durtar" id="fechainicio-durtar" placeholder="Fecha Inicio">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control fechafinal-durtar" id="fechafinal-durtar" placeholder="Fecha Finalizacion">
                                        </div>
                                    </td>
                                    <td>
                                        <textarea  class="form-control"id="diagnostico"  name="diagnostico" value="" style="width: 100%; height: 80px" ></textarea>
                                    </td>
                                    <td>
                                        <textarea  class="form-control"id="diagnostico"  name="diagnostico" value="" style="width: 100%; height: 80px" ></textarea>
                                    </td>
                                    <td>
                                        <textarea  class="form-control"id="diagnostico"  name="diagnostico" value="" style="width: 100%; height: 80px" ></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <textarea  class="form-control"id="diagnostico"  name="diagnostico" value="" style="width: 100%; height: 80px" ></textarea>
                                    </td>
                                    <td>
                                        <div class="form-group">
                                            <input type="text" class="form-control fechainicio-durtar" id="fechainicio-durtar" placeholder="Fecha Inicio">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control fechafinal-durtar" id="fechafinal-durtar" placeholder="Fecha Finalizacion">
                                        </div>
                                    </td>
                                    <td>
                                        <textarea  class="form-control"id="diagnostico"  name="diagnostico" value="" style="width: 100%; height: 80px" ></textarea>
                                    </td>
                                    <td>
                                        <textarea  class="form-control"id="diagnostico"  name="diagnostico" value="" style="width: 100%; height: 80px" ></textarea>
                                    </td>
                                    <td>
                                        <textarea  class="form-control"id="diagnostico"  name="diagnostico" value="" style="width: 100%; height: 80px" ></textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-lg-offset-8 col-md-3 col-md-offset-8 col-sm-3 col-sm-offset-8">
                        <button type="button" class="btn  btn-default col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
                            Cancelar
                        </button>
                        <button type="button" class="btn  btn-success col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
                            Guardar
                        </button>
                    </div>
                </div>
                <br><br>

            </div>
        </div><%-- fin container fluid --%>
        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jasny-bootstrap.min.js"></script>
        <script src="js/jquery.datetimepicker.full.js"></script>
        <script src="js/select2.min.js"></script>
        <script>
            $('#fechafinal').datetimepicker({
                timepicker: false,
                 format:'d/m/Y'
            });
            $('#fechainicio').datetimepicker({
                timepicker: false,
                format:'d/m/Y'
            });
            $('.fechafinal-durtar').datetimepicker({
                timepicker: false,
                format:'d/m/Y'
            });
            $('.fechainicio-durtar').datetimepicker({
                timepicker: false,
                format:'d/m/Y'
            });
            $('#select2-equipos').select2({
                placeholder: 'Selecciona...'
            });
        </script>
        <%}%>
    </body>
</html>
