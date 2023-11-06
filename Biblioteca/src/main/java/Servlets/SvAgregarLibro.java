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
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener el contexto del servlet
        ServletContext context = getServletContext();

        System.out.println("Corriendo metodo visualizar");

        try {
            listaEnlazada = Serializacion.leerArchivoLibros(context);
            if (listaEnlazada == null) {
                listaEnlazada = new Lista();
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvAgregarLibro.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Obtener el código del libro desde los parámetros de la solicitud
        String codigoS = request.getParameter("codigo");
        int codigo = Integer.parseInt(codigoS);

        // Utilizar el método buscarLibroPorCodigo para encontrar el libro
        Libros libro = listaEnlazada.buscarLibroPorCodigo(codigo);

        if (libro != null) {
            // Genera la respuesta HTML con los detalles del libro
            String libroHtml = "<div class='row'>"
                    + "<div class='col-md-6'>"
                    + "<img src='imgLibros/" + libro.getFotoPortada() + "'alt='Portada del libro' style='width: 100%; height: 450px;'/>"
                    + "</div>"
                    + "<div class='col-md-6 d-flex align-items-center justify-content-center'>"
                    + "<div class='text-center'>"
                    + "<h1>Título: " + libro.getTitulo() + "</h1><br>"
                    + "<h5>Autor: " + libro.getAutor() + "</h5>"
                    + "<h5>Año de Publicación: " + libro.getAnioPublicacion() + "</h5>"
                    + "</div>"
                    + "</div>"
                    + "</div>";

            response.setContentType("text/html");
            response.getWriter().write(libroHtml);
        } else {
            // Maneja el caso en el que no se encuentra el libro
            response.setContentType("text/plain");
            response.getWriter().write("Libro no encontrado");
        }
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
        String posicion = request.getParameter("posicion"); // Esto recoge la selección del radio button

        String estadoLibro = "pedir";
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

        Libros libro = new Libros(estadoLibro, codigoUsuario, longitud, titulo, autor, fecha, fileName);

        if ("inicio".equals(posicion)) {
            listaEnlazada.agregarAlInicio(libro); // Agregar al inicio si se seleccionó esa opción
        } else {
            listaEnlazada.agregarAlFinal(libro); // Agregar al final de lo contrario
        }

        Serializacion.escribirArchivoLibros(listaEnlazada, context);

        response.sendRedirect("biblioteca.jsp");
    }
}
