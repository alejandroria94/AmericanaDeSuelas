/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.spi.DirStateFactory;

/**
 *
 * @author Fido
 */
public class OrdenDeTrabajo {

    private int idOrdenesDeTrabajo;
    private int Equipos_idEquipos;
    private String solicitante;
    private String tipoMantenimiento;
    private int dnElectrico;//convertirlos a true o false para salidas 
    private int dnElectronico;
    private int dnMecanico;
    private String diagnostico;
    private String fechaInicio;
    private String fechaFin;
    private String codigo;

    public boolean guardarOT(String idEquipos) throws SQLException {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sentencia = "INSERT INTO OrdenesDeTrabajo(Equipos_idEquipos, solicitante, tipoMantenimiento, dnElectrico, dnElectronico, dnMecanico, diagnostico, fechaInicio, fechaFin,codigo) "
                + " VALUES ( '" + idEquipos + "','" + this.solicitante + "','" + this.tipoMantenimiento + "','" + this.dnElectrico + "','" + this.dnElectronico + "','" + this.dnMecanico + "','" + this.diagnostico + "','" + this.fechaInicio + "','" + this.fechaFin + "','" + this.codigo + "');";
        if (conexion.setAutoCommitBD(false)) {
            boolean inserto = conexion.insertarBD(sentencia);
            if (inserto) {
                conexion.commitBD();
                exito = true;
                ResultSet rs = conexion.consultarBD("SELECT LAST_INSERT_ID() AS idOT;");
                rs.next();
                idOrdenesDeTrabajo = rs.getInt("idOT");
            } else {
                conexion.rollbackBD();
            }
        }
        return exito;
    }

    public boolean borrarOT(String idOrdenesDeTrabajo) {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        if (conexion.setAutoCommitBD(false)) {
//            String sql = "DELETE FROM `comentarios` WHERE `NoIdent`='"+NoIdent+"'";
//            boolean borro = conexion.borrarBD(sql);
            String sql2 = "DELETE FROM `OrdenesDeTrabajo` WHERE `idOrdenesDeTrabajo`='" + idOrdenesDeTrabajo + "'";
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

    public int getIdOrdenesDeTrabajo() {
        return idOrdenesDeTrabajo;
    }

    public void setIdOrdenesDeTrabajo(int idOrdenesDeTrabajo) {
        this.idOrdenesDeTrabajo = idOrdenesDeTrabajo;
    }

    public int getEquipos_idEquipos() {
        return Equipos_idEquipos;
    }

    public void setEquipos_idEquipos(int Equipos_idEquipos) {
        this.Equipos_idEquipos = Equipos_idEquipos;
    }

    public String getSolicitante() {
        return solicitante;
    }

    public void setSolicitante(String solicitante) {
        this.solicitante = solicitante;
    }

    public String getTipoMantenimiento() {
        return tipoMantenimiento;
    }

    public void setTipoMantenimiento(String tipoMantenimiento) {
        this.tipoMantenimiento = tipoMantenimiento;
    }

    public boolean getDnElectrico() {
        return dnElectrico != 0;
    }

    public void setDnElectrico(boolean dnElectrico) {

        if (dnElectrico) {
            this.dnElectrico = 1;
        } else {
            this.dnElectrico = 0;
        }
    }

    public boolean getDnElectronico() {
        return dnElectronico != 0;
    }

    public void setDnElectronico(boolean dnElectronico) {
        if (dnElectronico) {
            this.dnElectronico = 1;
        } else {
            this.dnElectronico = 0;
        }
    }

    public boolean getDnMecanico() {
        return dnMecanico != 0;
    }

    public void setDnMecanico(boolean dnMecanico) {
        if (dnMecanico) {
            this.dnMecanico = 1;
        } else {
            this.dnMecanico = 0;
        }
    }

    public String getDiagnostico() {
        return diagnostico;
    }

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

}
