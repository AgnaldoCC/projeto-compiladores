package compiler.pascal;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.nio.file.Paths;

public class Main {

    public static void main(String[] args) throws FileNotFoundException {

        String rootPath = Paths.get("").toAbsolutePath().toString();
        String subPath = "/src/compiler/pascal/";

        String sourcecode = rootPath + subPath + "program.pas";

        Parser p = new Parser(new LexicalAnalyzer(new FileReader(sourcecode)));
        
        try {
            p.parse();
            System.out.println("Compilação concluida...");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}