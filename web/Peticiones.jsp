<%-- 
    Document   : PeticionesCalendario
    Created on : 14/07/2016, 02:29:23 PM
    Author     : Andres

--%>


<%@page import="beans.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%-- Beans de aplicación aquí --%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "login",});

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
                u=null;
                session.setAttribute("usr", u);
                respuesta += ",\"" + proceso + "\": false";
            }
        } else if (proceso.equals("clientefactura")) {
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
