<%-- 
    Document   : Indicadores
    Created on : 13/10/2016, 08:48:32 PM
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
        <title> Indicadores</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/jasny-bootstrap.min.css" rel="stylesheet">
        <link href="css/select2.min.css" rel="stylesheet">
        <link href="css/jquery.datetimepicker.css" rel="stylesheet">
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

                    <% Equipo e = new Equipo();
                        List<Equipo> lista = e.listarEquipos();

                    %>
                    <div class="form-group col-lg-5 col-md-5 col-sm-5 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">
                        <label for="fecha">Fecha:(Mes/Año)</label>
                        <input type="text" class="form-control" id="fecha" placeholder="Seleccione cualquier dia del mes para ver inidicador">
                    </div>
                    <div class="form-group col-lg-5 col-md-5 col-sm-5 ">
                        <label  for="select-equipos"><strong>Equipo:</strong></label>
                        <select id="select2-equipos" class="form-control">
                            <option></option>
                            <% for (Equipo eq : lista) {
                            %>
                            <option value="<%=eq.getIdEquipos()%>//<%=eq.getNombre()%>//<%=eq.getCodigo()%>"><%=eq.getNombre()%></option>
                            <% }
                            %>
                        </select>
                    </div>

                </div>
                <div class="row">
                    <div class="form-group col-lg-5 col-md-5 col-sm-5 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">
<!--                        <button type="button" class="btn btn-warning pull-right ver" >
                            Ver OEE
                        </button>-->
                    </div>
                    <div class="form-group col-lg-5 col-md-5 col-sm-5 ">
                        <label for="idequipo">Codigo:</label>
                        <input type="text" class="form-control" id="idequipo" placeholder="" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-11 col-md-11 col-sm-11">
                        <div id="fallasmes">

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-11 col-md-11 col-sm-11">
                        <div id="fallasaño">

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
        <!--<input type="button" value="Imprimir" onclick="javascript:window.print()" />-->
        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jasny-bootstrap.min.js"></script>
        <script src="js/highcharts.js"></script>
        <script src="js/highcharts3d.js"></script>
        <script src="js/select2.min.js"></script>
        <script src="js/underscore.js"></script>
        <script src="js/jquery.datetimepicker.full.js"></script>
        <script>

            var app = {
                _chart: "",
                _chart2: "",
                _url: "Peticiones.jsp",
                datosmes: [9, 8, 7, 6, 5, 6, 7, 5, 6, 9, 8, 7, 6, 7, 8, 7, 6, 5, 9, 8, 7, 6, 5, 7, 9, 8, 7, 9, 10, 8, 6],
                datosaño: [7, 8, 6, 5, 9, 8, 7, 9, 5, 6, 7, 8],
                init: function () {

                    $('#select2-equipos').select2({
                        placeholder: 'Selecciona...'
                    });
                    $('#fecha').datetimepicker({
                        timepicker: false,
                        format: 'm/Y'
                    });

                    app._chart = new Highcharts.Chart({
                        chart: {
                            renderTo: 'fallasmes',
                            type: 'column',
                            options3d: {
                                enabled: true,
                                alpha: 10,
                                beta: 6,
                                depth: 100,
                                viewDistance: 30
                            }
                        },
                        title: {
                            text: 'Disponibilidad'
                        },
                        subtitle: {
                            text: ''
                        },
                        tooltip: {
                            pointFormat: '<span><strong>Dia {point.name}</strong></span>-> <strong><b style="color:red; font-size:16px;">{point.y}</b> </strong> % <br/>'
                        },
                        xAxis: {
                            title: {
                                text: 'Día del Mes'
                            },
                            categories: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]
                        },
                        yAxis: {
                            title: {
                                text: 'Porcentaje %'
                            },
                            plotLines: [{
                                    value: 0,
                                    width: 1,
                                    color: '#808080'
                                }]
                        },
                        plotOptions: {
                            column: {
                                depth: 30
                            }
                        }
                    });
                    app._chart2 = new Highcharts.Chart({
                        chart: {
                            renderTo: 'fallasaño'
                        },
                        title: {
                            text: 'Disponibilidad',
                            x: -20 //center
                        },
                        subtitle: {
                            text: '',
                            x: -20
                        },
                        xAxis: {
                            categories: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                                'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
                        },
                        yAxis: {
                            title: {
                                text: 'Porcentaje %'
                            },
                            plotLines: [{
                                    value: 0,
                                    width: 1,
                                    color: '#808080'
                                }]
                        },
                        tooltip: {
                            valueSuffix: ' %'
                        }
                    });

                    $('.volver').off('click').on('click', function () {
                        document.location.href = "inicio.jsp";
                    });
                    $('#select2-equipos').on('change', function () {
                        var datos = $('#select2-equipos').select2('val').split("//");
                        var id= datos[0];
                        var nombre= datos[1];
                        $('#idequipo').val(datos[2]);
                        var fecha = $('#fecha').val().split("/");
                        var mes = fecha[0];
                        var año = fecha[1];
                        var params = {
                            proceso: "disponibilidad",
                            id: id,
                            mes: mes,
                            anno: año
                        };
                        $.ajax({
                            url: app._url,
                            data: params,
                            type: 'POST',
                            success: function (data, textStatus, jqXHR) {
                                if (data.ok === true) {
                                    if (data[params.proceso] === true) {
                                        var listam = app._chart.series[0];
                                        if (listam !== undefined) {
                                            listam.destroy();
                                        }
                                        var listay = app._chart2.series[0];
                                        if (listay !== undefined) {
                                            listay.destroy();
                                        }
                                        app._chart.addSeries({
                                            name: nombre,
                                            data: data.Mes
                                        });
                                        app._chart2.addSeries({
                                            name: nombre,
                                            data: data.ANNO
                                        });
                                    } else {
                                        alert('Lo sentimos no se ha podido guardar');
                                    }
                                } else {
                                    alert(data.errorMsg);
                                }
                            }
                        });
                    });
//                    $('#fecha').on('change', function () {
//                        var datos = $('#select2-equipos').select2('val').split("//");
//                        var id= datos[0];
//                        var nombre= datos[1];
//                        $('#idequipo').val(datos[2]);
//                        var fecha = $('#fecha').val().split("/");
//                        var mes = fecha[0];
//                        var año = fecha[1];
//                        var params = {
//                            proceso: "OEE",
//                            id: id,
//                            mes: mes,
//                            anno: año
//                        };
//                        $.ajax({
//                            url: app._url,
//                            data: params,
//                            type: 'POST',
//                            success: function (data, textStatus, jqXHR) {
//                                if (data.ok === true) {
//                                    if (data[params.proceso] === true) {
//                                        var listam = app._chart.series[0];
//                                        if (listam !== undefined) {
//                                            listam.destroy();
//                                        }
//                                        var listay = app._chart2.series[0];
//                                        if (listay !== undefined) {
//                                            listay.destroy();
//                                        }
//                                        app._chart.addSeries({
//                                            name: nombre,
//                                            data: data.Mes
//                                        });
//                                        app._chart2.addSeries({
//                                            name: nombre,
//                                            data: data.ANNO
//                                        });
//                                    } else {
//                                        alert('Lo sentimos no se ha podido guardar');
//                                    }
//                                } else {
//                                    alert(data.errorMsg);
//                                }
//                            }
//                        });
//                    });
                    app.ver();
                },
                ver: function () {
//                    $('.ver').off('click').on('click', function () {
//                        var demo =$('#select2-equipos').select2().valueOf();
//                    alert(""+demo);
//                    });
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
