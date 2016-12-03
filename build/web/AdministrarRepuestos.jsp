<%-- 
    Document   : AdministrarFichasTecnicas
    Created on : 9/10/2016, 07:27:52 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="beans.Repuesto"%>
<%@page import="beans.Herramienta"%>
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
        <title>Repuestos</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-radio.css" rel="stylesheet">
        <link href="css/jquery.datetimepicker.css" rel="stylesheet">
        <style>
            .rojoSemaforo{
                background: #ff6e5a;
            }
            .verdeSemaforo{
                background: #8fdf82;
            }

        </style>
    </head>
    <body>
        <%
            Usuario u = (Usuario) session.getAttribute("usr");
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
                    <div class="col-lg-10 col-lg-offset-1">
                        <h1 class="text-info bg-primary text-center">
                            Repuestos
                            <img src="images/logotipo3.png" class="imagen"/>
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <button type="button" class="btn btn-danger pull-right agregarrepuesto">
                            Agregar <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                        </button>
                        <br><br>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <table class="table table-bordered  table-condensed table-responsive">
                            <thead class="bg-info" style="font-size: 15px">
                                <tr>
                                    <th style="width: 180px">Codigo</th>
                                    <th>Nombre</th>
                                    <th>Descripción</th>
                                    <th>Cantidad</th>
                                    <th>Minimo</th>
                                    <th>Precio</th>
                                    <th style="width: 80px">Eliminar</th>
                                    <th style="width: 80px">Agregar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%  Repuesto r = new Repuesto();
                                    List<Repuesto> lista = r.listarRepuestos();
                                    for (Repuesto re : lista) {
                                       
                                %>
                                <tr  <%if(re.getCantidad()<re.getMinimo()){%>class="rojoSemaforo"<%}else{%>class="verdeSemaforo"<%}%>>
                                    <td class="id" data-id="<%=re.getIdRepuestos()%>"><%=re.getCodigo()%></td>
                                    <td><%=re.getNombre()%></td>
                                    <td><%=re.getDescripcion()%></td>
                                    <td class="cant" data-cantidad="<%=re.getCantidad()%>"><%=re.getCantidad()%></td>
                                    <td><%=re.getMinimo()%></td>
                                    <td><%=re.getPrecio()%></td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-danger pull-right eliminar">
                                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                        </button>
                                    </td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-success pull-right sumarepuesto">
                                            <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
                                        </button>
                                    </td>
                                </tr>
                                
                                
                                <%
                                        }
                                    %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <button type="button" class="btn btn-lg btn-warning volver pull-right" style="font-size: 40px;  margin-top: 30px; margin-right: 30px; padding: 20px">
                Volver
            </button>


            <!-- Modal tiempo de ocio -->
            <div class="modal fade" id="sumarepuesto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <fieldset>
                                <legend class="text-primary text-center"><strong>Repuestos</strong></legend>
                                <div class="row">
                                    <div class="form-group col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
                                        <label for="numerorepuestos">Numero de repuestos</label>
                                        <input type="number" class="form-control" id="numerorepuestos" placeholder="Numero de repuestos">
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="repuestosuma btn btn-primary">Guardar</button>
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
                _Id: "",
                _CantResp: "",
                init: function () {
                    app.eliminar();
                    $('.agregarrepuesto').off('click').on('click', function () {
                        app.popup("Repuestos.jsp", 500, 1100);
                    });
                    $('.volver').off('click').on('click', function () {
                        document.location.href = "inicio.jsp";
                    });
                    $('.repuestosuma').off('click').on('click', function () {
                        var numero = $('#numerorepuestos').val();
                        var total = parseInt(app._CantResp) + parseInt(numero);
                        var params = {
                            proceso: "repuestosuma",
                            id: app._Id,
                            total: total
                        };
                        $.ajax({
                            url: app._url,
                            data: params,
                            type: 'POST',
                            success: function (data, textStatus, jqXHR) {
                                if (data.ok === true) {
                                    if (data[params.proceso] === true) {
                                        $('#sumarepuesto').modal('hide');
                                        app.aalert("Guardado con exito!!");
                                        window.location.reload();
                                    } else {
                                        app.aalert('Lo sentimos no se ha podido guardar');
                                    }
                                } else {
                                    alert(data.errorMsg);
                                }
                            }
                        });
                    });
                    $('.sumarepuesto').off('click').on('click', function () {
                        app._Id = $(this).parents('tr').find('.id').data('id');
                        app._CantResp = $(this).parents('tr').find('.cant').data('cantidad');
                        $('#sumarepuesto').modal('show');
                    });
                },
                popup: function (URL, alto, ancho) {
                    var posicion_x;
                    var posicion_y;
                    posicion_x = (screen.width / 2) - (ancho / 2);
                    posicion_y = 0;
                    window.open(URL, 'popup', 'width=' + 100 % +', height=' + 100 % +', resizable=no, menubar=no, scrollbars=no, status=no, location=no, toolbar=0, left=' + posicion_x + ', top=' + posicion_y + '');
                },
                aalert: function (msg) {
                    swal(msg);
                },
                eliminar: function () {
                    $('.eliminar').off('click').on('click', function () {
                        var id = $(this).parents('tr').find('.id').data('id');
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
                                        var params = {
                                            proceso: "eliminarrepuesto",
                                            id: id
                                        };
                                        $.ajax({
                                            url: app._url,
                                            data: params,
                                            type: 'POST',
                                            success: function (data, textStatus, jqXHR) {
                                                if (data.ok === true) {
                                                    if (data[params.proceso] === true) {
                                                        app.aalert("Se ha eliminado con exito!")
                                                        window.location.reload();
                                                    } else {
                                                        app.aalert('Lo sentimos no se ha podido guardar');
                                                    }
                                                } else {
                                                    alert(data.errorMsg);
                                                }
                                            }
                                        });

                                    } else {
                                        swal("Hurray", "Account is not removed!", "error");
                                    }
                                });
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
