/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class Usuario {

    private String login = "admin";
    private String pass = "admin-ads";

    public Usuario() {
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public boolean validarLogin(String login, String pass) {
        boolean rs = false;
        if (this.login.equals(login) && this.pass.equals(pass)) {
            rs = true;
        }
        return rs;
    }

}
