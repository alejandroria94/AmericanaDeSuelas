<%-- 
    Document   : AdministrarFichasTecnicas
    Created on : 9/10/2016, 07:27:52 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="beans.Mantenimiento"%>
<%@page import="beans.Proveedor"%>
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
        <title>Mantenimiento</title>
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
                            Mantenimiento
                            <img src="images/logotipo3.png" class="imagen"/>
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <button type="button" class="btn btn-danger pull-right agregarmantenimineto">
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
                                    <th style="width: 80px">Codigo</th>
                                    <th style="width: 130px">Fecha</th>
                                    <th>Nombre Equipo</th>
                                    <th>Parte Equipo</th>
                                    <th>Actividad</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    Mantenimiento m = new Mantenimiento();
                                    List<Mantenimiento> lista = m.listarMantenimientos();
                                    for (Mantenimiento ma : lista) {
                                %>
                                <tr>
                                    <td class="id" data-id="<%=ma.getIdMantenimiento()%>"><%=ma.getCodigo()%></td>
                                    <td><%=ma.getFecha()%></td>
                                    <td><%=ma.getNombre()%></td>
                                    <td><%=ma.getPartesDelEquipo()%></td>
                                    <td><%=ma.getActividades()%></td>
                                    <td>
                                        <select id="estado" class="estado form-control">
                                            <option value="<%=ma.getEstado()%>"><%=ma.getEstado()%></option>
                                            <%if (ma.getEstado().equals("Pendiente")) {%>
                                            <option value="Realizado">Realizado</option>
                                            <option value="Vencido">Vencido</option>
                                            <%}%>
                                            <%if (ma.getEstado().equals("Vencido")) {%>
                                            <option value="Realizado">Realizado</option>
                                            <option value="Pendiente">Pendiente</option>
                                            <%}%>
                                            <%if (ma.getEstado().equals("Realizado")) {%>
                                            <option value="Pendiente">Pendiente</option>
                                            <option value="Vencido">Vencido</option>
                                            <%}%>
                                        </select>

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
                    $('.agregarmantenimineto').off('click').on('click', function () {
                        app.popup("Mantenimiento.jsp", 500, 300);
                    });
                    $('.volver').off('click').on('click', function () {
                        document.location.href = "inicio.jsp";
                    });
                    app.estado();
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
                estado: function () {
                    $('.estado').on('change', function () {
                        var id = $(this).parents('tr').find('.id').data('id');
                        var estado = $(this).val();
                        var params = {
                            proceso: "estadomantenimiento",
                            id: id,
                            estado: estado
                        };
                        $.ajax({
                            url: app._url,
                            data: params,
                            type: 'POST',
                            success: function (data, textStatus, jqXHR) {
                                if (data.ok === true) {
                                    if (data[params.proceso] === true) {
                                        window.location.reload();
                                    } else {
                                        app.aalert('Lo sentimos no se ha podido guardar');
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
