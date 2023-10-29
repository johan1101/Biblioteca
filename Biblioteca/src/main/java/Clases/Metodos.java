/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 *
 * @author Johan Ordoñez
 */
public class Metodos {

    public static boolean verificarUsuarioRepetido(int cedula, String nombre, String contrasena, ServletContext context) throws IOException {
        ArrayList<Usuarios> UsuariosR = new ArrayList<>();

        Persistencia.leerArchivo(UsuariosR, context);

        boolean estado = false;

        for (Usuarios usuario : UsuariosR) {
            if (usuario.getCedula() == cedula) {
                estado = true;
            }
        }
        return estado;
    }
}
