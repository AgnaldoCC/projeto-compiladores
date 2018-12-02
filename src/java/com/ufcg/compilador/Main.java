package com.ufcg.compilador;

import java.io.FileNotFoundException;
import java.io.FileReader;

public class Main {
	public static void main(String[] args) throws FileNotFoundException {
		LexicalAnalyzer lexicalAnalyzer = new LexicalAnalyzer(new FileReader("src/pascal/program.pas"));
		Parser p = new Parser(lexicalAnalyzer);
		
        try {
            p.parse();
            System.out.println("Compilacao concluida...");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}