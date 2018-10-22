package compiler.pascal;

import java.io.FileReader;
import java.nio.file.Paths;

public class Main {

    public static void main(String[] args) {

        String rootPath = Paths.get("").toAbsolutePath().toString();
        String subPath = "/src/compiler/pascal/";

        String sourcecode = rootPath + subPath + "program.pas";


        try {
			Parser p = new Parser(new LexicalAnalyzer(new FileReader(sourcecode)));
            Object o = p.parse().value;
            System.out.println("Compilacao concluida com sucesso...");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}