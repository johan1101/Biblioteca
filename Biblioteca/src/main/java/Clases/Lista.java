/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import java.io.Serializable;

/**
 *
 * @author 
 */
public class Lista implements Serializable {
    
    private Nodo cabeza;
    
    private class Nodo implements Serializable{
        
        public Libros libro;
        public Nodo siguiente = null; // Apunta al siguiente
        public Nodo anterior = null;  // Apunta al anterior

        // Constructor
        public Nodo(Libros libro) {
            this.libro = libro;
        }
    }
    
    public void insertarPrincipio(Libros libro) {
    Nodo nodo = new Nodo(libro);
    
    if (cabeza == null) {
        cabeza = nodo;
    } else {
        nodo.siguiente = cabeza;
        cabeza.anterior = nodo; // Establecer la referencia anterior en el nodo actual de la cabeza
        cabeza = nodo; // Actualizar la cabeza para que sea el nuevo nodo
    }
}
}
