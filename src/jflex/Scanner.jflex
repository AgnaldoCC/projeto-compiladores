package com.ufcg.compilador;

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
array = "array ""["{inteiro}".."{inteiro}"] "

%%

<YYINITIAL> {
	"Program" { return new Symbol(sym.PROGRAMA); }
	"Begin" { return new Symbol(sym.BEGIN); }
	"End" { return new Symbol(sym.END); }
	"and" { return new Symbol(sym.AND); }
	"case" { return new Symbol(sym.CASE); }
	"or" { return new Symbol(sym.OR); }
	"of" { return new Symbol(sym.OF); }
	"Function" { return new Symbol(sym.FUNCTION); }
	"Procedure" { return new Symbol(sym.PROCEDURE); }
	"type" { return new Symbol(sym.TYPE); }
	"Goto" { return new Symbol(sym.GOTO); }
	"Var" { return new Symbol(sym.VAR); }
	"Write" { return new Symbol(sym.WRITE); }
	"Writeln" { return new Symbol(sym.WRITELN); }
	"with" { return new Symbol(sym.WITH); }
	"do" { return new Symbol(sym.DO); }
	"In"  { return new Symbol(sym.IN); }
	"uses" { return new Symbol(sym.USES); }
	"Integer" { return new Symbol(sym.TIPO_INTEGER); }
	"Real" { return new Symbol(sym.TIPO_REAL); }
	"Char" { return new Symbol(sym.TIPO_CHAR); }
	"Double" { return new Symbol(sym.TIPO_DOUBLE); }
	"Boolean" { return new Symbol(sym.TIPO_BOOLEAN); }
	"String" { return new Symbol(sym.TIPO_STRING); }
	"Byte" { return new Symbol(sym.TIPO_BYTE); }
	"true" { return new Symbol(sym.TRUE, true);}
	"false" { return new Symbol(sym.FALSE, false);}
	\! { return new Symbol(sym.NOT) ;}
	\; { return new Symbol(sym.PONTO_VIRGULA); }
	\: { return new Symbol(sym.DOIS_PONTOS); }
	\+ { return new Symbol(sym.ADICAO); }
	\- { return new Symbol(sym.SUBTRACAO); }
	\* { return new Symbol(sym.MULTIPLICACAO); }
	\/ { return new Symbol(sym.DIVISAO); }
	\( { return new Symbol(sym.ABRE_PARENTESE); }
	\) { return new Symbol(sym.FECHA_PARENTESE); }
	\[ { return new Symbol(sym.ABRE_COLCHETE); }
	\] { return new Symbol(sym.FECHA_COLCHETE); }
	\, { return new Symbol(sym.VIRGULA); }
	\> { return new Symbol(sym.MAIOR); }
	\< { return new Symbol(sym.MENOR); }
	\>= { return new Symbol(sym.MAIOR_IGUAL); }
	\<= { return new Symbol(sym.MENOR_IGUAL); }
	\<> { return new Symbol(sym.DIFERENTE); }
	\:= { return new Symbol(sym.ATRIBUICAO); }
	\. { return new Symbol(sym.PONTO); }
	{brancos} { } 
	{comentario} { }
	{array} { return new Symbol(sym.ARRAY); }
	{inteiro} { return new Symbol(sym.INTEGER, new Integer(Integer.parseInt(yytext()))); }
	{id} { return new Symbol(sym.ID, yytext()); }
	{real} { return new Symbol(sym.REAL, yytext()); }
	{string} { return new Symbol(sym.STRING, yytext()); }
	
}

<<EOF>> { return new Symbol(sym.EOF); }

. { throw new RuntimeException("Caractere inv�lido " + yytext() + " na linha " + yyline + ", coluna " +yycolumn); }
