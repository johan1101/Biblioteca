/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Metodos;
import java.io.IOException;
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
@WebServlet(name = "SvVerificarIngreso", urlPatterns = {"/SvVerificarIngreso"})
public class SvVerificarIngreso extends HttpServlet {

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
        System.out.println("Ejecutando registro de usuario");

        HttpSession session = request.getSession();

        //Obtener el contexto del servlet
        ServletContext context = getServletContext();

        int cedula = Integer.parseInt(request.getParameter("cedula"));

        String contrasena = request.getParameter("contrasena");

        String check = Metodos.verificarIngreso(cedula, contrasena, context);

        System.out.println(check);

        if (!check.equals("no")) {

            // Establece los atributos en el objeto request
            session.setAttribute("nombreUsuario", check);
            response.sendRedirect("biblioteca.jsp");

        } else {
            String validacion = "noValidado";
            request.setAttribute("estado", validacion);

            session.setAttribute("estado", "noValidado");
            response.sendRedirect("index.jsp");
        }
    }

}
