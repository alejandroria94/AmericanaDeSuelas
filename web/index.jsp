<%-- 
Document   : index
Created on : 7/10/2016, 10:35:46 PM
Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Inicio</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <style>
            .fondo{
                position: absolute;
                background-image: url(images/fondo.png);
                background-repeat: no-repeat;
                background-size: cover;
            }
            .botonlogin{
                margin-left: 43%;
                margin-top: 25%;
                font-size: 35px;
            }
        </style>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 fondo" style="width: 100%; height: 100%">
                    <!--<img src="images/fondo.png" height="780px" width="100%" style="position: relative;"/>-->
                    <button type="button" data-toggle="modal" data-target=".bs-example-modal-sm" class="btn btn-lg btn-danger botonlogin">
                        Iniciar Sesion
                    </button>
                </div>
            </div>
            <!-- Modal cambio prueba-->
            <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content col-lg-10 col-lg-offset-1 col-md-10 col-sm-10 col-md-offset-1 col-sm-offset-1">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h2 class="modal-title text-center" id="gridSystemModalLabel">Login</h2>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-12">
                                <label for="usr">Username</label>
                                <input type="text" class="form-control" id="usr" placeholder="">
                            </div>
                        </div> 
                        <div class="row">
                            <div class="form-group col-lg-12">
                                <label for="pass">Password</label>
                                <input type="password" class="form-control" id="pass" placeholder="">
                            </div>
                        </div> 
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary col-lg-12 login">Login</button>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>

            var app = {
                _url: "Peticiones.jsp",
                init: function () {
                    app.nobackbutton();
                    $('.login').off('click').on('click', function () {
                        var usr = $('#usr').val();
                        var pass = $('#pass').val();
                        var params = {
                            usr: usr,
                            pass: pass,
                            proceso: "login"
                        };
                        $.ajax({
                            url: app._url,
                            data: params,
                            type: 'POST',
                            success: function (data, textStatus, jqXHR) {
                                if (data.ok === true) {
                                    if (data[params.proceso] === true) {
                                        window.location = "inicio.jsp?logeo=true";
                                    } else {
                                        app.aalert("Lo sentimos, por favor verifique sus datos");
                                    }
                                } else {
                                    app.aalert('Lo sentimos ha ocurrido un error interno, por favor comuniquese con su administrador');
                                }
                            }
                        });

                    });
                },
                nobackbutton: function () {
                    window.location.hash = "no-back-button";
                    window.location.hash = "Again-No-back-button"; //chrome
                    window.onhashchange = function () {
                        window.location.hash = "no-back-button";
                    };

                },
                aalert: function (msg) {
                    swal(msg);
                },
                confirmacion: function () {
                    swal({title: "Esta seguro de continuar!",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#449d44",
                        confirmButtonText: "Aceptar",
                        cancelButtonColor: "#c9302c",
                        cancelButtonText: "Cancelar",
                        closeOnConfirm: true,
                        closeOnCancel: true},
                            function (isConfirm) {
                                if (isConfirm)
                                {
                                    swal("Account Removed!", "Your account is removed permanently!", "success");
                                } else {
                                    swal("Hurray", "Account is not removed!", "error");
                                }
                            });
                }
            };
            $(document).ready(function () {
                app.init();
            });
        </script>
    </body>
</html>
