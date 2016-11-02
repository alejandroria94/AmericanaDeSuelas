<%-- 
    Document   : FichaTecnica
    Created on : 6/10/2016, 09:27:13 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="beans.Equipo"%>
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
        <link href="css/select2.min.css" rel="stylesheet">
    </head>
    <body>
        <%
            Usuario u = (Usuario) session.getAttribute("usr");
            if (u == null) {
                out.print("<h1>Debes <strong><a href='index.jsp'>INICIAR SESION</a></strong> para acceder a este servicio</h1>");
            } else {
                String Id = "" + request.getParameter("Id");
                Equipo equ = new Equipo().obtenerEquipo(Id);
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
                                    <input type="text" class="form-control" id="nombre" placeholder="Nombre"  value="<%=equ.getNombre()%>"readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="codigo">Codigo:</label>
                                    <input type="text" class="form-control" id="codigo" placeholder="Codigo"value="<%=equ.getCodigo()%>"readonly>
                                </div>
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="tipo">Tipo:</label>
                                    <input type="text" class="form-control" id="tipomaquina" placeholder="Tipo"value="<%=equ.getTipoEquipo()%>"readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="ubicacion">Ubicación:</label>
                                    <input type="text" class="form-control" id="ubicacion" placeholder="Ubicación"value="<%=equ.getUbicacion()%>"readonly>
                                </div>
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="estado">Estado:</label>
                                    <input type="text" class="form-control" id="estado" placeholder="Estado"value="<%=equ.getEstado()%>"readonly>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <fieldset>
                            <legend class="text-primary"><strong>Datos Del Fabricante</strong></legend>
                            <div class="row">
                                
                                <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                    <label for="modelo">Modelo:</label>
                                    <input type="text" class="form-control" id="modelo" placeholder="Modelo"value="<%=equ.getModelo()%>"readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="marca">Marca:</label>
                                    <input type="text" class="form-control" id="marca" placeholder="Marca"value="<%=equ.getMarca()%>"readonly>
                                </div>
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="serie">Serie:</label>
                                    <input type="text" class="form-control" id="serie" placeholder="Serie"value="<%=equ.getSerie()%>"readonly>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2">
                        <fieldset>
                            <legend class="text-primary"><strong>Imagen</strong></legend>
                            <div class=" col-lg-12 col-md-12 col-sm-12 fileinput fileinput-new" data-provides="fileinput">
                                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%;height: 180px;">
                                    <img src="<%=equ.getImagen()%>">
                                </div>
                                <div>
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
                                    <input type="text" class="form-control" id="peso" placeholder="Peso"value="<%=equ.getPeso()%>"readonly>
                                </div>
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="altura">Altura:</label>
                                    <input type="text" class="form-control" id="altura" placeholder="Altura"value="<%=equ.getAltura()%>"readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="largo">Largo:</label>
                                    <input type="text" class="form-control" id="largo" placeholder="Largo"value="<%=equ.getLargo()%>"readonly>
                                </div>
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="ancho">Ancho:</label>
                                    <input type="text" class="form-control" id="ancho" placeholder="Ancho"value="<%=equ.getAncho()%>"readonly>
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
                                    <input type="text" class="form-control" id="potencia" placeholder="Potencia"value="<%=equ.getPotencia()%>"readonly>
                                </div>
                                <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                    <label for="tipo">Tipo:</label>
                                    <input type="text" class="form-control" id="tipopotencia" placeholder="Tipo"value="<%=equ.getTipoPotencia()%>"readonly>
                                </div>
                                <div class="form-group col-lg-4 col-md-4 col-sm-4">
                                    <label for="control">Control:</label>
                                    <input type="text" class="form-control" id="control" placeholder="Control"value="<%=equ.getControl()%>"readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="frecuencia">Frecuencia:</label>
                                    <input type="text" class="form-control" id="frecuencia" placeholder="Frecuencia"value="<%=equ.getFrecuencia()%>"readonly>
                                </div>
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="alimentacion">Alimentacion:</label>
                                    <input type="text" class="form-control" id="alimentacion" placeholder="Alimentacion"value="<%=equ.getAlimentacion()%>"readonly>
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
                                    <input type="number" class="form-control" id="tiempofuncionamiento" placeholder=""value="<%=equ.getTiempoDeFuncionamiento()%>"readonly>
                                </div>
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="tipo">Horas de Uso:</label>
                                    <input type="number" class="form-control" id="horasuso" placeholder=""value="<%=equ.getHorasDeUso()%>"readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="ambientecorrosivo">Ambiente Corrosivo:</label>
                                    <select id="ambientecorrosivo" class="form-control" disabled>
                                        <option value="No" <%if(!equ.getAmbienteCorrosivo()){%>selected<%}%>>NO</option>
                                        <option value="Si"<%if(equ.getAmbienteCorrosivo()){%>selected<%}%>>SI</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-6 col-md-6 col-sm-6">
                                    <label for="estadopintura">Estado de Pintura:</label>
                                    <input type="text" class="form-control" id="estadopintura" placeholder=""value="<%=equ.getEstadoPintura()%>"readonly>
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
                                            <textarea  class="form-control"id="funciones"  name="funciones" value="" style="width: 100%;" readonly><%=equ.getFunciones()%></textarea>
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
                                            <textarea  class="form-control"id="carateristicasespecificas"  name="carateristicasespecificas" value="" readonly style="width: 100%;" ><%=equ.getCaracteristicasEspecificas()%></textarea>
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
                                    <textarea  class="form-control"id="observaciones"  name="observaciones" value="" style="width: 100%; height: 80px" readonly ><%=equ.getObservaciones()%></textarea>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-lg-offset-9 col-md-3 col-md-offset-9 col-sm-3 col-sm-offset-9">
                        <button type="button" class="cerrar btn  btn-danger col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
                            Cerrar
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
        <script src="js/select2.min.js"></script>
        <script>

            var app = {
                _url: "Peticiones.jsp",
                init: function () {
                    $('.cerrar').off('click').on('click', function (){
                        window.close();
                    });
                    $('#ambientecorrosivo').select2({
                        placeholder: 'Selecciona...'
                    });
                    app.guardar();
                    $('.fileinput').fileinput();
                    $('.cancelar').off('click').on('click', function () {
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
                },
                guardar: function () {
                    $('.guardar').off('click').on('click', function () {
                        var nombre = $('#nombre').val();
                        var codigo = $('#codigo').val();
                        var tipo = $('#tipomaquina').val();
                        var ubicacion = $('#ubicacion').val();
                        var estado = $('#estado').val();
                        var marca = $('#marca').val();
                        var modelo = $('#nombre').val();
                        var serie = $('#modelo').val();
                        var imagen = $('.fileinput').find('img').attr('src');
                        var peso = $('#peso').val();
                        var altura = $('#altura').val();
                        var largo = $('#largo').val();
                        var ancho = $('#ancho').val();
                        var potencia = $('#potencia').val();
                        var tipopotencia = $('#tipopotencia').val();
                        var control = $('#control').val();
                        var frecuencia = $('#frecuencia').val();
                        var alimentacion = $('#alimentacion').val();
                        var tiempofuncionamiento = $('#tiempofuncionamiento').val();
                        var horasuso = $('#horasuso').val();
                        var ambientecorrosivo = $('#ambientecorrosivo').select2('val');
                        if (ambientecorrosivo === "No") {
                            ambientecorrosivo = false;
                        } else {
                            ambientecorrosivo = true;
                        }
                        var estadopintura = $('#estadopintura').val();
                        var funciones = $('#funciones').val();
                        var carateristicasespecificas = $('#carateristicasespecificas').val();
                        var observaciones = $('#observaciones').val();
                        var params = {
                            proceso: "guardar",
                            nombre: nombre,
                            codigo: codigo,
                            tipo: tipo,
                            ubicacion: ubicacion,
                            estado: estado,
                            marca: marca,
                            modelo: modelo,
                            serie: serie,
                            imagen: imagen,
                            peso: peso,
                            altura: altura,
                            largo: largo,
                            ancho: ancho,
                            potencia: potencia,
                            tipopotencia: tipopotencia,
                            control: control,
                            frecuencia: frecuencia,
                            alimentacion: alimentacion,
                            tiempofuncionamiento: tiempofuncionamiento,
                            horasuso: horasuso,
                            ambientecorrosivo: ambientecorrosivo,
                            estadopintura: estadopintura,
                            funciones: funciones,
                            caracteristicas: carateristicasespecificas,
                            observaciones: observaciones
                        };
                        if (app.validar()) {
                            $.ajax({
                                url: app._url,
                                data: params,
                                type: 'POST',
                                success: function (data, textStatus, jqXHR) {
                                    if (data.ok === true) {
                                        if (data[params.proceso] === true) {
                                            app.aalert('Maquina registrada con exito!!');
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
                    var nombre = $('#nombre').val();
                    var codigo = $('#codigo').val();
                    var tipo = $('#tipomaquina').val();
                    var ubicacion = $('#ubicacion').val();
                    var estado = $('#estado').val();
                    var marca = $('#marca').val();
                    var modelo = $('#nombre').val();
                    var serie = $('#modelo').val();
                    var imagen = $('.fileinput').find('img').attr('src');
                    var peso = $('#peso').val();
                    var altura = $('#altura').val();
                    var largo = $('#largo').val();
                    var ancho = $('#ancho').val();
                    var potencia = $('#potencia').val();
                    var tipopotencia = $('#tipopotencia').val();
                    var control = $('#control').val();
                    var frecuencia = $('#frecuencia').val();
                    var alimentacion = $('#alimentacion').val();
                    var tiempofuncionamiento = $('#tiempofuncionamiento').val();
                    var horasuso = $('#horasuso').val();
                    var ambientecorrosivo = $('#ambientecorrosivo').select2('val');
                    var estadopintura = $('#estadopintura').val();
                    var funciones = $('#funciones').val();
                    var caracteristicasespecificas = $('#carateristicasespecificas').val();
                    var observaciones = $('#observaciones').val();
                    if (!/\w/gi.test(nombre)) {
                        alert("Debe digitar el nombre de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(codigo)) {
                        alert("Debe digitar el codigo de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(tipo)) {
                        alert("Debe digitar el tipo de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(ubicacion)) {
                        alert("Debe digitar la ubicacion de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(estado)) {
                        alert("Debe digitar el estado de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(marca)) {
                        alert("Debe digitar la marca de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(modelo)) {
                        alert("Debe digitar el modelo de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(serie)) {
                        alert("Debe digitar la serie de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(peso)) {
                        alert("Debe digitar el peso de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(altura)) {
                        alert("Debe digitar la altura de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(largo)) {
                        alert("Debe digitar el largo de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(ancho)) {
                        alert("Debe digitar el ancho de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(potencia)) {
                        alert("Debe digitar la potencia de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(tipopotencia)) {
                        alert("Debe digitar el tipo de potencia de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(control)) {
                        alert("Debe digitar el control de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(frecuencia)) {
                        alert("Debe digitar la frecuencia de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(alimentacion)) {
                        alert("Debe digitar la alimentacion de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(nombre)) {
                        alert("Debe digitar el nombre de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(nombre)) {
                        alert("Debe digitar el nombre de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(nombre)) {
                        alert("Debe digitar el nombre de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(estadopintura)) {
                        alert("Debe digitar el estado de pintura de la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(funciones)) {
                        alert("Debe digitar las  de funciones la maquina");
                        return false;
                    }
                    if (!/\w/gi.test(caracteristicasespecificas)) {
                        alert("Debe digitar las caracteristicas especificas de la maquina");
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
