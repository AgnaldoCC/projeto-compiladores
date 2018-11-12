package compiler.tipo;

import java.util.ArrayList;
import java.util.List;

public class TipoFuncoes extends Tipo {

	Tipo returnType;
	List<Tipo> paramsType;

	public TipoFuncoes(Tipo returnType) {
		this(returnType, new ArrayList<Tipo>());
	}

	public TipoFuncoes(Tipo returnType, List<Tipo> params) {
		super(Tipo.FUNCAO, returnType.width, returnType.val);
		this.returnType = returnType;
		paramsType = params;
	}

	public void addParamType(List<Tipo> Type) {
		paramsType.addAll(Type);
	}

	public Tipo getTypeRetorno() {
		return returnType;
	}

	public void setTypeRetorno(Tipo Type) {
		returnType = Type;
	}

	public List<Tipo> getTypeParametros() {
		return paramsType;
	}

	public String getNome() {
		return val;
	}

}