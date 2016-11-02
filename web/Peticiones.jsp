<%-- 
    Document   : PeticionesCalendario
    Created on : 14/07/2016, 02:29:23 PM
    Author     : Andres

--%>


<%@page import="beans.Repuesto"%>
<%@page import="beans.Herramienta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="beans.Equipo"%>
<%@page import="beans.TiempoOcio"%>
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
        "guardar",
        "editar",
        "eliminar",
        "OEE",
        "tiempodeocio",
        "guardaherramineta",
        "eliminarherramienta",
        "guardarepuesto",
        "eliminarrepuesto",});

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
            e.setUbicacion(ubicacion);
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
        } else if (proceso.equals("editar")) {
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
            String Id = "" + request.getParameter("id");

            Equipo e = new Equipo();
            e.setIdEquipos(Integer.parseInt(Id));
            e.setCodigo(codigo);
            e.setNombre(nombre);
            e.setTipoEquipo(tipo);
            e.setMarca(marca);
            e.setModelo(modelo);
            e.setUbicacion(ubicacion);
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
            if (e.actualizarrEquipo()) {
                respuesta += ",\"" + proceso + "\": true";
            } else {
                respuesta += ",\"" + proceso + "\": false";
            }
        } else if (proceso.equals("tiempodeocio")) {
            String Id = "" + request.getParameter("id");
            String Tiempo = "" + request.getParameter("tiempo");
            String Tipo = "" + request.getParameter("tipo");
            String Fecha = "" + request.getParameter("fecha");

            Equipo e = new Equipo();
            if (e.agregarTiempoDeOcio(Id, Tiempo, Tipo, Fecha)) {
                respuesta += ",\"" + proceso + "\": true";
            } else {
                respuesta += ",\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
            String Id = "" + request.getParameter("Id");

            Equipo e = new Equipo();
            if (e.borrarEquipo(Id)) {
                respuesta += ",\"" + proceso + "\": true";
            } else {
                respuesta += ",\"" + proceso + "\": false";
            }
        } else if (proceso.equals("OEE")) {
            String Id = "" + request.getParameter("id");
            String Mes = "" + request.getParameter("mes");
            String Anno = "" + request.getParameter("anno");
            Equipo e = new Equipo();
            List<TiempoOcio> mes = e.listaMes(Id, Mes, Anno);
            List<TiempoOcio> anno = e.listaAnno(Id, Anno);
            List<Float> tiempomes = new ArrayList<>();
            List<Float> tiempoanno = new ArrayList<>();
            for (TiempoOcio to : anno) {
                tiempoanno.add(to.getoEE());
            }
            for (TiempoOcio to : mes) {
                tiempomes.add(to.getoEE());
            }
            respuesta += ",\"" + proceso + "\": true";
            respuesta = respuesta + ",\"Mes\":" + new Gson().toJson(tiempomes);
            respuesta = respuesta + ",\"ANNO\":" + new Gson().toJson(tiempoanno);
        } else if (proceso.equals("guardaherramineta")) {
            String Codigo = "" + request.getParameter("codigo");
            String Nombre = "" + request.getParameter("nombre");
            String Cantidad = "" + request.getParameter("cantidad");
            String Descripcion = "" + request.getParameter("descripcion");
            Herramienta h = new Herramienta();
            h.setCodigo(Codigo);
            h.setNombre(Nombre);
            h.setCantidad(Integer.parseInt(Cantidad));
            h.setDescripcion(Descripcion);
            if (h.guardarHerramienta()) {
                respuesta += ",\"" + proceso + "\": true";
            } else {
                respuesta += ",\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminarherramienta")) {
            String Id = "" + request.getParameter("id");

            Herramienta h = new Herramienta();
            if (h.borrarHerramienta(Id)) {
                respuesta += ",\"" + proceso + "\": true";
            } else {
                respuesta += ",\"" + proceso + "\": false";
            }
        } else if (proceso.equals("guardarepuesto")) {
            String Codigo = "" + request.getParameter("codigo");
            String Nombre = "" + request.getParameter("nombre");
            String Cantidad = "" + request.getParameter("cantidad");
            String Precio = "" + request.getParameter("precio");
            String Minimo = "" + request.getParameter("minimo");
            String Descripcion = "" + request.getParameter("descripcion");
            Repuesto r = new Repuesto();
            r.setNombre(Nombre);
            r.setCantidad(Integer.parseInt(Cantidad));
            r.setDescripcion(Descripcion);
            r.setPrecio(Float.parseFloat(Precio));
            r.setMinimo(Integer.parseInt(Minimo));
            r.setCodigo(Codigo);
            if (r.guardarRepuesto()) {
                respuesta += ",\"" + proceso + "\": true";
            } else {
                respuesta += ",\"" + proceso + "\": false";
            }
        } else if (proceso.equals("")) {

        } else if (proceso.equals("")) {

        } else if (proceso.equals("")) {

        } else if (proceso.equals("")) {

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
