<%-- 
    Document   : HojaDeVida
    Created on : 9/10/2016, 10:06:50 AM
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
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <table class="table table-bordered table-condensed table-striped">
                            <thead>
                                <tr>
                                    <th colspan="2" class="bg-info">Nombre</th>
                                    <td colspan="2">wertyuiiuytre</td>
                                    <th style="width: 20%" class="bg-info">Codigo</th>
                                    <td >2345677654</td>
                                </tr>
                                <tr>
                                    <th colspan="2" class="bg-info">Ubicacion</th>
                                    <td colspan="2">ertyuioiuytr</td>
                                    <th class="bg-info">Departamento</th>
                                    <td> asdfghjklñkjhgfd</td>
                                </tr>
                                <tr class="bg-info">
                                    <th style="width: 100px;">Fecha</th>
                                    <th>Orden De Trabajo</th>
                                    <th style="width: 300px">Actividad</th>
                                    <th>Responsable</th>
                                    <th>Repuestos</th>
                                    <th>Costo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>10/10/2016</td>
                                    <td>123455</td>
                                    <td>amsdasasdsjdfksdgsd</td>
                                    <td>aasdfrasdfcvsddffffg</td>
                                    <td>sdffddfgfhfhfghghkjljklfhgfhfhf</td>
                                    <td>12345667</td>
                                </tr>
                                <tr>
                                    <td>10/10/2016</td>
                                    <td>123455</td>
                                    <td>amsdasasdsjdfksdgsd</td>
                                    <td>aasdfrasdfcvsddffffg</td>
                                    <td>sdffddfgfhfhfghghkjljklfhgfhfhf</td>
                                    <td>12345667</td>
                                </tr>
                                <tr>
                                    <td>10/10/2016</td>
                                    <td>123455</td>
                                    <td>amsdasasdsjdfksdgsd</td>
                                    <td>aasdfrasdfcvsddffffg</td>
                                    <td>sdffddfgfhfhfghghkjljklfhgfhfhf</td>
                                    <td>12345667</td>
                                </tr>
                            </tbody>

                        </table>
                    </div>
                </div>

            </div>
        </div>
        <input type="button" value="Imprimir" onclick="javascript:window.print()" />
        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jasny-bootstrap.min.js"></script>
        <script>

            var app = {
                init: function () {
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
