/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.YearMonth;
import java.util.ArrayList;

/**
 *
 * @author Fido
 */
public class Equipo {

    private int idEquipos;
    private String nombre;
    private String codigo;
    private String tipoEquipo;
    private String marca;
    private String modelo;
    private String ubicacion;
    private String estado;
    private String serie;
    private String peso;
    private String altura;
    private String largo;
    private String ancho;
    private String potencia;
    private String tipoPotencia;
    private String frecuencia;
    private String alimentacion;
    private int ambienteCorrosivo;
    private float tiempoDeFuncionamiento;
    private float horasDeUso;
    private String funciones;
    private String caracteristicasEspecificas;
    private String observaciones;
    private String control;
    private String estadoPintura;
    private String imagen;
    private ArrayList<OrdenDeTrabajo> listaOrdenesDeTrabajo;
    private ArrayList<Equipo> listaDeEquipos;

    public Equipo() {
//        this.nombre = "";
//        this.codigo = "";
//        this.tipoEquipo = "";
//        this.marca = "";
//        this.modelo = "";
//        this.ubicacion = "";
//        this.estado = "";
//        this.serie = "";
//        this.peso = "";
//        this.altura = "";
//        this.largo = "";
//        this.ancho = "";
//        this.potencia = "";
//        this.tipoPotencia = "";
//        this.frecuencia = "";
//        this.alimentacion = "";
//        this.ambienteCorrosivo = 0;
//        this.tiempoDeFuncionamiento = (float) 0.1;
//        this.horasDeUso = (float) 0.1;
//        this.funciones = "";
//        this.caracteristicasEspecificas = "";
//        this.observaciones = "";
//        this.control = "";
//        this.estadoPintura = "";
//        this.imagen = "";

    }

