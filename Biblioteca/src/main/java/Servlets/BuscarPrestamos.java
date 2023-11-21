/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

/**
 *
 * @author Johan Ordoñez
 */
@WebServlet(name = "BuscarPrestamos", urlPatterns = {"/BuscarPrestamos"})
public class BuscarPrestamos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    Lista listaEnlazada = new Lista();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        
        session.setAttribute("buscarP", buscar);
        response.sendRedirect("librosPrestamo.jsp");

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
