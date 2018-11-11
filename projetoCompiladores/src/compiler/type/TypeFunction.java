package compiler.type;

import java.util.ArrayList;
import java.util.List;

public class TypeFunction extends Type {

	Type returnType;
	List<Type> paramsType;

	public TypeFunction(Type returnType) {
		this(returnType, new ArrayList<Type>());
	}

	public TypeFunction(Type returnType, List<Type> params) {
		super(Type.FUNCAO, returnType.width, returnType.val);
		this.returnType = returnType;
		paramsType = params;
	}

	public void addParamType(List<Type> Type) {
		paramsType.addAll(Type);
	}

	public Type getTypeRetorno() {
		return returnType;
	}

	public void setTypeRetorno(Type Type) {
		returnType = Type;
	}

	public List<Type> getTypeParametros() {
		return paramsType;
	}

	public String getNome() {
		return val;
	}

}