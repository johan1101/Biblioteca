package Servlets;

import Clases.Metodos;
import Clases.Persistencia;
import Clases.Usuarios;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Johan Ordoñez
 */
@WebServlet(name = "SvRegistrar", urlPatterns = {"/SvRegistrar"})
public class SvRegistrar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    //Registrar usuario
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    //Validar usuario
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        HttpSession session = request.getSession();

        //Obtener el contexto del servlet
        ServletContext context = getServletContext();

        int cedula = Integer.parseInt(request.getParameter("cedula"));

        String nombre = request.getParameter("nombre");

        String contrasena = request.getParameter("contrasena");

        boolean estado = Metodos.verificarUsuarioRepetido(cedula, nombre, contrasena, context);

        if (estado == true) {
            String mostrarToastr = "noRegistrado";

            session.setAttribute("estado", mostrarToastr);

        } else {
            ArrayList<Usuarios> usuarioNuevo = new ArrayList<>();

            Persistencia.leerArchivo(usuarioNuevo, context);

            Usuarios usuario = new Usuarios(cedula, nombre, contrasena);

            usuarioNuevo.add(usuario);

            Persistencia.escribirArchivo(usuarioNuevo, context);

            String mostrarToastr = "siRegistrado";

            session.setAttribute("estado", mostrarToastr);
        }

        response.sendRedirect("index.jsp");
    }
}
