package Clases;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;

/**
 *
 * @author Karoll Gabriela - Ana Cristina - Johan Ordoñez
 */
public class Lista implements Serializable {

    private Libros primerNodo;
    private Libros ultimoNodo;

    public Lista() {
        primerNodo = null;
        ultimoNodo = null;
    }

    public boolean estaVacia() {
        return primerNodo == null;
    }

    public void agregarAlFinal(Libros libro) {
        if (estaVacia()) {
            primerNodo = libro;
            ultimoNodo = libro;
        } else {
            libro.setAnterior(ultimoNodo);
            ultimoNodo.setSiguiente(libro);
            ultimoNodo = libro;
        }
    }

    public void agregarAlInicio(Libros libro) {
        if (estaVacia()) {
            primerNodo = libro;
            ultimoNodo = libro;
        } else {
            libro.setSiguiente(primerNodo);
            primerNodo.setAnterior(libro);
            primerNodo = libro;
        }
    }

    public void eliminarLibro(int codigo) {
        if (!estaVacia()) {
            Libros libro = primerNodo;

            while (libro != null) {
                if (libro.getCodigo() == codigo) {
                    if (libro == primerNodo) {
                        primerNodo = libro.getSiguiente();
                        if (primerNodo != null) {
                            primerNodo.setAnterior(null);
                        }
                    } else if (libro == ultimoNodo) {
                        ultimoNodo = libro.getAnterior();
                        if (ultimoNodo != null) {
                            ultimoNodo.setSiguiente(null);
                        }
                    } else {
                        Libros anterior = libro.getAnterior();
                        Libros siguiente = libro.getSiguiente();
                        anterior.setSiguiente(siguiente);
                        siguiente.setAnterior(anterior);
                    }
                    break; // Importante: detener el bucle después de eliminar el libro
                }
                libro = libro.getSiguiente();
            }
        }
    }

    public void mostrarListaHaciaAdelante() {
        Libros actual = primerNodo;
        while (actual != null) {
            System.out.println("Título: " + actual.getTitulo());
            System.out.println("Autor: " + actual.getAutor());
            System.out.println("Año de Publicación: " + actual.getAnioPublicacion());
            System.out.println("Foto de Portada: " + actual.getFotoPortada());
            actual = actual.getSiguiente();
        }
    }

    public void mostrarListaHaciaAtrás() {
        Libros actual = ultimoNodo;
        while (actual != null) {
            System.out.println("Título: " + actual.getTitulo());
            System.out.println("Autor: " + actual.getAutor());
            System.out.println("Año de Publicación: " + actual.getAnioPublicacion());
            System.out.println("Foto de Portada: " + actual.getFotoPortada());
            actual = actual.getAnterior();
        }
    }

    /**
     * Genera una representación en formato HTML de la lista de libros
     *
     * @return Cadena HTML que representa las tareas en la lista
     */
    public String MostrarLista(int codigoUsuario) {

        Libros libro = this.primerNodo;
        String resultado = "";

        if (libro != null) {
            while (libro != null) {
                if (codigoUsuario == libro.getCodigoUsuario()) {
                    resultado += "<div class='col-lg-4 col-md-6 mb-4' style='margin-right: 0px;'>";
                    resultado += "<div class='service-item bg-white text-center mb-2 py-3 px-4'>";
                    resultado += "<div class='dropdown dropdown-left'>"; // Agrega la clase 'dropdown-left'
                    resultado += "<button class='btn btn-secondary dropdown-toggle' type='button' data-bs-toggle='dropdown' aria-expanded='false'>";
                    resultado += "";
                    resultado += "</button>";
                    resultado += "<ul class='dropdown-menu'>";
                    resultado += "<li><button class='dropdown-item' type='button' onclick='mostrarModalEditar(" + libro.getCodigo() + ")'>Editar</button></li>";
                    resultado += "<li><button class='dropdown-item' type='button'>Visualizar</button></li>";
                    resultado += "<li><button class='dropdown-item' type='button' onclick='mostrarModalEliminar(" + libro.getCodigo() + ")'>Eliminar</button></li>";
                    resultado += "</ul>";
                    resultado += "</div>";
                    resultado += "<h3 class='m-0'>Título: " + libro.getTitulo() + "</h3><br>";
                    resultado += "<p class='m-0'>Autor: " + libro.getAutor() + "</p>";
                    resultado += "<p class='m-0'>Año de Publicación:" + libro.getAnioPublicacion() + "</p><br>";
                    resultado += "<img src='imgLibros/" + libro.getFotoPortada() + "'alt='Portada del libro' style='width: 70%; height: 230px;'/>";
                    resultado += "<br><br><a href='" + libro.getFotoPortada() + "' target='_blank' class='btn btn-primary py-md-3 px-md-5 mt-2'>Ver Portada</a>";
                    resultado += "</div>";
                    resultado += "</div>";
                }
                libro = libro.siguiente;
            }
        } else if (libro == null) {
            resultado += "<div class='col-12'>";
            resultado += "<div class='alert alert-info' role='alert'>";
            resultado += "No se encontraron libros registrados.";
            resultado += "</div>";
            resultado += "</div>";
        }
        return resultado;
    }

    public int obtenerLongitud() {
        int longitud = 0;
        Libros actual = primerNodo; // Comienza desde el primer nodo

        while (actual != null) {
            longitud++;
            actual = actual.getSiguiente();
        }

        return longitud;
    }

    public void editarLibro(int codigo, String nuevoTitulo, String nuevoAutor, String nuevaFecha, String imagen, ServletContext context, Part filePart) throws FileNotFoundException, IOException {
        // Directorio de carga en el servidor donde se guardarán las imágenes

        if (!estaVacia()) {
            Libros libro = primerNodo;

            while (libro != null) {
                if (libro.getCodigo() == codigo) {

                    libro.setTitulo(nuevoTitulo);
                    libro.setAutor(nuevoAutor);
                    libro.setAnioPublicacion(nuevaFecha);
                    libro.setFotoPortada(imagen);

                    String uploadPath = context.getRealPath("/imgLibros");

                    // Construir la ruta completa del archivo de imagen en el servidor
                    String filePath = uploadPath + File.separator + imagen;

                    //Abrir un flujo de entrada para el archivo de imagen recibido
                    try (InputStream fileContent = filePart.getInputStream(); FileOutputStream outputStream = new FileOutputStream(filePath)) {

                        int read;
                        byte[] buffer = new byte[1024];

                        //Leer el archivo de imagen y escribirlo en el servidor
                        while ((read = fileContent.read(buffer)) != -1) {
                            outputStream.write(buffer, 0, read);
                        }
                    }
                }
                libro = libro.getSiguiente();
            }
        }

    }
}
