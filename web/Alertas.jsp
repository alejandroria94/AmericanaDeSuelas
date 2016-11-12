<%-- 
    Document   : Alertas
    Created on : 8/10/2016, 09:00:01 AM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

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
        <script src="Fullcalendar/moment.min.js"></script>
        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="Fullcalendar/fullcalendar.js"></script>
        <script>

            var alertas = {
                init: function () {

                    $('#calendar').fullCalendar({
                        header: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'month,basicWeek,basicDay'
                        },
                        events: [
                            {
                                title: 'Actividad de Matenimiento',
                                start: '2016-11-08',
                                backgroundColor: "#f0ad4e",
                                borderColor: "#f0ad4e"
                            },
                            {
                                title: 'Actividad de Matenimiento',
                                start: '2016-11-02',
                                backgroundColor: "#5cb85c",
                                borderColor: "#5cb85c"
                            },
                            {
                                title: 'Actividad de Matenimiento',
                                start: '2016-11-05',
                                backgroundColor: "#d9534f",
                                borderColor: "#d9534f"
                            },
                            {
                                title: 'Actividad de Matenimiento',
                                start: '2016-11-19',
                                backgroundColor: "#f0ad4e",
                                borderColor: "#f0ad4e"
                            }],
                        eventRender: function (calEvent, element) {
                            $(element).off('click').on('click', function () {
                                alertas.aalert(calEvent.title);
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
