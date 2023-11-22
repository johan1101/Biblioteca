/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Libros;
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
@WebServlet(name = "SvMostrarInformacionEditar", urlPatterns = {"/SvMostrarInformacionEditar"})
public class SvMostrarInformacionEditar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    Lista libro = new Lista();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        System.out.println("Corriendo metodo para mostrar informacion de editar");
        //Obtener el contexto del servlet
        ServletContext context = getServletContext();

        try {
            libro = Serializacion.leerArchivoLibros(context);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvMostrarInformacionEditar.class.getName()).log(Level.SEVERE, null, ex);
        }
        String codigoS = request.getParameter("codigo");
        int codigo = Integer.parseInt(codigoS);
        System.out.println(codigo);
        Libros encontrado = libro.buscarLibroPorCodigoEditar(codigo);
        System.out.println(encontrado);
        if (encontrado != null) {
            String libroHtml = "<div class='form-element'>"
                    + "<label for='email'> Titulo</label>"
                    + "<input type='text' id='nuevoTitulo' name='nuevoTitulo' placeholder='Ingrese el nuevo titulo' maxlength='20' value='" + encontrado.getTitulo() + "' required>"
                    + " </div>"
                    + "<div class='form-element'>"
                    + "<label for='email'>Autor</label>"
                    + "<input type='text' id='nuevoAutor' name='nuevoAutor' placeholder='Ingrese el nuevo autor' maxlength='20' value='" + encontrado.getAutor() + "' required>"
                    + "</div>"
                    + "<div class='form-element'>"
                    + "<label for='email'>Fecha de publicación</label>"
                    + "<input type='date' id='nuevaFecha' name='nuevaFecha' value='" + encontrado.getAnioPublicacion() + "' required>"
                    + "</div>"
                    + "<div class='form-element'>"
                    + "<label for='email'>Imagen</label>"
                    + "<input type='file' id='imagen' name='imagen' maxlength='20' accept=\".jpg, .jpeg, .png\">"
                    + "</div>";


            response.setContentType("text/html");
            response.getWriter().write(libroHtml);
        } else {
            // Maneja el caso en el que no se encuentra el perro
            response.setContentType("text/plain");
            response.getWriter().write("Libro no encontrado");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
