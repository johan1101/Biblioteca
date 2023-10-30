package Clases;

/**
 *
* @author Karoll Gabriela - Ana Cristina - Johan Ordoñez
 */
public class Lista {
    
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
}