    public boolean guardarEquipo() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sentencia = "INSERT INTO Equipos(nombre, tipoEquipo, marca, modelo, ubicacion, estado, serie, peso, altura, largo, ancho, potencia, tipoPotencia, frecuencia, alimentacion, ambienteCorrosivo, tiempoDeFuncionamiento, horasDeUso, funciones, caracteristicasEspecificas, observaciones, control, estadoPintura, imagen,codigo) "
                + " VALUES ( '" + this.nombre + "','" + this.tipoEquipo + "','" + this.marca + "','" + this.modelo + "','" + this.ubicacion + "','" + this.estado + "','" + this.serie + "','" + this.peso + "','" + this.altura + "','" + this.largo + "','"
                + this.ancho + "','" + this.potencia + "','" + this.tipoPotencia + "','" + this.frecuencia + "','" + this.alimentacion + "','" + this.ambienteCorrosivo + "','" + this.tiempoDeFuncionamiento + "','" + this.horasDeUso + "','" + this.funciones + "','"
                + this.caracteristicasEspecificas + "','" + this.observaciones + "','" + this.control + "','" + this.estadoPintura + "','" + this.imagen + "','" + this.codigo + "');  ";
        if (conexion.setAutoCommitBD(false)) {
            boolean inserto = conexion.insertarBD(sentencia);
            if (inserto) {
                conexion.commitBD();
                exito = true;
            } else {
                conexion.rollbackBD();
            }
        }
        return exito;
    }

    public boolean actualizarrEquipo(String idEquipos, String nombre, String tipoEquipo, String marca, String modelo, String ubicacion, String estado, String serie,
            String peso, String altura, String largo, String ancho, String potencia, String tipoPotencia, String frecuencia,
            String alimentacion, boolean ambienteCorrosivo, float tiempoDeFuncionamiento, float horasDeUso, String funciones, String caracteristicasEspecificas,
            String observaciones, String control, String estadoPintura, String imagen, String codigo) {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        if (conexion.setAutoCommitBD(false)) {
            //UPDATE table_name
            //SET column1=value1,column2=value2,...
            //WHERE some_column=some_value;
            int ambienteCorrosivo1 = 0;
            if (ambienteCorrosivo) {
                ambienteCorrosivo1 = 1;
            }
            String sql2 = "UPDATE `Equipos` SET nombre='" + nombre + "',tipoEquipo='" + tipoEquipo + "',marca='" + marca
                    + "',modelo='" + modelo + "',ubicacion='" + ubicacion + "',estado='" + estado + "',serie='" + serie
                    + "',peso='" + peso + "',altura='" + altura + "',largo='" + largo + "',ancho='" + ancho
                    + "',potencia='" + potencia + "',tipoPotencia='" + tipoPotencia + "',frecuencia='" + frecuencia + "',alimentacion='" + alimentacion
                    + "',ambienteCorrosivo='" + ambienteCorrosivo1 + "',tiempoDeFuncionamiento='" + tiempoDeFuncionamiento + "',horasDeUso='" + horasDeUso + "',funciones='" + funciones
                    + "',caracteristicasEspecificas='" + caracteristicasEspecificas + "',observaciones='" + observaciones + "',control='" + control + "',estadoPintura='" + estadoPintura
                    + "',imagen='" + imagen + "',codigo='" + codigo
                    + "' WHERE `idEquipos`='" + idEquipos + "'";
            boolean borro2 = conexion.actualizarBD(sql2);
            if (borro2) {
                conexion.commitBD();
                exito = true;
            } else {
                conexion.rollbackBD();
            }
        }
        return exito;
    }

    public boolean actualizarrEquipo() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        if (conexion.setAutoCommitBD(false)) {
            //UPDATE table_name
            //SET column1=value1,column2=value2,...
            //WHERE some_column=some_value;
            String sql2 = "UPDATE `Equipos` SET nombre='" + this.nombre + "',tipoEquipo='" + this.tipoEquipo + "',marca='" + this.marca
                    + "',modelo='" + this.modelo + "',ubicacion='" + this.ubicacion + "',estado='" + this.estado + "',serie='" + this.serie
                    + "',peso='" + this.peso + "',altura='" + this.altura + "',largo='" + this.largo + "',ancho='" + this.ancho
                    + "',potencia='" + this.potencia + "',tipoPotencia='" + this.tipoPotencia + "',frecuencia='" + this.frecuencia + "',alimentacion='" + this.alimentacion
                    + "',ambienteCorrosivo='" + this.ambienteCorrosivo + "',tiempoDeFuncionamiento='" + this.tiempoDeFuncionamiento + "',horasDeUso='" + this.horasDeUso + "',funciones='" + this.funciones
                    + "',caracteristicasEspecificas='" + this.caracteristicasEspecificas + "',observaciones='" + this.observaciones + "',control='" + this.control + "',estadoPintura='" + this.estadoPintura
                    + "',imagen='" + this.imagen + "',codigo='" + this.codigo
                    + "' WHERE `idEquipos`='" + this.idEquipos + "'";
            boolean borro2 = conexion.actualizarBD(sql2);
            if (borro2) {
                conexion.commitBD();
                exito = true;
            } else {
                conexion.rollbackBD();
            }
        }
        return exito;
    }

    public boolean borrarEquipo(String idEquipos) {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        if (conexion.setAutoCommitBD(false)) {
//            String sql = "DELETE FROM `comentarios` WHERE `NoIdent`='"+NoIdent+"'";
//            boolean borro = conexion.borrarBD(sql);
            String sql2 = "DELETE FROM `Equipos` WHERE `idEquipos`='" + idEquipos + "'";
            boolean borro2 = conexion.borrarBD(sql2);
            if (borro2) {
                conexion.commitBD();
                exito = true;
            } else {
                conexion.rollbackBD();
            }
        }
        return exito;
    }

    public Equipo llenarDatosObjetoEquipo(ResultSet rs) throws SQLException {
        Equipo e = null;

        if (rs.next()) {
            e = new Equipo();
            e.setIdEquipos(Integer.parseInt(rs.getString("idEquipos")));
            e.setNombre(rs.getString("nombre"));
            e.setCodigo(rs.getString("codigo"));
            e.setTipoEquipo(rs.getString("tipoEquipo"));
            e.setMarca(rs.getString("marca"));
            e.setModelo(rs.getString("modelo"));
            e.setUbicacion(rs.getString("ubicacion"));
            e.setEstado(rs.getString("estado"));
            e.setSerie(rs.getString("serie"));
            e.setPeso(rs.getString("peso"));
            e.setAltura(rs.getString("altura"));
            e.setLargo(rs.getString("largo"));
            e.setAncho(rs.getString("ancho"));
            e.setPotencia(rs.getString("potencia"));
            e.setTipoPotencia(rs.getString("tipoPotencia"));
            e.setFrecuencia(rs.getString("frecuencia"));
            e.setAlimentacion(rs.getString("alimentacion"));
            e.setAmbienteCorrosivo(rs.getBoolean("ambienteCorrosivo"));
            e.setTiempoDeFuncionamiento(rs.getFloat("tiempoDeFuncionamiento"));
            e.setHorasDeUso(rs.getFloat("horasDeUso"));
            e.setFunciones(rs.getString("funciones"));
            e.setCaracteristicasEspecificas(rs.getString("caracteristicasEspecificas"));
            e.setObservaciones(rs.getString("observaciones"));
            e.setControl(rs.getString("control"));
            e.setEstadoPintura(rs.getString("estadoPintura"));
            e.setImagen(rs.getString("imagen"));
        }

        return e;
    }

    public ArrayList<Equipo> listarEquipos() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        Equipo e;
        this.listaDeEquipos = new ArrayList<>();
        String sql = "select * from Equipos";
        ResultSet rs = conexion.consultarBD(sql);
        while (rs.next()) {
            e = new Equipo();
            e.setIdEquipos(Integer.parseInt(rs.getString("idEquipos")));
            e.setNombre(rs.getString("nombre"));
            e.setCodigo(rs.getString("codigo"));
            e.setTipoEquipo(rs.getString("tipoEquipo"));
            e.setMarca(rs.getString("marca"));
            e.setModelo(rs.getString("modelo"));
            e.setUbicacion(rs.getString("ubicacion"));
            e.setEstado(rs.getString("estado"));
            e.setSerie(rs.getString("serie"));
            e.setPeso(rs.getString("peso"));
            e.setAltura(rs.getString("altura"));
            e.setLargo(rs.getString("largo"));
            e.setAncho(rs.getString("ancho"));
            e.setPotencia(rs.getString("potencia"));
            e.setTipoPotencia(rs.getString("tipoPotencia"));
            e.setFrecuencia(rs.getString("frecuencia"));
            e.setAlimentacion(rs.getString("alimentacion"));
            e.setAmbienteCorrosivo(rs.getBoolean("ambienteCorrosivo"));
            e.setTiempoDeFuncionamiento(rs.getFloat("tiempoDeFuncionamiento"));
            e.setHorasDeUso(rs.getFloat("horasDeUso"));
            e.setFunciones(rs.getString("funciones"));
            e.setCaracteristicasEspecificas(rs.getString("caracteristicasEspecificas"));
            e.setObservaciones(rs.getString("observaciones"));
            e.setControl(rs.getString("control"));
            e.setEstadoPintura(rs.getString("estadoPintura"));
            e.setImagen(rs.getString("imagen"));
            listaDeEquipos.add(e);
        }
        return this.listaDeEquipos;
    }

    /**
     *
     * @param idEquipo retorna null Si la consulta no es exitosa,si es exitosa
     * retorna un objeto con los datos de la busqueda
     * @return
     * @throws java.sql.SQLException
     */
    public Equipo obtenerEquipo(String idEquipo) throws SQLException {
        ResultSet datosE = buscarEquipo("idEquipos", idEquipo);
        Equipo e = llenarDatosObjetoEquipo(datosE);
        return e;
    }

    /**
     *
     * @param parametro
     * @param busqueda recibe una columna para busqueda en la tabla (Parametro)
     * y un valor de busqueda (busqueda) retorna un objeto ResultSet con los
     * datos de la consulta
     * @return
     */
    public ResultSet buscarEquipo(String parametro, String busqueda) {
        ConexionBD conexion = new ConexionBD();
        ResultSet datosE = conexion.consultarBD("select * from Equipos where " + parametro + "='" + busqueda + "'");
        return datosE;
    }

    /**
     *
     * @param idEquipos
     * @param tiempo
     * @param tipo TPA(parada planificada) TPNP(preparacion equipo)
     * TPOP(descanso operadores) TPD(parada de emergencia)
     * @return
     */
    public boolean agregarTiempoDeOcio(String idEquipos, String tiempo, String tipo) {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sentencia = "INSERT INTO tiemposocio(Equipos_idEquipos,tiempo,tipo,fecha) "
                + " VALUES ( '" + idEquipos + "','" + tiempo + "','" + tipo + "',CURDATE());";
        if (conexion.setAutoCommitBD(false)) {
            boolean inserto = conexion.insertarBD(sentencia);
            if (inserto) {
                conexion.commitBD();
                exito = true;
            } else {
                conexion.rollbackBD();
            }
        }
        return exito;
    }
