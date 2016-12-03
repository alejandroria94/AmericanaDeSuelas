<%-- 
    Document   : HojaDeVida
    Created on : 9/10/2016, 10:06:50 AM
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
        <title> Mantenimiento</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/jasny-bootstrap.min.css" rel="stylesheet">
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
                            Mantenimiento
                            <img src="images/logotipo3.png" class="imagen"/>
                        </h1>
                    </div>
                </div>
                <% Equipo e = new Equipo();
                    List<Equipo> lista = e.listarEquipos();

                %>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <table class="table table-bordered table-condensed table-striped">
                            <thead>
                                <tr>
                                    <th  class="bg-info">Maquina</th>
                                    <td >
                                        <select id="select2-equipos" class="form-control">
                                            <option></option>
                                            <% for (Equipo eq : lista) {
                                            %>
                                            <option value="<%=eq.getIdEquipos()%>//<%=eq.getNombre()%>//<%=eq.getCodigo()%>"><%=eq.getNombre()%></option>
                                            <% }
                                            %>
                                        </select>
                                    </td>
                                    <th  class="bg-info">Codigo</th>
                                    <td  >
                                        <input type="text" class="form-control" id="codigo" placeholder="Codigo">
                                    </td>
                                </tr>
                                <tr>
                                    <th  class="bg-info"> Operario</th>
                                    <td >
                                        <input type="text" class="form-control" id="operario" placeholder="Operario">
                                    </td>
                                    <th class="bg-info" >Departamento</th>
                                    <td > 
                                        <input type="text" class="form-control" id="departamento" placeholder="Departamento">
                                    </td>
                                </tr>
                                <tr class="bg-info">
                                    <th >Fecha</th>
                                    <th  >Parte del Equipo</th>
                                    <th >Actividades</th>
                                    <th >Frecuencia</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td >
                                        <input type="text" class="form-control" id="fecha" placeholder="Fecha">
                                    </td>
                                    <td>
                                        <textarea  class="form-control"id="partes"  name="descripcion" value="" style="width: 100%; height: 80px" ></textarea>
                                    </td>
                                    <td >
                                        <textarea  class="form-control"id="actividades"  name="descripcion" value="" style="width: 100%; height: 80px" ></textarea>
                                    </td>
                                    <td >
                                        <input type="text" class="form-control" id="frecuencia" placeholder="Frecuencia">
                                    </td>
                                </tr>

                            </tbody>

                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-lg-offset-8 col-md-3 col-md-offset-8 col-sm-3 col-sm-offset-8">
                        <button type="button" class="cancelar btn  btn-default col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
                            Cancelar
                        </button>
                        <button type="button" class="guardar btn  btn-success col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
                            Guardar
                        </button>
                    </div>
                </div>
                <br>


            </div>
        </div>
        <input type="button" value="Imprimir" onclick="javascript:window.print()"  class="btn btn-warning pull-right" style="margin-right: 20px;"/>
        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jasny-bootstrap.min.js"></script>
        <script src="js/jquery.datetimepicker.full.js"></script>
        <script>

            var app = {
                _url: "Peticiones.jsp",
                init: function () {
                    app.guardar();
                    $('#fecha').datetimepicker({
                        timepicker: false,
                        format: 'Y-m-d'
                    });
                    $('#select2-equipos').on('change', function () {
                        var datos = $('#select2-equipos').val().split("//");
                        $('#codigo').val(datos[2]);
                    });
                    $('.cancelar').off('click').on('click', function () {
                        window.close();
                    });
                },
                popup: function (URL, alto, ancho) {
                    var posicion_x;
                    var posicion_y;
                    posicion_x = (screen.width / 2) - (ancho / 2);
                    posicion_y = 0;
                    window.open(URL, 'popup', 'width=' + ancho + ', height=' + alto + ', resizable=no, menubar=no, scrollbars=no, status=no, location=no, toolbar=0, left=' + posicion_x + ', top=' + posicion_y + '');
                },
                guardar: function () {
                    $('.guardar').off('click').on('click', function () {
                        var datos = $('#select2-equipos').val().split("//");
                        var id = datos[0];
                        var operario = $('#operario').val();
                        var nombre = datos[1];
                        var codigo = $('#codigo').val();
                        var frecuencia = $('#frecuencia').val();
                        var departamento = $('#departamento').val();
                        var fecha = $('#fecha').val();
                        var partes = $('#partes').val();
                        var actividades = $('#actividades').val();
                        var params = {
                            proceso: "guardarmantenimiento",
                            id: id,
                            operario: operario,
                            frecuencia: frecuencia,
                            departamento: departamento,
                            fecha: fecha,
                            partes: partes,
                            actividades: actividades,
                            codigo: codigo,
                            nombre: nombre
                        };
                        $.ajax({
                            url: app._url,
                            data: params,
                            type: 'POST',
                            success: function (data, textStatus, jqXHR) {
                                if (data.ok === true) {
                                    if (data[params.proceso] === true) {
                                        app.aalert("Guardo");
                                        window.opener.location.reload();
                                        window.close();
                                    } else {
                                        app.aalert('Lo sentimos no se ha podido guardar');
                                    }
                                } else {
                                    alert(data.errorMsg);
                                }
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
