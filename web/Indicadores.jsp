<%-- 
    Document   : Indicadores
    Created on : 13/10/2016, 08:48:32 PM
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
        <title> Indicadores</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/jasny-bootstrap.min.css" rel="stylesheet">
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
                            Indicadores
                            <img src="images/logotipo3.png" class="imagen"/>
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5 col-md-5 col-sm-5 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">

                    </div>
                    <div class="form-group col-lg-5 col-md-5 col-sm-5 ">
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
                </div>
                <div class="row">
                    <div class="col-lg-5 col-md-5 col-sm-5 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">

                    </div>
                    <div class="form-group col-lg-5 col-md-5 col-sm-5 ">
                        <label for="fechainicio">Codigo:</label>
                        <input type="text" class="form-control" id="fechainicio" placeholder="">
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div id="fallasaño">

                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 ">
                        <div id="fallasmes">

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-md-10 col-sm-10 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">
                        <button type="button" class="btn btn-lg btn-warning pull-right volver" >
                            Volver
                        </button>
                    </div>

                </div>

            </div>
        </div>
        <input type="button" value="Imprimir" onclick="javascript:window.print()" />
        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jasny-bootstrap.min.js"></script>
        <script src="js/highcharts.js"></script>
        <script>

            var app = {
                init: function () {
                    $('.volver').off('click').on('click', function () {
                        document.location.href = "inicio.jsp";
                    });
                    $('#fallasaño').highcharts({
                        title: {
                            text: 'Indicador de maquinas',
                            x: -20 //center
                        },
                        subtitle: {
                            text: 'Indicador',
                            x: -20
                        },
                        xAxis: {
                            categories: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                                'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
                        },
                        yAxis: {
                            title: {
                                text: '# Fallas'
                            },
                            plotLines: [{
                                    value: 0,
                                    width: 1,
                                    color: '#808080'
                                }]
                        },
                        tooltip: {
                            valueSuffix: ' Fallas'
                        },
                        series: [{
                                name: 'Máquina 1',
                                data: [7, 6, 9, 14, 18, 21, 25, 26, 23, 18, 13, 9]
                            }]
                    });
                    $('#fallasmes').highcharts({
                        chart: {
                            type: 'column'
                        },
                        title: {
                            text: 'Indicador de maquinas'
                        },
                        subtitle: {
                            text: 'Indicadores'
                        },
                        xAxis: {
                            type: 'category',
                            title: {
                                text: 'Dias del mes'
                            },
                            labels: {
                                rotation: -45,
                                style: {
                                    fontSize: '13px',
                                    fontFamily: 'Verdana, sans-serif'
                                }
                            }
                        },
                        yAxis: {
                            min: 0,
                            title: {
                                text: '# Fallas'
                            }
                        },
                        legend: {
                            enabled: false
                        },
                        tooltip: {
                            pointFormat: '<span><strong>Dia {point.name}</strong></span>-> <strong><b style="color:red; font-size:16px;">{point.y}</b> </strong> Fallas<br/>'
                        },
                        series: [{
//                                colorByPoint: true, 
                                name: 'Fallas',
                                data: [
                                    ['1', 23],
                                    ['2', 16],
                                    ['3', 14],
                                    ['4', 14],
                                    ['5', 12],
                                    ['6', 12],
                                    ['7', 11],
                                    ['8', 11],
                                    ['9', 1],
                                    ['10', 6],
                                    ['11', 8],
                                    ['12', 0],
                                    ['13', 1],
                                    ['14', 4],
                                    ['15', 5],
                                    ['16', 9],
                                    ['17', 11],
                                    ['18', 23],
                                    ['19', 5],
                                    ['20', 7],
                                    ['21', 3],
                                    ['22', 4],
                                    ['23', 7],
                                    ['24', 1],
                                    ['25', 9],
                                    ['26', 10],
                                    ['27', 6],
                                    ['28', 0],
                                    ['29', 3],
                                    ['30', 8],
                                    ['31', 12]

                                ],
                                dataLabels: {
                                    enabled: true,
                                    rotation: -90,
                                    color: '#FFFFFF',
                                    align: 'right',
                                    y: 10, // 10 pixels down from the top
                                    style: {
                                        fontSize: '12px',
                                        fontFamily: 'Verdana, sans-serif'
                                    }
                                }
                            }]
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
