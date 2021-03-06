package com.ufcg.compilador;

import java.io.FileReader;

import java.io.IOException;
import java.nio.file.Paths;

import java_cup.runtime.Symbol;

public class LexerTest {

	public static void main(String[] args) throws IOException {

		String rootPath = Paths.get("").toAbsolutePath().toString();
		String subPath = "/src/pascal";

		String sourceCode = rootPath + subPath + "/program.pas";

		LexicalAnalyzer lexical = new LexicalAnalyzer(new FileReader(sourceCode));

		sym aux = new SymImpl();
		Symbol sym;
		try {
			for (sym = lexical.next_token(); sym.sym != 0; sym = lexical.next_token()) {
				String valor = aux.terminalNames[sym.sym];
				if(sym.value == null) System.out.println("< " + valor + " >");
				else System.out.println("< " + valor + ", " + sym.value + " >");

			}
		} catch (Exception e) {
		}
	}
	
}
