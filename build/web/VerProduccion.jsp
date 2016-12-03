<%-- 
    Document   : Herramientas
    Created on : 14/10/2016, 08:38:57 AM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="beans.Produccion"%>
<%@page import="beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title> Produccion</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/jasny-bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%             Usuario u = (Usuario) session.getAttribute("usr");
            if (u == null) {
                out.print("<h1>Debes <strong><a href='index.jsp'>INICIAR SESION</a></strong> para acceder a este servicio</h1>");
            } else {
                String Id = "" + request.getParameter("Id");
                Produccion p= new Produccion().obtenerProduccion(Id);
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
                            Produccion
                            <img src="images/logotipo3.png" class="imagen"/>
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" value="<%=p.getNombre()%>" readonly>
                    </div>
                    <div class="form-group col-lg-5 col-md-5 col-sm-5 ">
                        <div class=" col-lg-12 col-md-12 col-sm-12 fileinput fileinput-new" data-provides="fileinput">
                            <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%;height: 180px;">
                                 <img src="<%=p.getImagen()%>">
                            </div>
                            <div>
                                <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Quitar</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1">
                        <label for="descripcion">Descripcion:</label>
                        <textarea  class="form-control"id="descripcion"  name="descripcion" value="" style="width: 100%; height: 80px" ><%=p.getDescripcion()%></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-lg-offset-8 col-md-3 col-md-offset-8 col-sm-3 col-sm-offset-8">
                        <button type="button" class=" cancelar btn  btn-warning col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
                            Salir
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
                }
            };
            $(document).ready(function () {
                app.init();
            });
        </script>
        <%}%>
    </body>
</html>
