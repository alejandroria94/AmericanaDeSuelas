<%-- 
    Document   : HojaDeVida
    Created on : 9/10/2016, 10:06:50 AM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="beans.Tarea"%>
<%@page import="beans.OrdenDeTrabajo"%>
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
        <title> Hoja De Vida</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/jasny-bootstrap.min.css" rel="stylesheet">
        <%
//            String casa = "" + request.getParameter("casa");
//            out.println(casa);
//            Usuario u = (Usuario) session.getAttribute("usr");
//            out.println(u.getLogin());
//            out.println(u.getPass());

        %>
    </head>
    <body>
        <%             Usuario u = (Usuario) session.getAttribute("usr");
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
                    <div class="col-lg-10 col-lg-offset-1 text-center">
                        <h1 class="text-info bg-primary">
                            Hoja De Vida
                            <img src="images/logotipo3.png" class="imagen"/>
                        </h1>
                    </div>
                </div>
                <% String id = "" + request.getParameter("Id");
                    Equipo e = new Equipo().obtenerEquipo(id);
                    OrdenDeTrabajo ot = new OrdenDeTrabajo();
                    List<OrdenDeTrabajo> lista = ot.listarOTs(id);

                %>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <table class="table table-bordered table-condensed table-striped">
                            <thead>
                                <tr>
                                    <th colspan="2" class="bg-info">Nombre</th>
                                    <td colspan="2">
                                        <%=e.getNombre()%>
                                    </td>
                                    <th style="width: 20%" class="bg-info">Codigo</th>
                                    <td ><%=e.getCodigo()%></td>
                                </tr>
                                <tr>
                                    <th colspan="2" class="bg-info"> Operario</th>
                                    <td colspan="2">Alexis F. Rodriguez</td>
                                    <th class="bg-info">Departamento</th>
                                    <td> <%=e.getUbicacion()%></td>
                                </tr>
                                <tr class="bg-info">
                                    <th style="width: 100px;">Fecha</th>
                                    <th>Orden De Trabajo</th>
                                    <th>Responsable</th>
                                    <th style="width: 300px">Actividad</th>
                                    <th>Repuestos</th>
                                    <th>Costo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (OrdenDeTrabajo lot : lista) {%>
                                <tr>
                                    <td><%=lot.getFechaInicio()%></td>
                                    <td><%=lot.getIdOrdenesDeTrabajo()%></td>
                                    <td><%=lot.getSolicitante()%></td>
                                    <td><%for (Tarea tr : lot.getListaTareas()) {%>
                                        <%=tr.getNombre()%>
                                        <%}%></td>
                                    <td><%for (Tarea tr : lot.getListaTareas()) {
                                            String Mate = tr.getMateriales();
                                            Mate =Mate.replaceAll("\"", "");
                                            Mate =Mate.replaceAll(":", "=");
                                            Mate =Mate.replaceAll(",", "  ");
                                            Mate =Mate.replaceAll("}]", " ");
                                            Mate =Mate.substring(2);
                                        %>
                                        <%=Mate%>
                                        <%}%></td>
                                    <td><%for (Tarea tr : lot.getListaTareas()) {%>
                                        <%=tr.getCosto()%>
                                        <%}%></td>
                                </tr>
                                <%}%>


                            </tbody>

                        </table>
                    </div>
                </div>

            </div>
        </div>
        <script type="text/template" id="eleccionUnica">   
            <tr>
            <td>23/01/2017</td>
            <td>0095</td>
            <td>Verificar tolerancia de las manijas</td>
            <td>Digney Agudelo</td>
            <td>-----------</td>
            <td>-----------</td>
            </tr>
            <tr>
            <td>27/01/2017</td>
            <td>0096</td>
            <td>Cambio de correas</td>
            <td>Digney Agudelo</td>
            <td>Correas</td>
            <td>30.000</td>
            </tr>
        </script> 

        <input type="button" value="Imprimir" onclick="javascript:window.print()"  class="btn btn-warning pull-right" style="margin-right: 20px;"/>
        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/underscore-1.8.min.js"></script>
        <script src="js/jasny-bootstrap.min.js"></script>
        <script>

            var app = {
                _plantillaOt: _.template($('#asignaturas').html().replace(/\n/gi, "")),
                init: function () {
                    $('#select2-equipos').on('change', function () {
                        var datos = $('#select2-equipos').val().split("//");
                        $('#codigo').val(datos[2]);
                        $('tbody').appendTo(app._plantillaOt);
                    });
                },
                popup: function (URL, alto, ancho) {
                    var posicion_x;
                    var posicion_y;
                    posicion_x = (screen.width / 2) - (ancho / 2);
                    posicion_y = 0;
                    window.open(URL, 'popup', 'width=' + ancho + ', height=' + alto + ', resizable=no, menubar=no, scrollbars=no, status=no, location=no, toolbar=0, left=' + posicion_x + ', top=' + posicion_y + '');
                }
            };
            $(document).ready(function () {
                app.init();
            });
        </script>
        <%}%>
    </body>
</html>
