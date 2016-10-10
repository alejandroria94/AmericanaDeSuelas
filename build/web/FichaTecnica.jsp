<%-- 
    Document   : FichaTecnica
    Created on : 6/10/2016, 09:27:13 PM
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
        <title>Ficha Tecnica</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/jasny-bootstrap.min.css" rel="stylesheet">
        
    </head>
    <body>
        <%
                Usuario u = (Usuario)session.getAttribute("usr");
                if(u==null){
                    out.print("<h1>Debes <strong><a href='index.jsp'>INICIAR SESION</a></strong> para acceder a este servicio</h1>");
                }else{
                
                
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
        <div class="container-fluid"><%-- inicio container fluid --%>
            <div class="border">
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1 col-md-10 col-sm-10 col-md-offset-1 col-sm-offset-1 text-center">
                        <h1 class="text-info bg-primary">
                            Ficha Técnica
                            <img src="images/logotipo3.png" class="imagen"/>
                        </h1>
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-sm-4 col-sm-offset-1">
                        <fieldset>
                            <legend class="text-primary"><strong>Datos Del Equipo</strong></legend>
                            <div class="row">
                                <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                    <label for="nombre">Nombre:</label>
                                    <input type="text" class="form-control" id="nombre" placeholder="Nombre">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="codigo">Codigo:</label>
                                    <input type="text" class="form-control" id="codigo" placeholder="Codigo">
                                </div>
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="tipo">Tipo:</label>
                                    <input type="text" class="form-control" id="tipo" placeholder="Tipo">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="ubicacion">Ubicación:</label>
                                    <input type="text" class="form-control" id="ubicacion" placeholder="Ubicación">
                                </div>
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="estado">Estado:</label>
                                    <input type="text" class="form-control" id="estado" placeholder="Estado">
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <fieldset>
                            <legend class="text-primary"><strong>Datos Del Fabricante</strong></legend>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="marca">Marca:</label>
                                    <input type="text" class="form-control" id="marca" placeholder="Marca">
                                </div>
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="modelo">Modelo:</label>
                                    <input type="text" class="form-control" id="modelo" placeholder="Modelo">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="serie">Serie:</label>
                                    <input type="text" class="form-control" id="serie" placeholder="Serie">
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2">
                        <fieldset>
                            <legend class="text-primary"><strong>Imagen</strong></legend>
                            <div class=" col-lg-12 col-md-12 col-sm-12 fileinput fileinput-new" data-provides="fileinput">
                                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%;height: 180px;"></div>
                                <div>
                                    <span class="btn btn-default btn-file"><span class="fileinput-new">Seleccionar</span><span class="fileinput-exists">Cambiar</span><input type="file" name="..."></span>
                                    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Quitar</a>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
                        <fieldset>
                            <legend class="text-primary"><strong>Caracteristicas Fisicas</strong></legend>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="peso">Peso:</label>
                                    <input type="text" class="form-control" id="peso" placeholder="Peso">
                                </div>
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="altura">Altura:</label>
                                    <input type="text" class="form-control" id="altura" placeholder="Altura">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="largo">Largo:</label>
                                    <input type="text" class="form-control" id="largo" placeholder="Largo">
                                </div>
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="ancho">Ancho:</label>
                                    <input type="text" class="form-control" id="ancho" placeholder="Ancho">
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col-lg-5 col-md-5 col-sm-5">
                        <fieldset>
                            <legend class="text-primary"><strong>Caracteristicas Tecnicas</strong></legend>
                            <div class="row">
                                <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                    <label for="potencia">Potencia:</label>
                                    <input type="text" class="form-control" id="potencia" placeholder="Potencia">
                                </div>
                                <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                    <label for="tipo">Tipo:</label>
                                    <input type="text" class="form-control" id="tipo" placeholder="Tipo">
                                </div>
                                <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                    <label for="control">Control:</label>
                                    <input type="text" class="form-control" id="control" placeholder="Control">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="frecuencia">Frecuencia:</label>
                                    <input type="text" class="form-control" id="frecuencia" placeholder="Frecuencia">
                                </div>
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="alimentacion">Alimentacion:</label>
                                    <input type="text" class="form-control" id="alimentacion" placeholder="Alimentacion">
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
                        <fieldset>
                            <legend class="text-primary"><strong>Condiciones de Trabajo</strong></legend>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="codigo">Tiempo Funcionamiento:</label>
                                    <input type="text" class="form-control" id="codigo" placeholder="">
                                </div>
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="tipo">Horas de Uso:</label>
                                    <input type="text" class="form-control" id="tipo" placeholder="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="ubicacion">Ambiente Corrosivo:</label>
                                    <input type="text" class="form-control" id="ubicacion" placeholder="">
                                </div>
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="estado">Estado de Pintura:</label>
                                    <input type="text" class="form-control" id="estado" placeholder="">
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col-lg-5 col-md-5  col-sm-5 ">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <fieldset>
                                    <legend class="text-primary"><strong>Funciones</strong></legend>
                                    <div class="row">
                                        <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                            <textarea  class="form-control"id="funciones"  name="funciones" value="" style="width: 100%;" ></textarea>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <fieldset>
                                    <legend class="text-primary"><strong>Caracteristicas Especificas</strong></legend>
                                    <div class="row">
                                        <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                            <textarea  class="form-control"id="carateristicasespecificas"  name="carateristicasespecificas" value="" style="width: 100%;" ></textarea>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1">
                        <fieldset>
                            <legend class="text-primary"><strong>Observaciones</strong></legend>
                            <div class="row">
                                <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                    <textarea  class="form-control"id="observaciones"  name="observaciones" value="" style="width: 100%; height: 80px" ></textarea>
                                </div>
                            </div>
                        </fieldset>
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
                <br><br>

            </div>
        </div><%-- fin container fluid --%>
         <!--<input type="button" value="Imprimir" onclick="javascript:window.print()" />-->
        <script src="js/jquery-3.1.1.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jasny-bootstrap.min.js"></script>
        <script>

            var app = {
                init: function () {
                     $('.fileinput').fileinput();
                     $('.cancelar').off('click').on('click', function (){
                        window.close();
                        window.opener.location.reload();
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
