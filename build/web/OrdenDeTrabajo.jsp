<%-- 
    Document   : OrdenDeTrabajo
    Created on : 7/10/2016, 11:29:08 AM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="beans.Equipo"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="beans.Repuesto"%>
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
    </head>
    <body>
        <%
            Usuario u = (Usuario) session.getAttribute("usr");
            if (u == null) {
                out.print("<h1>Debes <strong><a href='index.jsp'>INICIAR SESION</a></strong> para acceder a este servicio</h1>");
            } else {

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
                                    <input type="radio" name="radio" id="emergencia" />
                                    <label  for="emergencia"><strong>Emergencia</strong></label>
                                </div>
                                <div class="funkyradio-success col-lg-4 funkyradio col-md-4 col-sm-4">
                                    <input type="radio" name="radio" id="preventivo" checked/>
                                    <label  for="preventivo"><strong>Preventivo</strong></label>
                                </div>
                                <div class="funkyradio-primary col-lg-4 funkyradio col-md-4 col-sm-4">
                                    <input type="radio" name="radio" id="correctivo" />
                                    <label  for="correctivo"><strong>correctivo</strong></label>
                                </div>
                            </div>
                        </fieldset>
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <%  Equipo e = new Equipo();
                        List<Equipo> listaeq = e.listarEquipos();

                    %>
                    <div class="col-lg-5 col-lg-offset-1 form-group col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
                        <label  for="select-equipos"><strong>Equipo:</strong></label>
                        <select id="select2-equipos" class="form-control">
                            <option></option>
                            <% for (Equipo eq : listaeq) {
                            %>
                            <option value="<%=eq.getIdEquipos()%>//<%=eq.getNombre()%>//<%=eq.getCodigo()%>"><%=eq.getNombre()%></option>
                            <% }
                            %>
                        </select>
                    </div>
                    <div class="col-lg-5 col-md-5 col-sm-5">
                        <label for="codigo">Codigo:</label>
                        <input type="text" class="form-control" id="codigo" placeholder="" readonly>
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
                            <th style="width: 35%">TAREA</th>
                            <th  style="width: 15%">DURACION TAREA</th>
                            <th>MATERIALES/CANTIDAD</th>
                            <th style="width: 10%">COSTO</th>
                            </thead>
                            <tbody>
                                <tr class="tarea">
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
                                        <% Repuesto r = new Repuesto();
                                            List<Repuesto> lista = r.listarRepuestos();
                                        %>
                                        <div class="row otrosrepuestos">
                                            <div class="col-lg-8 col-md-8 col-sm-8">
                                                <select id="select2-equipos" class="form-control">
                                                    <option></option>
                                                    <% for (Repuesto re : lista) {
                                                    %>
                                                    <option value="<%=re.getIdRepuestos()%>//<%=re.getNombre()%>//<%=re.getPrecio()%>//<%=re.getCantidad()%>"><%=re.getNombre()%></option>
                                                    <% }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4">
                                                <input type="number" class="form-control cantidad" id="cantidad" placeholder="cantidad">
                                            </div>
                                        </div>
                                        <button type="button" class="masrepuestos btn btn-success pull-right">
                                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                        </button>
                                    </td>
                                    <td>
                                        <input type="number" class="form-control" id="costo" placeholder="costo">
                                    </td>
                                </tr>
                                <tr class="tarea">
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
                                        <div class="row otrosrepuestos">
                                            <div class="col-lg-8 col-md-8 col-sm-8">
                                                <select id="select2-equipos" class="form-control">
                                                    <option></option>
                                                    <% for (Repuesto re : lista) {
                                                    %>
                                                    <option value="<%=re.getIdRepuestos()%>//<%=re.getNombre()%>//<%=re.getPrecio()%>//<%=re.getCantidad()%>"><%=re.getNombre()%></option>
                                                    <% }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4">
                                                <input type="number" class="form-control cantidad" id="cantidad" placeholder="cantidad">
                                            </div>
                                        </div>
                                        <button type="button" class="masrepuestos btn btn-success pull-right">
                                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                        </button>
                                    </td>
                                    <td>
                                        <input type="number" class="form-control" id="costo" placeholder="costo">
                                    </td>
                                </tr>
                                <tr class="tarea">
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
                                        <div class="row otrosrepuestos">
                                            <div class="col-lg-8 col-md-8 col-sm-8">
                                                <select id="select2-equipos" class="form-control">
                                                    <option></option>
                                                    <% for (Repuesto re : lista) {
                                                    %>
                                                    <option value="<%=re.getIdRepuestos()%>//<%=re.getNombre()%>//<%=re.getPrecio()%>//<%=re.getCantidad()%>"><%=re.getNombre()%></option>
                                                    <% }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4">
                                                <input type="number" class="form-control cantidad" id="cantidad" placeholder="cantidad">
                                            </div>
                                        </div>
                                        <button type="button" class="masrepuestos btn btn-success pull-right">
                                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                        </button>
                                    </td>
                                    <td>
                                        <input type="number" class="form-control" id="costo" placeholder="costo">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-lg-offset-8 col-md-3 col-md-offset-8 col-sm-3 col-sm-offset-8">
                        <button type="button" class=" cancelar btn btn-default col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
                            Cancelar
                        </button>
                        <button type="button" class="guardar btn btn-success col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
                            Guardar
                        </button>
                    </div>
                </div>
                <br><br>

            </div>
            <script type="text/template" id="select-repuestos">

                <div class="row otrosrepuestos">
                <div class="col-lg-8 col-md-8 col-sm-8">
                <select id="select2-equipos" class="form-control">
                <option></option>
                <#_.each(repuestos,function(e,i){#>
                <option value="<#=e.idRepuestos#>//<#=e.nombre#>//<#=e.precio#>//<#=e.cantidad#>"><#=e.nombre#></option>
                <#});#>
                </select>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                <input type="number" class="form-control cantidad" id="cantidad" placeholder="cantidad">
                </div>
                </div>


            </script>
            <%
                String repsuetos = new Gson().toJson(lista);
            %>
        </div><%-- fin container fluid --%>
        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jasny-bootstrap.min.js"></script>
        <script src="js/jquery.datetimepicker.full.js"></script>
        <script src="js/underscore-1.8.min.js"></script>
        <script>
            var repsuetos = <%=repsuetos%>;
            var app = {
                _plantillaRepuestos: _.template($('#select-repuestos').html().replace(/\n/gi, "")),
                _url: "Peticiones.jsp",
                init: function () {
                     $('.masrepuestos').css('display','none');
                    app.costo();
                    app.guardar();
                    $('#fechafinal').datetimepicker({
                        timepicker: false,
                        format: 'Y-m-d'
                    });
                    $('#fechainicio').datetimepicker({
                        timepicker: false,
                        format: 'Y-m-d'
                    });
                    $('.fechafinal-durtar').datetimepicker({
                        timepicker: false,
                        format: 'Y-m-d'
                    });
                    $('.fechainicio-durtar').datetimepicker({
                        timepicker: false,
                        format: 'Y-m-d'
                    });
                    $('.masrepuestos').off('click').on('click', function () {
                        var ultimo = $(this).parents('td').find('.otrosrepuestos').last();
                        $(ultimo).after(app._plantillaRepuestos({repuestos: repsuetos}));
                        $(this).css('display','none');
                        app.costo();
                    });
                    $('#select2-equipos').on('change', function () {
                        var datos = $(this).val().split("//");
                        $('#codigo').val(datos[2]);
                    });

                },
                costo: function () {
                    $('.cantidad').off('change').on('change', function () {
                        var datos = $(this).parents('td').find('#select2-equipos').last().val().split("//");
                        var precio = datos[2];
                        var stock = datos[3];
                        var cantidad = $(this).val();
                        if (parseInt(cantidad) > parseInt(stock)) {
                            app.aalert("Solo existen " + stock + " Unidaddes");
                        }
                        var costo = precio * cantidad;
                        $(this).parents('td').find('.otrosrepuestos').last().attr('costo', costo);
                        var valor = 0;
                        $(this).parents('td').find('.otrosrepuestos').each(function (indice, elemento) {
                            var temp = elemento.getAttribute('costo');
                            valor = valor + parseInt(temp);
                        });
                        $(this).parents('tr').find('#costo').val(valor);
                        $(this).parents('td').find('.masrepuestos').css("display","block");
                    });
                },
                aalert: function (msg) {
                    swal(msg);
                },
                guardar: function () {
                    $('.guardar').off('click').on('click', function () {
                        var ordtrabajo = $('#ordtrabajo').val();
                        var solicita = $('#solicita').val();
                        var fechainicio = $('#fechainicio').val();
                        var fechafinal = $('#fechafinal').val();
                        var emergencia = $('#emergencia').is(":checked");
                        var preventivo = $('#preventivo').is(":checked");
                        var correctivo = $('#correctivo').is(":checked");
                        var mantenimiento = "";
                        if (emergencia) {
                            mantenimiento = "Emergencia";
                        }
                        if (preventivo) {
                            mantenimiento = "Preventivo";
                        }
                        if (correctivo) {
                            mantenimiento = "Correctivo";
                        }
                        var equipo = $('#select2-equipos').val().split('//');
                        var idequipo = equipo[0];
                        var electrico = $('#electrico').is(":checked");
                        var mecanico = $('#mecanico').is(":checked");
                        var electronico = $('#electronico').is(":checked");
                        var diagnostico = $('#diagnostico').val();
                        var tareas = [];
                        $('.tarea').each(function (indice, elemento) {
                            if ($(elemento).find('textarea').val() !== "") {
                                var obj = {};
                                obj.tarea = $(elemento).find('textarea').val();
                                obj.fechainicio = $(elemento).find('#fechainicio-durtar').val();
                                obj.fechafinal = $(elemento).find('#fechafinal-durtar').val();
                                obj.costo = $(elemento).find('#costo').val();
                                var materiales = [];
                                $(elemento).find('.otrosrepuestos').each(function (indice, element) {
                                    var obj2 = {};
                                    var mat = $(element).find('#select2-equipos').val().split('//');
                                    obj2.nombre = mat[1];
                                    obj2.id = mat[0];
                                    obj2.cantidad = $(element).find('#cantidad').val();
                                    materiales.push(obj2);
                                });
                                obj.materiales = materiales;
                                tareas.push(obj);
                            }
                        });
                       var tareas2= JSON.stringify(tareas);
//                       var tareas2= JSON.stringify(tareas).replace('},{', '}-*-{').split('-*-');
                        var params = {
                            proceso: "guardarot",
                            ordtrabajo: ordtrabajo,
                            solicita: solicita,
                            fechainicio: fechafinal,
                            fechafinal: fechainicio,
                            mantenimiento: mantenimiento,
                            idequipo:idequipo,
                            electrico: electrico,
                            electronico: electronico,
                            mecanico: mecanico,
                            diagnostico: diagnostico,
                            tareas: tareas2
                            
                        };
                        $.ajax({
                            url: app._url,
                            data: params,
                            type: 'POST',
                            success: function (data, textStatus, jqXHR) {
                                if (data.ok === true) {
                                    if (data[params.proceso] === true) {
                                        alert('Guardo');
                                    } else {
                                        alert('Lo sentimos no se ha podido guardar');
                                    }
                                } else {
                                    alert(data.errorMsg);
                                }
                            }
                        });

                    });
                }
            };
            $(document).ready(function () {
                app.init();
            });

        </script>
        <%}%>
    </body>
</html>
