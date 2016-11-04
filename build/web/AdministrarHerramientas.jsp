<%-- 
    Document   : AdministrarFichasTecnicas
    Created on : 9/10/2016, 07:27:52 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="beans.Herramienta"%>
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
        <title>Herramientas</title>
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
                            Herramientas
                            <img src="images/logotipo3.png" class="imagen"/>
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <button type="button" class="btn btn-danger pull-right agregarherramienta">
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
                                    <th>Descripción</th>
                                    <th>Cantidad</th>
                                    <th style="width: 80px">Eliminar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%  Herramienta h = new Herramienta();
                                    List<Herramienta> lista = h.listarHErramientas();
                                    for (Herramienta he : lista) {
                                %>
                                <tr>
                                    <td class="id" data-id="<%=he.getIdherramientas()%>"><%=he.getCodigo()%></td>
                                    <td><%=he.getNombre()%></td>
                                    <td><%=he.getDescripcion()%></td>
                                    <td><%=he.getCantidad()%></td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-danger pull-right eliminar">
                                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                        </button>
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



        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.datetimepicker.full.js"></script>
        <script>

            var app = {
                _url: "Peticiones.jsp",
                init: function () {
                    app.eliminar();
                    $('.agregarherramienta').off('click').on('click', function () {
                        app.popup("Herramientas.jsp", 500, 900);
                    });
                     $('.volver').off('click').on('click', function () {
                        document.location.href = "inicio.jsp";
                    });
                },
                popup: function (URL, alto, ancho) {
                    var posicion_x;
                    var posicion_y;
                    posicion_x = (screen.width / 2) - (ancho / 2);
                    posicion_y = 0;
                    window.open(URL, 'popup', 'width=' + 100 % +', height=' + 100 % +', resizable=no, menubar=no, scrollbars=no, status=no, location=no, toolbar=0, left=' + posicion_x + ', top=' + posicion_y + '');
                },
                aalert: function (msg) {
                    swal(msg);
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
                                            proceso: "eliminarherramienta",
                                            id: id
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
                }
            };
            $(document).ready(function () {
                app.init();
            });
        </script>
        <%}%>
    </body>
</html>
