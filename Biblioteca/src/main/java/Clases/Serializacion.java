/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import javax.servlet.ServletContext;

/**
 *
 * @author Johan Ordoñez
 */
public class Serializacion {

    public static void escribirArchivoLibros(Lista listaLibros, ServletContext context) throws FileNotFoundException, IOException {
        // Ruta relativa y absoluta del archivo de datos serializados
        String rutaRelativa = "/data/librosAgregados.ser";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        try (FileOutputStream fos = new FileOutputStream(archivo); ObjectOutputStream oos = new ObjectOutputStream(fos)) {
            // Serializar y escribir la lista enlazada en el archivo
            oos.writeObject(listaLibros);
        } catch (IOException e) {
            System.out.println("Error al escribir el archivo de datos.");
        }
    }

    public static Lista leerArchivoLibros(ServletContext context) throws IOException, ClassNotFoundException {
        Lista listaLibros = new Lista();
        // Ruta relativa y absoluta del archivo de datos serializados
        String rutaRelativa = "/data/librosAgregados.ser";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        if (archivo.exists() && archivo.isFile()) {
            try (FileInputStream fis = new FileInputStream(archivo); ObjectInputStream ois = new ObjectInputStream(fis)) {
                // Leer y deserializar la lista enlazada desde el archivo
                listaLibros = (Lista) ois.readObject();
            } catch (EOFException e) {
                // EOFException indica que el archivo estaba vacío
                System.out.println("El archivo de datos está vacío.");
            } catch (IOException e) {
                System.out.println("Error al leer el archivo de datos.");
            }
        } else {
            System.out.println("El archivo de datos no existe.");
        }

        return listaLibros;
    }
}
