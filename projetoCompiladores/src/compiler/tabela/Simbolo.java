package compiler.tabela;

import compiler.tipo.Tipo;

public class Simbolo {

	Tipo type;
	String name;
	boolean constant;

	public Simbolo(String name, Tipo type) {
		this(name, type, false);
	}

	public Simbolo(String name, Tipo type, boolean constant) {
		this.name = name;
		this.type = type;
		this.constant = constant;
	}

	public Tipo getType() {
		return type;
	}

	public String getName() {
		return name;
	}

	public boolean isConstant() {
		return constant;
	}

}
