<%-- 
    Document   : Herramientas
    Created on : 14/10/2016, 08:38:57 AM
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
        <title> Proveedores</title>
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
                    <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 text-center">
                        <h1 class="text-info bg-primary">
                            Proveedores
                            <img src="images/logotipo3.png" class="imagen"/>
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-sm-4 col-sm-offset-1">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" placeholder="">
                    </div>
                    <div class="form-group col-lg-4 col-md-4 col-sm-4 ">
                        <label for="direccion">Direccion:</label>
                        <input type="text" class="form-control" id="direccion" placeholder="">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-sm-4 col-sm-offset-1">
                        <label for="telefono">Telefono:</label>
                        <input type="text" class="form-control" id="telefono" placeholder="">
                    </div>
                    <div class="form-group col-lg-4 col-md-4 col-sm-4 ">
                        <label for="correo">Correo:</label>
                        <input type="text" class="form-control" id="correo" placeholder="">
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
        <!--<input type="button" value="Imprimir" onclick="javascript:window.print()" />-->
        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jasny-bootstrap.min.js"></script>
        <script>

            var app = {
                _url: "Peticiones.jsp",
                init: function () {
                    $('.cancelar').off('click').on('click', function () {
                        window.close();
                    });
                    app.guardar();
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
                        var direccion = $('#direccion').val();
                        var nombre = $('#nombre').val();
                        var telefono = $('#telefono').val();
                        var correo = $('#correo').val();
                        var params = {
                            proceso: "guardaproveedor",
                            nombre: nombre,
                            direccion: direccion,
                            telefono: telefono,
                            correo: correo
                        };
                        if (app.validar()) {
                            $.ajax({
                                url: app._url,
                                data: params,
                                type: 'POST',
                                success: function (data, textStatus, jqXHR) {
                                    if (data.ok === true) {
                                        if (data[params.proceso] === true) {
                                            app.aalert('Guardo');
                                            $('#direccion').val("");
                                            $('#nombre').val("");
                                            $('#telefono').val("");
                                            $('#correo').val("");
                                            window.opener.location.reload();
                                        } else {
                                            app.aalert('Lo sentimos no se ha podido guardar');
                                        }
                                    } else {
                                        alert(data.errorMsg);
                                    }
                                }
                            });
                        }
                    });
                },
                aalert: function (msg) {
                    swal(msg);
                },
                validar: function () {
                    var direccion = $('#direccion').val();
                    var nombre = $('#nombre').val();
                    if (!/\w/gi.test(direccion)) {
                        app.aalert("Debe digitar el nombre ");
                        return false;
                    }
                    if (!/\w/gi.test(nombre)) {
                        app.aalert("Debe digitar el codigo de la maquina");
                        return false;
                    }
                    
                    return true;
                }
            };
            $(document).ready(function () {
                app.init();
            });
        </script>
        <%}%>
    </body>
</html>
