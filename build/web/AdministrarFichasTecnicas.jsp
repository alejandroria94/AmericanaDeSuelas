<%-- 
    Document   : AdministrarFichasTecnicas
    Created on : 9/10/2016, 07:27:52 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="java.util.List"%>
<%@page import="beans.Equipo"%>
<%@page import="beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Fichas Tecnicas</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-radio.css" rel="stylesheet">
        <link href="css/jquery.datetimepicker.css" rel="stylesheet">
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
            }
            .imagen{
                width: 20%;
                position: relative;
                margin-right: 0px;
            }
        </style>
        <div class="container-fluid">
            <div class="border">
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <h1 class="text-info bg-primary text-center">
                            Maquinas
                            <img src="images/logotipo3.png" class="imagen"/>
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <button type="button" class="btn btn-danger pull-right agregarmaquina">
                            Agregar <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                        </button>
                        <br><br>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <table class="table table-bordered table-striped table-condensed table-responsive">
                            <thead class="bg-info" style="font-size: 15px">
                                <tr>
                                    <th style="width: 180px">Codigo</th>
                                    <th>Nombre</th>
                                    <th>Ubicación</th>
                                    <th>Modelo</th>
                                    <th>Serie</th>
                                    <th style="width: 120px">Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%  Equipo e = new Equipo();
                                    List<Equipo> lista = e.listarEquipos();
                                    for (Equipo eq : lista) {
                                %>
                                <tr>
                                    <td class="id" data-id="<%=eq.getIdEquipos()%>"><%=eq.getCodigo()%></td>
                                    <td><%=eq.getNombre()%></td>
                                    <td><%=eq.getUbicacion()%></td>
                                    <td><%=eq.getModelo()%></td>
                                    <td ><%=eq.getSerie()%></td>
                                    <td class="text-center">
                                        <div class="btn-group">
                                            <button  style="font-size: 12px" type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> &nbsp;&nbsp;<span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li style="font-size: 20px" class="verhv"><a href="#"><span class="glyphicon glyphicon-eye-open " aria-hidden="true"></span> Ver Hoja de Vida</a></li>
                                                <li style="font-size: 20px" class="ver"><a href="#"><span class="glyphicon glyphicon-eye-open " aria-hidden="true"></span> Ver</a></li>
                                                <li style="font-size: 20px" class="editar"><a href="#"><span class="glyphicon glyphicon-edit " aria-hidden="true"></span> Editar</a></li>
                                                <li style="font-size: 20px" class="eliminar"><a href="#"><span class="glyphicon glyphicon-remove " aria-hidden="true"></span> Elimiar</a></li>
                                                <li style="font-size: 20px" class="tiempoocio"><a href="#"><span class="glyphicon glyphicon-alert" aria-hidden="true"></span> Tiempo de ocio</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <button type="button" class="btn btn-lg btn-warning volver pull-right" style="font-size: 40px;  margin-top: 30px; margin-right: 30px; padding: 20px">
                Volver
            </button>
        </div>

        <!-- Modal tiempo de ocio -->
        <div class="modal fade" id="tiempoocio" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <!--                    <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">Tiempo de Osio </h4>
                                        </div>-->
                    <div class="modal-body">
                        <fieldset>
                            <legend class="text-primary text-center"><strong>Tiempo de Ocio</strong></legend>
                            <div class="row">
                                <div class="form-group col-lg-4 col-lg-offset-2 col-md-4 col-md-offset-2 col-sm-4 col-sm-offset-2">
                                    <label for="fechaTO">Fecha</label>
                                    <input type="text" class="form-control" id="fechaTO" placeholder="Fecha del suceso">
                                </div>
                                <div class="form-group col-lg-4  col-md-4 col-sm-4">
                                    <label for="tiempo">Tiempo</label>
                                    <input type="number" class="form-control" id="tiempo" placeholder="Tiempo en horas">
                                </div>
                            </div>
                            <div class="row">
                                <div class="funkyradio-danger col-lg-3 funkyradio col-md-3 col-sm-3 ">
                                    <input type="radio" name="radio" id="TPA" />
                                    <label  for="TPA"><strong>Parada Planificada</strong></label>
                                </div>
                                <div class="funkyradio-success col-lg-3 funkyradio col-md-3 col-sm-3">
                                    <input type="radio" name="radio" id="TPNP" checked/>
                                    <label  for="TPNP"><strong>Preparacion Equipo</strong></label>
                                </div>
                                <div class="funkyradio-primary col-lg-3 funkyradio col-md-3 col-sm-3">
                                    <input type="radio" name="radio" id="TPOP" />
                                    <label  for="TPOP"><strong>Descanso Operario</strong></label>
                                </div>
                                <div class="funkyradio-warning col-lg-3 funkyradio col-md-3 col-sm-3">
                                    <input type="radio" name="radio" id="TPD" />
                                    <label  for="TPD"><strong>Parada Emergencia</strong></label>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="guardarocio btn btn-primary">Guardar</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.datetimepicker.full.js"></script>
        <script>

            var app = {
                _Id: "",
                _url: "Peticiones.jsp",
                init: function () {
                    app.ver();
                    app.editar();
                    app.eliminar();
                    app.verhv();
                    $('#fechaTO').datetimepicker({
                        timepicker: false,
                        format: 'Y/m/d'
                    });
                    $('.guardarocio').off('click').on('click', function () {
                        var TPA = $('#TPA').is(":checked");
                        var TPNP = $('#TPNP').is(":checked");
                        var TPOP = $('#TPOP').is(":checked");
                        var TPD = $('#TPD').is(":checked");
                        var tiempo = $('#tiempo').val();
                        var fecha = $('#fechaTO').val();
                        var tipo = "";
                        if (TPA) {
                            tipo = "TPA";
                        }
                        if (TPNP) {
                            tipo = "TPNP";
                        }
                        if (TPOP) {
                            tipo = "TPOP";
                        }
                        if (TPD) {
                            tipo = "TPD";
                        }
                        var params = {
                            proceso: "tiempodeocio",
                            id: app._Id,
                            tiempo: tiempo,
                            tipo: tipo,
                            fecha: fecha
                        };
                        $.ajax({
                            url: app._url,
                            data: params,
                            type: 'POST',
                            success: function (data, textStatus, jqXHR) {
                                if (data.ok === true) {
                                    if (data[params.proceso] === true) {
                                        $('#tiempoocio').modal('hide');
                                        app.aalert("Guardado con exito!!");
                                    } else {
                                        app.aalert('Lo sentimos no se ha podido guardar');
                                    }
                                } else {
                                    alert(data.errorMsg);
                                }
                            }
                        });
                    });
                    $('.agregarmaquina').off('click').on('click', function () {
                        app.popup("FichaTecnica.jsp", 680, 1280);
                    });
                    $('.tiempoocio').off('click').on('click', function () {
                        app._Id = $(this).parents('tr').find('.id').data('id');
                        $('#tiempoocio').modal('show');
                    });

                    $('.volver').off('click').on('click', function () {
                        document.location.href = "inicio.jsp";
                    });
                    $('.OEE').off('click').on('click', function () {
                        document.location.href = "Indicadores.jsp";
                    });

                },
                popup: function (URL, alto, ancho) {
                    var posicion_x;
                    var posicion_y;
                    posicion_x = (screen.width / 2) - (ancho / 2);
                    posicion_y = 0;
                    window.open(URL, 'popup', 'width=' + 100 % +', height=' + 100 % +', resizable=no, menubar=no, scrollbars=no, status=no, location=no, toolbar=0, left=' + posicion_x + ', top=' + posicion_y + '');
                },
                ver: function () {
                    $('.ver').off('click').on('click', function () {
                        var id = $(this).parents('tr').find('.id').data('id');
                        app.popup("VerFichaTecnica.jsp?Id=" + id + "", 680, 1280);
                    });
                },
                verhv: function () {
                    $('.verhv').off('click').on('click', function () {
                        var id = $(this).parents('tr').find('.id').data('id');
                        app.popup("HojaDeVida.jsp?Id=" + id + "", 680, 1280);
                    });
                },
                editar: function () {
                    $('.editar').off('click').on('click', function () {
                        var id = $(this).parents('tr').find('.id').data('id');
                        app.popup("EditarFichaTecnica.jsp?Id=" + id + "", 680, 1280);
                    });
                },
                eliminar: function () {
                    $('.eliminar').off('click').on('click', function () {
                        var id = $(this).parents('tr').find('.id').data('id');
                        swal({title: "Esta seguro de continuar!",
                            type: "warning",
                            showCancelButton: true,
                            confirmButtonColor: "#449d44",
                            confirmButtonText: "Aceptar",
                            cancelButtonColor: "#c9302c",
                            cancelButtonText: "Cancelar",
                            closeOnConfirm: true,
                            closeOnCancel: true},
                                function (isConfirm) {
                                    if (isConfirm)
                                    {
                                        var params = {
                                            proceso: "eliminar",
                                            Id: id
                                        };
                                        $.ajax({
                                            url: app._url,
                                            data: params,
                                            type: 'POST',
                                            success: function (data, textStatus, jqXHR) {
                                                if (data.ok === true) {
                                                    if (data[params.proceso] === true) {
                                                        app.aalert("Se ha eliminado con exito!")
                                                        window.location.reload();
                                                    } else {
                                                        app.aalert('Lo sentimos no se ha podido guardar');
                                                    }
                                                } else {
                                                    alert(data.errorMsg);
                                                }
                                            }
                                        });

                                    } else {
                                        swal("Hurray", "Account is not removed!", "error");
                                    }
                                });
                    });
                },
                aalert: function (msg) {
                    swal(msg);
                }
            };
            $(document).ready(function () {
                app.init();
            });
        </script>
        <%}%>
    </body>
</html>
