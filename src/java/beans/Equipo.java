/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Fido
 */
public class Equipo {

    private int idEquipos;
    private String nombre;
    private String tipoEquipo;
    private String marca;
    private String modelo;
    private String ubicación;
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
//        this.tipoEquipo = "";
//        this.marca = "";
//        this.modelo = "";
//        this.ubicación = "";
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
        if (conexion.setAutoCommitBD(false)) {
            boolean inserto = conexion.insertarBD("INSERT INTO Equipos(nombre, tipoEquipo, marca, modelo, ubicacion, estado, serie, peso, altura, largo, ancho, potencia, tipoPotencia, frecuencia, alimentación, ambienteCorrosivo, tiempoDeFuncionamiento, horasDeUso, funciones, caracteristicasEspecificas, observaciones, control, estadoPintura, imagen) "
                    + " VALUES ( '" + this.nombre + "','" + this.tipoEquipo + "','" + this.marca + "','" + this.modelo + "','" + this.ubicación + "','" + this.estado + "','" + this.serie + "','" + this.peso + "','" + this.altura + "','" + this.largo + "','"
                    + this.ancho + "','" + this.potencia + "','" + this.tipoPotencia + "','" + this.frecuencia + "','" + this.alimentacion + "','" + this.ambienteCorrosivo + "','" + this.tiempoDeFuncionamiento + "','" + this.horasDeUso + "','" + this.funciones + "','"
                    + this.caracteristicasEspecificas + "','" + this.observaciones + "','" + this.control + "','" + this.estadoPintura + "','" + this.imagen + "');  ");
            if (inserto) {
                conexion.commitBD();
                exito = true;
            } else {
                conexion.rollbackBD();
            }
        }
        return exito;
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
            e.setTipoEquipo(rs.getString("tipoEquipo"));
            e.setMarca(rs.getString("marca"));
            e.setModelo(rs.getString("modelo"));
            e.setUbicación(rs.getString("ubicacion"));
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
            e.setAmbienteCorrosivo(Boolean.parseBoolean(rs.getString("ambienteCorrosivo")));
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

    public String getUbicación() {
        return ubicación;
    }

    public void setUbicación(String ubicación) {
        this.ubicación = ubicación;
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
            this.ambienteCorrosivo = 0;
        } else {
            this.ambienteCorrosivo = 1;
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