/**
 * 
 * @param idEquipo
 * @param mes
 * @param anno
 * @return lista de horas ocio por dias para un mes del año 
 * @throws SQLException 
 */
    public ArrayList<TiempoOcio> listaMes(String idEquipo, String mes, String anno) throws SQLException {
        YearMonth ym;
        ym = YearMonth.of(Integer.parseInt(anno), Integer.parseInt(mes));
        int diasDelmes = ym.lengthOfMonth();
//        System.out.println(mesActual + "mes");
//        System.out.println(annoActual + "año");
        TiempoOcio tO;
        ArrayList<TiempoOcio> listaTiemposDeOcio = new ArrayList<>();
        ArrayList<TiempoOcio> listaTiemposDeOcioEnDb = listaDiaEnDb(idEquipo, mes, anno);
        for (int i = 0; i < diasDelmes; i++) {
            tO = new TiempoOcio();
            tO.setDia(i + 1);
            tO.setMes(Integer.parseInt(mes));
            tO.setAnno(Integer.parseInt(anno));
            tO.setTiempo(0);
            listaTiemposDeOcio.add(tO);
        }
        if (!listaTiemposDeOcioEnDb.isEmpty()) {
            for (TiempoOcio t : listaTiemposDeOcio) {
                for (TiempoOcio tDb : listaTiemposDeOcioEnDb) {

                    if (t.getDia() == tDb.getDia()) {
                        t.sumarTiempo(tDb.getTiempo());
                    }

                }

            }
        }
        return listaTiemposDeOcio;
    }
