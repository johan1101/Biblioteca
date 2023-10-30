package Clases;

import java.io.Serializable;

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

    public void eliminar(Libros libro) {
        if (!estaVacia()) {
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
        }
    }

    public void mostrarListaHaciaAdelante() {
        Libros actual = primerNodo;
        while (actual != null) {
            System.out.println("Título: " + actual.getTitulo());
            System.out.println("Autor: " + actual.getAutor());
            System.out.println("Año de Publicación: " + actual.getAñoPublicacion());
            System.out.println("Foto de Portada: " + actual.getFotoPortada());
            actual = actual.getSiguiente();
        }
    }

    public void mostrarListaHaciaAtrás() {
        Libros actual = ultimoNodo;
        while (actual != null) {
            System.out.println("Título: " + actual.getTitulo());
            System.out.println("Autor: " + actual.getAutor());
            System.out.println("Año de Publicación: " + actual.getAñoPublicacion());
            System.out.println("Foto de Portada: " + actual.getFotoPortada());
            actual = actual.getAnterior();
        }
    }

    /**
     * Genera una representación en formato HTML de la lista de libros
     *
     * @return Cadena HTML que representa las tareas en la lista
     */
    public String MostrarLista() {
        Libros libro = this.primerNodo;
        String resultado = "";

        if (libro != null) {
            while (libro != null) {
                resultado += "<div class='col-lg-4 col-md-6 mb-4' style='margin-right: 0px;'>";
                resultado += "<div class='service-item bg-white text-center mb-2 py-3 px-4'>";
                resultado += "<div class='dropdown dropdown-left'>"; // Agrega la clase 'dropdown-left'
                resultado += "<button class='btn btn-secondary dropdown-toggle' type='button' data-bs-toggle='dropdown' aria-expanded='false'>";
                resultado += "";
                resultado += "</button>";
                resultado += "<ul class='dropdown-menu'>";
                resultado += "<li><button class='dropdown-item' type='button'>Editar</button></li>";
                resultado += "<li><button class='dropdown-item' type='button'>Visualizar</button></li>";
                resultado += "<li><button class='dropdown-item' type='button'>Eliminar</button></li>";
                resultado += "</ul>";
                resultado += "</div>";
                resultado += "<p class='m-0'>Título: " + libro.getTitulo() + "</p>";
                resultado += "<p class='m-0'>Autor: " + libro.getAutor() + "</p>";
                resultado += "<p class='m-0'>Año de Publicación:" + libro.getAñoPublicacion() + "</p>";
                resultado += "<img src='imgLibros/" + libro.getFotoPortada() + "'alt='Portada del libro' style='width: 70%; height: 230px;'/>";
                resultado += "<a href='" + libro.getFotoPortada() + "' target='_blank' class='btn btn-primary py-md-3 px-md-5 mt-2'>Ver Portada</a>";
                resultado += "</div>";
                resultado += "</div>";
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
}
