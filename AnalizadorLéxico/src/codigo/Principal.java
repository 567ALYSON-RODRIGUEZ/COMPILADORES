/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author DELL
 */
public class Principal {
    public static void main(String[] args) throws Exception { //creación de main 
        //ruta del source package, se cambia \\ por /
        String ruta1 = "C:/Users/DELL/Documents/NetBeansProjects/Scanner1/src/codigo/Lexer.flex";
        // /src/codigo  src=códigos fuente, codigo=lexer.flex
        String ruta2 = "C:/Users/DELL/Documents/NetBeansProjects/Scanner1/src/codigo/LexerCup.flex";
        generar(ruta1, ruta2);
    }
    public static void generar(String ruta1, String ruta2) throws IOException, Exception{
        File archivo;
        archivo = new File(ruta1);
        JFlex.Main.generate(archivo);
        archivo = new File(ruta2);
        
        Path rutaSym = Paths.get("C:/Users/DELL/Documents/NetBeansProjects/Scanner1/src/codigo/sym.java");
        if(Files.exists(rutaSym )){
           Files.delete(rutaSym);
        }
        Files.move(
                Paths.get("C:/Users/DELL/Documents/NetBeansProjects/Scanner1/sym.java"),
                Paths.get("C:/Users/DELL/Documents/NetBeansProjects/Scanner1/src/codigo/sym.java")
        );
    }
}
