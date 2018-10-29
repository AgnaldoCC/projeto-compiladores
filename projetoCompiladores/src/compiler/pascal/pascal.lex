package compiler.pascal;

import jflex.sym;
import java_cup.runtime.Symbol;


%%



%cup
%public
%class LexicalAnalyzer
%line
%column

letra = [a-zA-z]
digito = [0-9]
alfanum = {letra}|{digito}
id = {letra}({alfanum}|_)*
inteiro = {digito}+
real = {inteiro}\.{inteiro}
inicioComentario = \{
fimComentario = \}
conteudoComentario = [^}]*
conteudoString = [^\"]*
comentario = {inicioComentario}{conteudoComentario}{fimComentario}
brancos = [ \n\t\r\s]
string = \"{conteudoString}\"

%%

<YYINITIAL> {
	"Program" { return new Symbol(Sym.PROGRAMA); }
	"Begin" { return new Symbol(Sym.BEGIN); }
	"End" { return new Symbol(Sym.END); }
	"and" { return new Symbol(Sym.AND); }
	"case" { return new Symbol(Sym.CASE); }
	"or" { return new Symbol(Sym.OR); }
	"of" { return new Symbol(Sym.OF); }
	"Function" { return new Symbol(Sym.FUNCTION); }
	"Procedure" { return new Symbol(Sym.PROCEDURE); }
	"type" { return new Symbol(Sym.TYPE); }
	"Goto" { return new Symbol(Sym.GOTO); }
	"Var" { return new Symbol(Sym.VAR); }
	"Write" { return new Symbol(Sym.WRITE); }
	"Writeln" { return new Symbol(Sym.WRITELN); }
	"array" { return new Symbol(Sym.ARRAY); }
	"with" { return new Symbol(Sym.WITH); }
	"do" { return new Symbol(Sym.DO); }
	"In"  { return new Symbol(Sym.IN); }
	"uses" { return new Symbol(Sym.USES); }
	"Integer" { return new Symbol(Sym.TIPO_INTEGER); }
	"Real" { return new Symbol(Sym.TIPO_REAL); }
	"Char" { return new Symbol(Sym.TIPO_CHAR); }
	"Double" { return new Symbol(Sym.TIPO_DOUBLE); }
	"Boolean" { return new Symbol(Sym.TIPO_BOOLEAN); }
	"String" { return new Symbol(Sym.TIPO_STRING); }
	"Byte" { return new Symbol(Sym.TIPO_BYTE); }
	"true" { return new Symbol(Sym.TRUE, true);}
	"false" { return new Symbol(Sym.FALSE, false);}
	\; { return new Symbol(Sym.PONTO_VIRGULA); }
	\: { return new Symbol(Sym.DOIS_PONTOS); }
	\+ { return new Symbol(Sym.ADICAO); }
	\- { return new Symbol(Sym.SUBTRACAO); }
	\* { return new Symbol(Sym.MULTIPLICACAO); }
	\/ { return new Symbol(Sym.DIVISAO); }
	\( { return new Symbol(Sym.ABRE_PARENTESE); }
	\) { return new Symbol(Sym.FECHA_PARENTESE); }
	\[ { return new Symbol(Sym.ABRE_COLCHETE); }
	\] { return new Symbol(Sym.FECHA_COLCHETE); }
	\, { return new Symbol(Sym.VIRGULA); }
	\> { return new Symbol(Sym.MAIOR); }
	\< { return new Symbol(Sym.MENOR); }
	\>= { return new Symbol(Sym.MAIOR_IGUAL); }
	\<= { return new Symbol(Sym.MENOR_IGUAL); }
	\<> { return new Symbol(Sym.DIFERENTE); }
	\:= { return new Symbol(Sym.ATRIBUICAO); }
	\. { return new Symbol(Sym.PONTO); }
	{brancos} { } 
	{comentario} { }
	{inteiro} { return new Symbol(Sym.INTEGER, new Integer(Integer.parseInt(yytext()))); }
	{id} { return new Symbol(Sym.ID, yytext()); }
	{real} { return new Symbol(Sym.REAL, yytext()); }
	{string} { return new Symbol(Sym.STRING, yytext()); }
	
}

<<EOF>> { return new Symbol(Sym.EOF); }

. { throw new RuntimeException("Caractere inválido " + yytext() + " na linha " + yyline + ", coluna " +yycolumn); }
