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
        <link href="css/bootstrap-radio.css" rel="stylesheet">
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
                                    <td class="id" data-id="1234">1234</td>
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
                                                <li style="font-size: 20px" class="tiempoosio"><a href="#"><span class="glyphicon glyphicon-alert" aria-hidden="true"></span> Tiempo de ocio</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="id" data-id="32234">32234</td>
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
                                                <li style="font-size: 20px" class="tiempoosio"><a href="#"><span class="glyphicon glyphicon-alert" aria-hidden="true"></span> Tiempo de ocio</a></li>

                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <button type="button" class="btn btn-lg btn-warning volver pull-right" style="font-size: 40px;  margin-top: 30px; margin-right: 30px; padding: 20px">
                Volver
            </button>
        </div>

        <!-- Modal tiempo de osio -->
        <div class="modal fade" id="tiempoosio" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <!--                    <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">Tiempo de Osio </h4>
                                        </div>-->
                    <div class="modal-body">
                        <fieldset>
                                <legend class="text-primary text-center"><strong>Tiempo de Ocio</strong></legend>
                        <div class="row">
                            <div class="form-group col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4">
                                <label for="solicita">Tiempo</label>
                                <input type="number" class="form-control" id="solicita" placeholder="Tiempo en horas">
                            </div>
                        </div>
                        <div class="row">
                            
                                <div class="funkyradio-danger col-lg-3 funkyradio col-md-3 col-sm-3 ">
                                    <input type="radio" name="radio" id="radio1" />
                                    <label  for="radio1"><strong>Emergencia</strong></label>
                                </div>
                                <div class="funkyradio-success col-lg-3 funkyradio col-md-3 col-sm-3">
                                    <input type="radio" name="radio" id="radio2" checked/>
                                    <label  for="radio2"><strong>Preventivo</strong></label>
                                </div>
                                <div class="funkyradio-primary col-lg-3 funkyradio col-md-3 col-sm-3">
                                    <input type="radio" name="radio" id="radio3" />
                                    <label  for="radio3"><strong>Correctivo</strong></label>
                                </div>
                                <div class="funkyradio-warning col-lg-3 funkyradio col-md-3 col-sm-3">
                                    <input type="radio" name="radio" id="radio4" />
                                    <label  for="radio4"><strong>Correctivo</strong></label>
                                </div>
                        </div>
                        </fieldset>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary">Guardar</button>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>

            var app = {
                _Id:"",
                init: function () {
                    $('.agregarmaquina').off('click').on('click', function () {
                        app.popup("FichaTecnica.jsp", 680, 1280);
                    });
                    $('.tiempoosio').off('click').on('click', function () {
                        app._Id = $(this).parents('tr').find('.id').data('id');
                      $('#tiempoosio').modal();
                    });
                    $('.volver').off('click').on('click', function () {
                        document.location.href = "inicio.jsp";
                    });
                },
                popup: function (URL, alto, ancho) {
                    var posicion_x;
                    var posicion_y;
                    posicion_x = (screen.width / 2) - (ancho / 2);
                    posicion_y = 0;
                    window.open(URL, 'popup', 'width=' + 100 % +', height=' + 100 % +', resizable=no, menubar=no, scrollbars=no, status=no, location=no, toolbar=0, left=' + posicion_x + ', top=' + posicion_y + '');
                }
            };
            $(document).ready(function () {
                app.init();
            });
        </script>
    </body>
</html>
