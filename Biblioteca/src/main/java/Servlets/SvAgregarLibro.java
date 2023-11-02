package Servlets;

import Clases.Libros;
import Clases.Lista;
import Clases.Serializacion;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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

@WebServlet(name = "SvAgregarLibro", urlPatterns = {"/SvAgregarLibro"})
@MultipartConfig
public class SvAgregarLibro extends HttpServlet {

    // Crear una instancia de la clase ListasEnlazadas
    Lista listaEnlazada = new Lista();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvAgregarLibro</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvAgregarLibro at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener el contexto del servlet
        ServletContext context = getServletContext();

        try {
            listaEnlazada = Serializacion.leerArchivoLibros(context);
            if (listaEnlazada == null) {
                listaEnlazada = new Lista();
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvAgregarLibro.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Obtener los datos del formulario enviados por POST
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String fecha = request.getParameter("anioPublicacion");
        //Obtener la parte del archivo de imagen desde la solicitud
        Part filePart = request.getPart("fotoPortada");

        // Directorio de carga en el servidor donde se guardarán las imágenes
        String uploadPath = context.getRealPath("/imgLibros");

        // Obtener el nombre del archivo de imagen enviado
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Construir la ruta completa del archivo de imagen en el servidor
        String filePath = uploadPath + File.separator + fileName;

        //Abrir un flujo de entrada para el archivo de imagen recibido
        try (InputStream fileContent = filePart.getInputStream(); FileOutputStream outputStream = new FileOutputStream(filePath)) {

            int read;
            byte[] buffer = new byte[1024];

            //Leer el archivo de imagen y escribirlo en el servidor
            while ((read = fileContent.read(buffer)) != -1) {
                outputStream.write(buffer, 0, read);
            }
        }
        System.out.println(fileName);

        int longitud = listaEnlazada.obtenerLongitud();

        longitud = longitud + 1;

        HttpSession session = request.getSession(); // Obtener la sesión existente o crear una nueva si no existe

// Recuperar el valor del atributo "codigo" de la sesión
        int codigoUsuario = (int) session.getAttribute("codigoUsuario");
        
        System.out.println("Este es el codigo de usuario: " + codigoUsuario);

        Libros libro = new Libros(codigoUsuario, longitud, titulo, autor, fecha, fileName);

        listaEnlazada.agregarAlFinal(libro);
        Serializacion.escribirArchivoLibros(listaEnlazada, context);

        response.sendRedirect("biblioteca.jsp");
    }

}
