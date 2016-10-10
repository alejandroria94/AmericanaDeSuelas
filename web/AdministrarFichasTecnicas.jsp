<%-- 
    Document   : AdministrarFichasTecnicas
    Created on : 9/10/2016, 07:27:52 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Fichas Tecnicas</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
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
                    <div class="col-lg-10 col-lg-offset-1">
                        <h1 class="text-info bg-primary text-center">
                            Maquinas
                            <img src="images/logotipo3.png" class="imagen"/>
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <button type="button" class="btn btn-danger pull-right agregarmaquina">
                            Agregar <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                        </button>
                        <br><br>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <table class="table table-bordered table-striped table-condensed table-responsive">
                            <thead class="bg-info" style="font-size: 15px">
                                <tr>
                                    <th style="width: 180px">Codigo</th>
                                    <th>Ubicación</th>
                                    <th>Marca</th>
                                    <th>Modelo</th>
                                    <th>Serie</th>
                                    <th style="width: 120px">Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td class="text-center">
                                        <div class="btn-group">
                                            <button  style="font-size: 12px" type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> &nbsp;&nbsp;<span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li style="font-size: 20px"><a href="#"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> Ver</a></li>
                                                <li style="font-size: 20px"><a href="#"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> Editar</a></li>
                                                <li style="font-size: 20px"><a href="#"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Elimiar</a></li>

                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td class="text-center">
                                        <div class="btn-group">
                                            <button  style="font-size: 12px" type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> &nbsp;&nbsp;<span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li style="font-size: 20px"><a href="#"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> Ver</a></li>
                                                <li style="font-size: 20px"><a href="#"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> Editar</a></li>
                                                <li style="font-size: 20px"><a href="#"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Elimiar</a></li>

                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
              <button type="button" class="btn btn-lg btn-warning salir" style="font-size: 40px; position: relative; float: right; margin-top: 30px; margin-right: 30px; padding: 20px">
                        Salir
                    </button>
        </div>
        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>

            var app = {
                init: function () {
                    $('.agregarmaquina').off('click').on('click', function (){
                        app.popup("FichaTecnica.jsp",680,1280);
                    });
                },
                popup: function (URL, alto, ancho) {
                    var posicion_x;
                    var posicion_y;
                    posicion_x = (screen.width / 2) - (ancho / 2);
                    posicion_y = 0;
                    window.open(URL, 'popup', 'width=' + 100% + ', height=' + 100% + ', resizable=no, menubar=no, scrollbars=no, status=no, location=no, toolbar=0, left=' + posicion_x + ', top=' + posicion_y + '');
                }
            };
            $(document).ready(function () {
                app.init();
            });
        </script>
    </body>
</html>
