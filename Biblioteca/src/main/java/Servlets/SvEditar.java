/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Johan Ordoñez
 */
@WebServlet(name = "SvEditar", urlPatterns = {"/SvEditar"})
public class SvEditar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        System.out.println("Corriendo metodo para editar");

        Part filePart = request.getPart("imagen");
        String nuevoTitulo = request.getParameter("nuevoTitulo");
        String nuevoAutor = request.getParameter("nuevoAutor");
        String nuevaFecha = request.getParameter("nuevaFecha");

        // Ahora puedes usar estos valores como desees en tu servlet
        // Por ejemplo, para imprimirlos en la consola:
        System.out.println(filePart);
        System.out.println("Nuevo Título: " + nuevoTitulo);
        System.out.println("Nuevo Autor: " + nuevoAutor);
        System.out.println("Nueva Fecha: " + nuevaFecha);
    }

}
