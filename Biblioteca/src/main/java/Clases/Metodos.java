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

    public static String verificarIngreso(int cedula, String contrasena, ServletContext context) throws IOException {
        ArrayList<Usuarios> UsuariosR = new ArrayList<>();

        Persistencia.leerArchivo(UsuariosR, context);

        String estado = "no";

        for (Usuarios usuario : UsuariosR) {
            if ((usuario.getCedula() == cedula) && (usuario.getContrasena().equals(contrasena))) {
                estado = usuario.getNombreUsuario();
                return estado;
            }
        }
        return estado;
    }
    
        public static int codigo(int cedula, String contrasena, ServletContext context) throws IOException {
        ArrayList<Usuarios> UsuariosR = new ArrayList<>();

        Persistencia.leerArchivo(UsuariosR, context);

        int codigo = 0;

        for (Usuarios usuario : UsuariosR) {
            if ((usuario.getCedula() == cedula) && (usuario.getContrasena().equals(contrasena))) {
                codigo = usuario.getCodigo();
                return codigo;
            }
        }
        return codigo;
    }

}
