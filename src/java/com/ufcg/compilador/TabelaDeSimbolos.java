package com.ufcg.compilador;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class TabelaDeSimbolos {

	public static TabelaDeSimbolos currentScope;
	static TabelaDeSimbolos root = new TabelaDeSimbolos(null);
	static int contTable;

	HashMap<String, Simbolo> table;
	TabelaDeSimbolos prev;
	List<String> variables;

	public TabelaDeSimbolos(TabelaDeSimbolos prev) {
		table = new HashMap<String, Simbolo>();
		this.prev = prev;
		variables = new ArrayList<String>();
	}

	public static TabelaDeSimbolos getRoot() {
		return root;
	}
	
	public boolean isRoot() {
		return prev == null;
	}

	public static void inicializa() {
		contTable = 0;
		currentScope = root;
	}

	public static boolean inserir(String name, Simbolo s) {
		if (!currentScope.table.containsKey(name)) {
			currentScope.table.put(name, s);
			return true;
		}
		return false;
	}

	public static void inserirSimbolo(String name, Simbolo s) {
		TabelaDeSimbolos e = currentScope.prev;
		e.table.put(name, s);
	}

	public static boolean inserirVariavel(String name, Simbolo s) {
		if (!currentScope.table.containsKey(name)) {
			currentScope.table.put(name, s);
			currentScope.variables.add(name);
			return true;
		}
		return false;
	}

	public static Simbolo get(String name) {
		return get(name, currentScope);
	}
	
	public static Simbolo get(String name, TabelaDeSimbolos tab) {
		for (TabelaDeSimbolos t = tab; t != null; t = t.prev) {
			Simbolo s = (Simbolo) (t.table.get(name));
			if (s != null) {
				return s;
			}
		}
		return null;
	}

	static void push(TabelaDeSimbolos tab) {
		contTable++;
		currentScope = new TabelaDeSimbolos(tab);
	}

	public static void push() {
		push(currentScope);
	}

	public static void pop() {
		currentScope = currentScope.prev;
		contTable++;
	}

}