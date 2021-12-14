package Codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
 private Symbol symbol(int type, Object value){
 return new Symbol(type, yyline, yycolumn, value);
 }
 private Symbol symbol(int type){
 return new Symbol(type, yyline, yycolumn);
 }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}
/* Comentarios */
( "//"(.)* ) {/*Ignore*/}
/* Palabra Reservada Principal */
( principal ) {return new Symbol(sym.Principal, yychar, yyline, yytext());}
/* Palabra Reservada Clase */
( clase ) {return new Symbol(sym.Clase, yychar, yyline, yytext());}
/* Palabra Reservada Publico */
( publico ) {return new Symbol(sym.Publico, yychar, yyline, yytext());}
/* Tipos de datos */
( entero ) {return new Symbol(sym.Entero, yychar, yyline, yytext());}
/* Palabra reservada Caracter */
( caracter ) {return new Symbol(sym.Caracter, yychar, yyline, yytext());}
/* Palabra reservada Privado */
( privado ) {return new Symbol(sym.Privado, yychar, yyline,yytext());}
/* Palabra reservada Entonces */
( entonces ) {return new Symbol(sym.Entonces, yychar, yyline,yytext());}
/* Palabra reservada Ademas */
( ademas ) {return new Symbol(sym.Ademas, yychar, yyline,yytext());}
/* Palabra reservada Para */
( para ) {return new Symbol(sym.Para, yychar, yyline,yytext());}
/* Palabra reservada Mientras */
( mientras ) {return new Symbol(sym.Mientras, yychar, yyline,yytext());}
/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.AbreParentesis, yychar, yyline,yytext());}
/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.CierraParentesis, yychar, yyline,yytext());}
/* Llave de apertura */
( "{" ) {return new Symbol(sym.Llave_a, yychar, yyline,yytext());}
/* Llave de cierre */
( "}" ) {return new Symbol(sym.Llave_c, yychar, yyline,yytext());}
/* Punto y coma */
( ";" ) {return new Symbol(sym.P_coma, yychar, yyline,yytext());}
/* Mayor que */
( ">" ) {return new Symbol(sym.MayorQue, yychar, yyline,yytext());}
/* Menor Que */
( "<" ) {return new Symbol(sym.MenorQue, yychar, yyline,yytext());}
/* Operador Igual */
( "=" ) {return new Symbol(sym.Igual, yychar, yyline, yytext());}
/* Operador Suma */
( "+" ) {return new Symbol(sym.Suma, yychar, yyline, yytext());}
/* Operador Resta */
( "-" ) {return new Symbol(sym.Resta, yychar, yyline, yytext());}
/* Operador Multiplicacion */
( "*" ) {return new Symbol(sym.Multiplicacion, yychar, yyline,yytext());}
/* Operador Division */
( "/" ) {return new Symbol(sym.Division, yychar, yyline,yytext());}
/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar,yyline, yytext());}
/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar,yyline, yytext());}
/* Error de analisis */
. {return new Symbol(sym.ERROR, yychar, yyline, yytext());}

