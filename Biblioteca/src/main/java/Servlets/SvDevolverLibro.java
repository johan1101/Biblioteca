
package Servlets;

import Clases.Lista;
import Clases.Serializacion;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Johan Ordoñez
 */
@WebServlet(name = "SvDevolverLibro", urlPatterns = {"/SvDevolverLibro"})
public class SvDevolverLibro extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    
        // Crear una instancia de la clase ListasEnlazadas
    Lista listaEnlazada = new Lista();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
                System.out.println("Corriendo metodo para devolver libro");

        // Obtiene el contexto del servlet
        ServletContext context = getServletContext();

        // Obtiene el nombre del perro a eliminar desde los parámetros de la solicitud
        int libroPedir = Integer.parseInt(request.getParameter("codigo"));

        try {
            // Crea una lista para almacenar objetos de la clase "Perro"
            listaEnlazada = Serializacion.leerArchivoLibros(context);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvEliminar.class.getName()).log(Level.SEVERE, null, ex);
        }

        listaEnlazada.devolverLibro(libroPedir);

        Serializacion.escribirArchivoLibros(listaEnlazada, context);

        
    }
}
