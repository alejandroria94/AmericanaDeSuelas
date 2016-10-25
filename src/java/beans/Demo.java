/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.SQLException;

/**
 *
 * @author Fido
 */
public class Demo {
    public static void main(String[] args) throws SQLException {
        Equipo e=new Equipo();
       // e.guardarEquipo();
       e.listarEquipos();
        
    }
}
