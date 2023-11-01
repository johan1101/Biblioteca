package Servlets;

import Clases.Lista;
import Clases.Serializacion;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "SvEditar", urlPatterns = {"/SvEditar"})
@MultipartConfig
public class SvEditar extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    Lista listaLibros = new Lista();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        HttpSession session = request.getSession();

        // Metodo para recibir el codigo a esitar
        String codigo = request.getParameter("codigo");
        
        System.out.println("Valor del codigo:" + codigo);
        
        session.setAttribute("codigo", codigo);
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        HttpSession session = request.getSession();

        // Obtener el contexto del servlet
        ServletContext context = getServletContext();
        
        System.out.println("Corriendo metodo para editar");
        
        String codigo = (String) session.getAttribute("codigo");
        
        Part filePart = request.getPart("imagen");
        String nuevoTitulo = request.getParameter("nuevoTitulo");
        String nuevoAutor = request.getParameter("nuevoAutor");
        String nuevaFecha = request.getParameter("nuevaFecha");

        // Obtener el nombre del archivo de imagen enviado
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        try {
            listaLibros = Serializacion.leerArchivoLibros(context);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvEditar.class.getName()).log(Level.SEVERE, null, ex);
        }
        int codigoN = Integer.parseInt(codigo);
        
        listaLibros.editarLibro(codigoN, nuevoTitulo, nuevoAutor, nuevaFecha, fileName, context, filePart);
        
        Serializacion.escribirArchivoLibros(listaLibros, context);
        
        System.out.println("Finalizado");
        
                response.sendRedirect("biblioteca.jsp");
    }
}
