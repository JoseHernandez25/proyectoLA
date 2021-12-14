package Codigo;
import static Codigo.Tokens.*;
%%	
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%
principal {lexeme=yytext(); return Principal;}
clase {lexeme=yytext(); return Clase;}
publico {lexeme=yytext(); return Publico;}
entero {lexeme=yytext(); return Entero;}
caracter {lexeme=yytext(); return Caracter;}
privado {lexeme=yytext(); return Privado;}
entonces {lexeme=yytext(); return Entonces;}
ademas {lexeme=yytext(); return Ademas;}
para {lexeme=yytext(); return Para;}
mientras {lexeme=yytext(); return Mientras;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"\n" {lexeme=yytext(); return Linea}
"(" {lexeme=yytext(); return AbreParentesis;}
")" {lexeme=yytext(); return CierraParentesis;}
"{" {lexeme=yytext(); return Llave_a;}
"}" {lexeme=yytext(); return Llave_c;}
";" {lexeme=yytext(); return P_Coma;}
">" {lexeme=yytext(); return MayorQue;}
"<" {lexeme=yytext(); return MenorQue;}
"=" {lexeme=yytext(); return Igual;}
"+" {lexeme=yytext(); return Suma;}
"-" {lexeme=yytext(); return Resta;}
"*" {lexeme=yytext(); return Multiplicacion;}
"/" {lexeme=yytext(); return Division;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
.  {lexeme=yytext();  return ERROR;}