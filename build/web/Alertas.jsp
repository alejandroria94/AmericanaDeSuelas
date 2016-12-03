<%-- 
    Document   : Alertas
    Created on : 8/10/2016, 09:00:01 AM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.List"%>
<%@page import="beans.Mantenimiento"%>
<%@page import="beans.Usuario"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Alertas</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="Fullcalendar/fullcalendar.css" rel="stylesheet">
        <link href="Fullcalendar/fullcalendar.min.css" rel="stylesheet">

    </head>
    <body>
        <%
            Usuario u = (Usuario) session.getAttribute("usr");
            if (u == null) {
                out.print("<h1>Debes <strong><a href='../index.jsp'>INICIAR SESION</a></strong> para acceder a este servicio</h1>");
            } else {

        %>
        <style>
            .fc-content{
                font-weight: bold;
                height: 30px;
            }
            .imagen{
                width: 20%;
                position: relative;
                margin-right: 0px;
            }
        </style>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h1 class="text-info bg-primary">
                        Modulo de Alertas
                        <img src="images/logotipo3.png" class="imagen"/>
                    </h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-2 col-lg-offset-1">
                    <h3><label>Actividades</label></h3>
                </div>
                <div class="col-lg-4">
                    <h3><span class="label label-success col-lg-4">Realizadas</span></h3>
                    <h3><span class="label label-danger col-lg-4">Vencidas</span></h3>
                    <h3><span class="label label-warning col-lg-4">Pendientes</span></h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <hr>
                    <div id="calendar"></div>
                </div>
            </div>
            <hr><hr>
        </div>
        <%            Mantenimiento m = new Mantenimiento();
            List<Mantenimiento> lista = m.listarMantenimientos();
            JsonArray mantenimientos = new JsonArray();
            JsonObject jo;
            for (Mantenimiento ma : lista) {
                jo = new JsonObject();
                jo.addProperty("id", ma.getIdEquipos());
                jo.addProperty("title", ma.getActividades());
                jo.addProperty("start", ma.getFecha());
                jo.addProperty("descripcion", ma.getNombre()+"--"+ma.getActividades());
                if (ma.getEstado().equals("Pendiente")) {
                    jo.addProperty("backgroundColor", "#f0ad4e");
                    jo.addProperty("borderColor", "#f0ad4e");
                }
                if (ma.getEstado().equals("Realizado")) {
                    jo.addProperty("backgroundColor", "#5cb85c");
                    jo.addProperty("borderColor", "#5cb85c");
                }
                if (ma.getEstado().equals("Vencido")) {
                    jo.addProperty("backgroundColor", "#d9534f");
                    jo.addProperty("borderColor", "#d9534f");
                }
                mantenimientos.add(jo);
            }
        %>
        <script src="Fullcalendar/moment.min.js"></script>
        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="Fullcalendar/fullcalendar.js"></script>
        <script>
            var Mantenimientos = <%=mantenimientos%>;
            var alertas = {
                init: function () {

                    $('#calendar').fullCalendar({
                        header: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'month,basicWeek,basicDay'
                        },
                        events: Mantenimientos,
                        eventRender: function (calEvent, element) {
                            $(element).off('click').on('click', function () {
                                alertas.aalert(calEvent.descripcion);
                            });
                        }

                    });
                }, aalert: function (msg) {
                    swal(msg);
                }
            };
            $(document).ready(function () {
                alertas.init();
            });
        </script>
        <%}%>
    </body>
</html>
