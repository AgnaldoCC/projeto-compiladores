package compiler.table;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class TableOfSymbols {

	public static TableOfSymbols currentScope;
	static TableOfSymbols root = new TableOfSymbols(null);
	static int contTable;

	HashMap<String, SymbolObj> table;
	TableOfSymbols prev;
	List<String> variables;

	public TableOfSymbols(TableOfSymbols prev) {
		table = new HashMap<String, SymbolObj>();
		this.prev = prev;
		variables = new ArrayList<String>();
	}

	public static TableOfSymbols getRoot() {
		return root;
	}
	
	public boolean isRoot() {
		return prev == null;
	}

	public static void inicializa() {
		contTable = 0;
		currentScope = root;
	}

	public static boolean inserir(String name, SymbolObj s) {
		if (!currentScope.table.containsKey(name)) {
			currentScope.table.put(name, s);
			return true;
		}
		return false;
	}

	public static void inserirSimbolo(String name, SymbolObj s) {
		TableOfSymbols e = currentScope.prev;
		e.table.put(name, s);
	}

	public static boolean inserirVariavel(String name, SymbolObj s) {
		if (!currentScope.table.containsKey(name)) {
			currentScope.table.put(name, s);
			currentScope.variables.add(name);
			return true;
		}
		return false;
	}

	public static SymbolObj get(String name) {
		return get(name, currentScope);
	}
	
	public static SymbolObj get(String name, TableOfSymbols tab) {
		for (TableOfSymbols t = tab; t != null; t = t.prev) {
			SymbolObj s = (SymbolObj) (t.table.get(name));
			if (s != null) {
				return s;
			}
		}
		return null;
	}

	static void push(TableOfSymbols tab) {
		contTable++;
		currentScope = new TableOfSymbols(tab);
	}

	public static void push() {
		push(currentScope);
	}

	public static void pop() {
		currentScope = currentScope.prev;
		contTable++;
	}

}