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
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvBuscar", urlPatterns = {"/SvBuscar"})
public class SvBuscar extends HttpServlet {

    Lista listaEnlazada = new Lista();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Metodo para buscar");

        HttpSession session = request.getSession();

        //Obtener el contexto del servlet
        ServletContext context = getServletContext();

        String buscar = request.getParameter("buscar");

        System.out.println(buscar);

        int codigoUsuario = (int) session.getAttribute("codigoUsuario");

        try {
            listaEnlazada = Serializacion.leerArchivoLibros(context);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvEditar.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Generar la tabla de tareas según la búsqueda
        String tablaTareas = "";

        if (buscar != null && !buscar.isEmpty()) {
            // Si se proporciona un ID, generar una tabla de tareas filtrada por ese ID
            tablaTareas = listaEnlazada.MostrarListaBusqueda(codigoUsuario, buscar);
        } else {
            // Si no se proporciona un ID, generar la tabla de todas las tareas
            tablaTareas = listaEnlazada.MostrarLista(codigoUsuario);
        }
        
        session.setAttribute("buscar", buscar);
        response.sendRedirect("biblioteca.jsp");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
