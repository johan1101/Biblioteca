/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

/**
 *
 * @author Karoll Gabriela - Ana Cristina - Johan Ordoñez
 */
public class Usuarios {

    private int codigo;
    private int cedula;
    private String nombreUsuario;
    private String contrasena;

    public Usuarios() {
    }

    public Usuarios(int codigo, int cedula, String nombreUsuario, String contrasena) {
        this.codigo = codigo;
        this.cedula = cedula;
        this.nombreUsuario = nombreUsuario;
        this.contrasena = contrasena;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    
    
    public int getCedula() {
        return cedula;
    }

    public void setCedula(int cedula) {
        this.cedula = cedula;
    }
    
    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

}
