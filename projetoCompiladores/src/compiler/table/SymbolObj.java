package compiler.table;

import compiler.type.Type;

public class SymbolObj {

	Type type;
	String name;
	boolean constant;

	public SymbolObj(String name, Type type) {
		this(name, type, false);
	}

	public SymbolObj(String name, Type type, boolean constant) {
		this.name = name;
		this.type = type;
		this.constant = constant;
	}

	public Type getType() {
		return type;
	}

	public String getName() {
		return name;
	}

	public boolean isConstant() {
		return constant;
	}

}
