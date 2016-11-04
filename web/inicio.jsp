<%-- 
    Document   : inicio
    Created on : 8/10/2016, 10:16:57 PM
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
        <title>Americana de suelas</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="Expires" content="0" /> 
        <meta http-equiv="Pragma" content="no-cache" />
        <script type="text/javascript">

        </script>
    </head>
    <body>
        <%
            String logeo = "" + request.getParameter("logeo");
            Usuario u = (Usuario) session.getAttribute("usr");
            if (logeo.equals("true")) {

            }
            if (u == null) {
                out.print("<h1>Debes <strong><a href='index.jsp'>INICIAR SESION</a></strong> para acceder a este servicio</h1>");
            } else {
        %>
        <style>
            .fondo{
                position: absolute;
                background-image: url(images/fondoinicio.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                background-position-y: -30px;
            }
            .cajamenu{
                border-radius: 100%;
                border: 5px solid #0044cc;
                margin-top: 10%;
                margin-left: 35%; 
                font-size: 35px;
                width: 500px;
                height: 500px;
                padding-top: 12%;
                background: rgba(255,255,255,0.7);
            }
            .horizontal{
                margin-top: 25%;
                font-size: 45px;
            }
           
        </style>

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 fondo" style="width: 100%; height: 100%">
                    <div class="horizontal">

                        <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1" style="border: 2px solid #0044cc; padding: 10px; border-radius: 5px;background: rgba(255,255,255,0.8)">
                            <div class="btn-group col-lg-4 col-md-4">
                                <button style="width: 100%" class="btn btn-primary btn-lg dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Mantenimiento <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" style="font-size: 25px">
                                    <li><a href="AdministrarFichasTecnicas.jsp">Máquina</a></li>
                                    <li class="verindicadores"><a href="#">Indicadores de Gestión</a>
                                        <div class="indicadores" hidden>
                                            <ul style="font-size: 25px; list-style: none;">
                                                <li><a href="IndicadorOEE.jsp">Indicador OEE</a></li>
                                                <li><a href="IndicadorDisponibilidad.jsp">Disponiblilidad</a></li>
                                                <li><a href="IndicadorConfiabilidad.jsp">Confiabilidad</a></li>
                                                <li><a href="IndicadorAccidentabilidad.jsp">Accidentabilidad</a></li>
                                                <li><a href="IndicadorMantenibilidad.jsp">Mantenibilidad</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li><a href="#">Tiempo de Operación</a></li>
                                    <li class="ordentrabajo"><a href="#">Orden de Trabajo</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">Informes</a></li>
                                </ul>
                            </div>
                            <div class="btn-group col-lg-4 col-md-4">
                                <button style="width: 100%" class="btn btn-danger btn-lg alarma" type="button">
                                    Alarma 
                                </button>
                            </div>
                            <div class="btn-group col-lg-4 col-md-4">
                                <button style="width: 100%" class="btn btn-success btn-lg dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Almacen <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" style="font-size: 25px">
                                    <li><a href="#">Proveedores</a></li>
                                    <li><a href="#">Producción</a></li>
                                    <li><a href="AdministrarRepuestos.jsp">Repuestos</a></li>
                                    <li><a href="AdministrarHerramientas.jsp">Herramientas</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="btn btn-lg btn-warning salir" style="font-size: 40px; position: relative; float: right; margin-top: 30px; margin-right: 30px; padding: 20px">
                        Salir
                    </button>
                </div>
            </div>
        </div>
        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>

            var app = {
                init: function () {
                    app.nobackbutton();
                    
                    $('.salir').off('click').on('click', function () {
                        swal({title: "Esta seguro de continuar?",
                            type: "warning",
                            showCancelButton: true,
                            confirmButtonColor: "#449d44",
                            confirmButtonText: "Aceptar",
                            cancelButtonText: "Cancelar",
                            closeOnConfirm: true,
                            closeOnCancel: true},
                                function (isConfirm) {
                                    if (isConfirm)
                                    {
                                        app.abrir("index.jsp");
                                    }
                                });
                    });
                    $('.verindicadores').mouseover( function (){
                        $('.indicadores').slideDown(1000);
                    });
//                    $('.verindicadores').mouseout( function (){
//                        $('.indicadores').slideUp(1000);
//                    });
                       
                    
                    $('.fichatecnica').off('click').on('click', function () {
                        app.abrir("index.jsp");
                    });
                    $('.ordentrabajo').off('click').on('click', function () {
                        app.popup("OrdenDeTrabajo.jsp", 650, 1300);
                    });
                    $('.alarma').off('click').on('click', function () {
                        app.popup("Alertas.jsp", 650, 1300);
                    });
                    $('.repuestos').off('click').on('click', function () {
                        app.popup("Repuestos.jsp", 500, 900);
                    });
                },
                nobackbutton: function () {
                    window.location.hash = "no-back-button";
                    window.location.hash = "Again-No-back-button"; //chrome
                    window.onhashchange = function () {
                        window.location.hash = "no-back-button";
                    };

                },
                popup: function (URL, alto, ancho) {
                    var posicion_x;
                    var posicion_y;
                    posicion_x = (screen.width / 2) - (ancho / 2);
                    posicion_y = 0;
                    window.open(URL, 'popup', 'width=' + ancho + ', height=' + alto + ', resizable=no, menubar=no, scrollbars=no, status=no, location=no, toolbar=0, left=' + posicion_x + ', top=' + posicion_y + '');
                },
                abrir: function (URL) {
                    window.location = (URL);
                }
            };
            $(document).ready(function () {
                app.init();
            });
        </script>
        <%}%>
    </body>
</html>
