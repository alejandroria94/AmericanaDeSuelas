<%-- 
    Document   : PeticionesCalendario
    Created on : 14/07/2016, 02:29:23 PM
    Author     : Andres

--%>


<%@page import="beans.Equipo"%>
<%@page import="beans.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%-- Beans de aplicación aquí --%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "login",
        "guardar",});

    // Si el usuario tiene sesión válida y permisos.
    String proceso = "" + request.getParameter("proceso");
    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // ---------------------------------Proceso 1--------------------------------- //
        if (proceso.equals("registrarproducto")) {
            // --------------------------------Proceso 2---------------------------------- //
        } else if (proceso.equals("login")) {
            String login = "" + request.getParameter("usr");
            String pass = "" + request.getParameter("pass");
            Usuario u = new Usuario();
            if (u.validarLogin(login, pass)) {
                session.setAttribute("usr", u);
                respuesta += ",\"" + proceso + "\": true";
            } else {
                u = null;
                session.setAttribute("usr", u);
                respuesta += ",\"" + proceso + "\": false";
            }
        } else if (proceso.equals("guardar")) {
            String nombre = "" + request.getParameter("nombre");
            String codigo = "" + request.getParameter("codigo");
            String tipo = "" + request.getParameter("tipo");
            String ubicacion = "" + request.getParameter("ubicacion");
            String estado = "" + request.getParameter("estado");
            String marca = "" + request.getParameter("marca");
            String modelo = "" + request.getParameter("modelo");
            String serie = "" + request.getParameter("serie");
            String imagen = "" + request.getParameter("imagen");
            String peso = "" + request.getParameter("peso");
            String altura = "" + request.getParameter("altura");
            String largo = "" + request.getParameter("largo");
            String ancho = "" + request.getParameter("ancho");
            String potencia = "" + request.getParameter("potencia");
            String tipopotencia = "" + request.getParameter("tipopotencia");
            String control = "" + request.getParameter("control");
            String frecuencia = "" + request.getParameter("frecuencia");
            String alimentacion = "" + request.getParameter("alimentacion");
            String tiempofuncionamiento = "" + request.getParameter("tiempofuncionamiento");
            String horasuso = "" + request.getParameter("horasuso");
            String ambientecorrosivo = "" + request.getParameter("ambientecorrosivo");
            String estadopintura = "" + request.getParameter("estadopintura");
            String funciones = "" + request.getParameter("funciones");
            String caracteristicasespecificas = "" + request.getParameter("caracteristicas");
            String observaciones = "" + request.getParameter("observaciones");

            Equipo e = new Equipo();
            e.setCodigo(codigo);
            e.setNombre(nombre);
            e.setTipoEquipo(tipo);
            e.setMarca(marca);
            e.setModelo(modelo);
            e.setUbicación(ubicacion);
            e.setEstado(estado);
            e.setSerie(serie);
            e.setPeso(peso);
            e.setAltura(altura);
            e.setLargo(largo);
            e.setAncho(ancho);
            e.setPotencia(potencia);
            e.setTipoPotencia(tipopotencia);
            e.setFrecuencia(frecuencia);
            e.setAlimentacion(alimentacion);
            e.setAmbienteCorrosivo(Boolean.parseBoolean(ambientecorrosivo));
            e.setTiempoDeFuncionamiento(Float.parseFloat(tiempofuncionamiento));
            e.setHorasDeUso(Float.parseFloat(horasuso));
            e.setFunciones(funciones);
            e.setCaracteristicasEspecificas(caracteristicasespecificas);
            e.setObservaciones(observaciones);
            e.setControl(control);
            e.setEstadoPintura(estadopintura);
            e.setImagen(imagen);
            if (e.guardarEquipo()) {
                respuesta += ",\"" + proceso + "\": true";
            } else {
                respuesta += ",\"" + proceso + "\": false";
            }
        } else if (proceso.equals("producto")) {
        } else if (proceso.equals("actualizastock")) {
        } else if (proceso.equals("venta")) {

        } else if (proceso.equals("actalizafactura")) {
        } else if (proceso.equals("devolucion")) {

        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }

    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>
