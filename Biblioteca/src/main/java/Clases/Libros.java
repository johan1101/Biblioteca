package Clases;

import java.io.Serializable;

/**
 *
 * @author Karoll Gabriela - Ana Cristina - Johan Ordoñez
 */
public class Libros implements Serializable {

   private int codigoUsuario;
    private int codigo;
    private String titulo;
    private String autor;
    private String anioPublicacion;
    private String fotoPortada;
    public Libros siguiente;
    public Libros anterior;

    public Libros() {
    }

    public Libros(int codigoUsuario, int codigo, String titulo, String autor, String anioPublicacion, String fotoPortada) {
        this.codigoUsuario = codigoUsuario;
        this.codigo = codigo;
        this.titulo = titulo;
        this.autor = autor;
        this.anioPublicacion = anioPublicacion;
        this.fotoPortada = fotoPortada;
        this.siguiente = null;
        this.anterior = null;
    }

    public int getCodigoUsuario() {
        return codigoUsuario;
    }

    public void setCodigoUsuario(int codigoUsuario) {
        this.codigoUsuario = codigoUsuario;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getAnioPublicacion() {
        return anioPublicacion;
    }

    public void setAnioPublicacion(String anioPublicacion) {
        this.anioPublicacion = anioPublicacion;
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
