/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.ArrayList;

/**
 *
 * @author Fido
 */
class OrdenDeTrabajo {

    private int idOrdenesDeTrbajo;
    private String solicitante;
    private String tipoDeMantenimiento;
    private boolean dnElectrico;
    private boolean dnElectronico;
    private boolean dnMecanico;
     private ArrayList<Tarea> listaOrdenesDeTrabajo = new ArrayList<Tarea>();

}
