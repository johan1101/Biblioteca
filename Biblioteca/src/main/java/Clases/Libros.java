
package Clases;

import java.io.Serializable;

/**
 *
* @author Karoll Gabriela - Ana Cristina - Johan Ordoñez
 */
public class Libros  implements Serializable{
 
    private String titulo;
    private String autor;
    private String añoPublicacion;
    private String fotoPortada;
    public Libros siguiente;
    public Libros anterior;

    public Libros() {
    }

    public Libros(String titulo, String autor, String añoPublicacion, String fotoPortada) {
        this.titulo = titulo;
        this.autor = autor;
        this.añoPublicacion = añoPublicacion;
        this.fotoPortada = fotoPortada;
        this.siguiente = null;
        this.anterior = null;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getAñoPublicacion() {
        return añoPublicacion;
    }

    public void setAñoPublicacion(String añoPublicacion) {
        this.añoPublicacion = añoPublicacion;
    }

    public String getFotoPortada() {
        return fotoPortada;
    }

    public void setFotoPortada(String fotoPortada) {
        this.fotoPortada = fotoPortada;
    }

    public Libros getSiguiente() {
        return siguiente;
    }

    public void setSiguiente(Libros siguiente) {
        this.siguiente = siguiente;
    }

    public Libros getAnterior() {
        return anterior;
    }

    public void setAnterior(Libros anterior) {
        this.anterior = anterior;
    }
}