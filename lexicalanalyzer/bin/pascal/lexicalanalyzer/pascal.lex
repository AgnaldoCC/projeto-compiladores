import java_cup.runtime.*;

%%

%{

	private Token createToken(String name, String value) {
		return new Token(name, value, yyline, yycolumn);
	}
	
	private Token createToken(String name){
		return new Token(name, yyline, yycolumn);
	}

%}

%public
%class LexicalAnalyzer
%type Token
%line
%column

letra = [a-zA-z]
digito = [0-9]
alfanum = {letra}|{digito}
id = {letra}({alfanum} | _)
inteiro = {digito}+
real = {inteiro}\.{inteiro}
inicioComentario = \{
fimComentario = \}
conteudoComentario = [^}]*
comentario = {inicioComentario}{conteudoComentario}{fimComentario}
brancos = [ \n\t]
char = '.'


program = "program"

%%

{program} { return createToken(yytext(), "");} 
{brancos} { return createToken("branco", yytext()); }
{comentario} { return createToken("comentario", yytext()); }
{inteiro} { return createToken("inteiro", yytext()); }
{id} { return createToken("id", yytext()); }
{real} { return createToken("real", yytext()); }
begin { return createToken("begin"); }
end { return createToken("end"); }
If { return createToken("If"); }
then { return createToken("then"); }
Else { return createToken("Else") ;}
and { return createToken("and"); }
case { return createToken("case"); }
or { return createToken("or"); }
of { return createToken("of"); }
Function { return createToken("function"); }
type { return createToken("type"); }
Goto { return createToken("goto"); }
for { return createToken("for"); }
while { return createToken("while"); }
var { return createToken("var"); }
Write { return createToken("printar"); }
Writeln { return createToken("printarPulandoLinha"); }
\; { return createToken("pontoeVirgula"); }
\: { return createToken("doisPontos"); }
\+ { return createToken("mais"); }
\- { return createToken("menos"); }
\* { return createToken("vezes"); }
\/ { return createToken("divisao"); }
\( { return createToken("abreParentese"); }
\) { return createToken("fechaParentese"); }
\[ { return createToken("abreColchete"); }
\] { return createToken("fechaColchete"); }
\, { return createToken("virgula"); }
\> { return createToken("maior"); }
\< { return createToken("menor"); }
\>= { return createToken("maiorIgual"); }
\<= { return createToken("menorIgual"); }
\!= { return createToken("diferente"); }
\:= { return createToken("atribuicao"); }
\. { return createToken("ponto"); }
{char} {return createToken("char", yytext()); }



. { throw new RuntimeException("Caractere inválido " + yytext() + " na linha " + yyline + ", coluna " +yycolumn); }