/**
 * 
 * @param idEquipo
 * @param anno
 * @return lista de horas ocio por meses para un año particular
 * @throws SQLException 
 */
    public ArrayList<TiempoOcio> listaAnno(String idEquipo, String anno) throws SQLException {
        TiempoOcio tO;
        ArrayList<TiempoOcio> listaTiemposDeOcio = new ArrayList<>();
        ArrayList<TiempoOcio> listaTiemposDeOcioEnDb = listaMesEnDb(idEquipo, anno);
        for (int i = 0; i < 12; i++) {
            tO = new TiempoOcio();
            tO.setMes(i + 1);
            tO.setAnno(Integer.parseInt(anno));
            tO.setTiempo(0);
            listaTiemposDeOcio.add(tO);
        }
        if (!listaTiemposDeOcioEnDb.isEmpty()) {
            for (TiempoOcio t : listaTiemposDeOcio) {
                for (TiempoOcio tDb : listaTiemposDeOcioEnDb) {

                    if (t.getMes() == tDb.getMes()) {
                        t.sumarTiempo(tDb.getTiempo());
                    }

                }

            }
        }
        return listaTiemposDeOcio;
    }

    public ArrayList<TiempoOcio> listaDiaEnDb(String idEquipos, String mes, String anno) throws SQLException {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT `tiempo`, EXTRACT(YEAR FROM `fecha`) AS anno, EXTRACT(MONTH FROM `fecha`) AS mes ,EXTRACT(DAY FROM `fecha`) AS dia FROM `tiemposocio` WHERE `Equipos_idEquipos`='" + idEquipos + "' AND MONTH(`fecha`)='" + mes + "' AND YEAR(`fecha`)='" + anno + "'";
        ResultSet datos = conexion.consultarBD(sql);
        TiempoOcio tO;
        ArrayList<TiempoOcio> listaTiemposDeOcio = new ArrayList<>();
        while (datos.next()) {
            tO = new TiempoOcio();
            tO.setAnno(datos.getInt("anno"));
            tO.setMes(datos.getInt("mes"));
            tO.setDia(datos.getInt("dia"));
            tO.setTiempo(datos.getFloat("tiempo"));
            listaTiemposDeOcio.add(tO);
        }
        return listaTiemposDeOcio;
    }

    public ArrayList<TiempoOcio> listaMesEnDb(String idEquipos, String anno) throws SQLException {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT `tiempo`, EXTRACT(YEAR FROM `fecha`) AS anno, EXTRACT(MONTH FROM `fecha`) AS mes ,EXTRACT(DAY FROM `fecha`) AS dia FROM `tiemposocio` WHERE `Equipos_idEquipos`='" + idEquipos + "' AND YEAR(`fecha`)='" + anno + "'";
        ResultSet datos = conexion.consultarBD(sql);
        TiempoOcio tO;
        ArrayList<TiempoOcio> listaTiemposDeOcio = new ArrayList<>();
        while (datos.next()) {
            tO = new TiempoOcio();
            tO.setAnno(datos.getInt("anno"));
            tO.setMes(datos.getInt("mes"));
            tO.setDia(datos.getInt("dia"));
            tO.setTiempo(datos.getFloat("tiempo"));
            listaTiemposDeOcio.add(tO);
        }
        return listaTiemposDeOcio;
    }

    public void indicadorOEEMes() {

    }

    public int getIdEquipos() {
        return idEquipos;
    }

    public void setIdEquipos(int idEquipos) {
        this.idEquipos = idEquipos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getTipoEquipo() {
        return tipoEquipo;
    }

    public void setTipoEquipo(String tipoEquipo) {
        this.tipoEquipo = tipoEquipo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getPeso() {
        return peso;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }

    public String getAltura() {
        return altura;
    }

    public void setAltura(String altura) {
        this.altura = altura;
    }

    public String getLargo() {
        return largo;
    }

    public void setLargo(String largo) {
        this.largo = largo;
    }

    public String getAncho() {
        return ancho;
    }

    public void setAncho(String ancho) {
        this.ancho = ancho;
    }

    public String getPotencia() {
        return potencia;
    }

    public void setPotencia(String potencia) {
        this.potencia = potencia;
    }

    public String getTipoPotencia() {
        return tipoPotencia;
    }

    public void setTipoPotencia(String tipoPotencia) {
        this.tipoPotencia = tipoPotencia;
    }

    public String getFrecuencia() {
        return frecuencia;
    }

    public void setFrecuencia(String frecuencia) {
        this.frecuencia = frecuencia;
    }

    public String getAlimentacion() {
        return alimentacion;
    }

    public void setAlimentacion(String alimentacion) {
        this.alimentacion = alimentacion;
    }

    public boolean getAmbienteCorrosivo() {
        return ambienteCorrosivo != 0;
    }

    public void setAmbienteCorrosivo(boolean abienteCorrosivo) {
        if (abienteCorrosivo) {
            this.ambienteCorrosivo = 1;
        } else {
            this.ambienteCorrosivo = 0;
        }
    }

    public float getTiempoDeFuncionamiento() {
        return tiempoDeFuncionamiento;
    }

    public void setTiempoDeFuncionamiento(float tiapoDeFuncionamiento) {
        this.tiempoDeFuncionamiento = tiapoDeFuncionamiento;
    }

    public float getHorasDeUso() {
        return horasDeUso;
    }

    public void setHorasDeUso(float horasDeUso) {
        this.horasDeUso = horasDeUso;
    }

    public String getFunciones() {
        return funciones;
    }

    public void setFunciones(String funciones) {
        this.funciones = funciones;
    }

    public String getCaracteristicasEspecificas() {
        return caracteristicasEspecificas;
    }

    public void setCaracteristicasEspecificas(String caracteristicasEspecificas) {
        this.caracteristicasEspecificas = caracteristicasEspecificas;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String getControl() {
        return control;
    }

    public void setControl(String control) {
        this.control = control;
    }

    public String getEstadoPintura() {
        return estadoPintura;
    }

    public void setEstadoPintura(String estadoPintura) {
        this.estadoPintura = estadoPintura;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public ArrayList<OrdenDeTrabajo> getListaOrdenesDeTrabajo() {
        return listaOrdenesDeTrabajo;
    }

    public void setListaOrdenesDeTrabajo(ArrayList<OrdenDeTrabajo> listaOrdenesDeTrabajo) {
        this.listaOrdenesDeTrabajo = listaOrdenesDeTrabajo;
    }

}
