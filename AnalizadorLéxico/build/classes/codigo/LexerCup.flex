package codigo; 
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
N=[0-9]+
espacio = [ \t\r\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%
( "String" )     {return new Symbol(sym.String, yychar, yyline, yytext());}
"class"          {return new Symbol(sym.Class, yychar, yyline, yytext());}
"java\\.until"   {return new Symbol(sym.Java_until, yychar, yyline, yytext());}
"main"           {return new Symbol(sym.Main, yychar, yyline, yytext());}
"args"           {return new Symbol(sym.Args, yychar, yyline, yytext());}
"public"         {return new Symbol(sym.Public, yychar, yyline, yytext());}
"void"           {return new Symbol(sym.Void, yychar, yyline, yytext());}
"import"         {return new Symbol(sym.Import, yychar, yyline, yytext());}
"case"           {return new Symbol(sym.Case, yychar, yyline, yytext());}
"this"           {return new Symbol(sym.This, yychar, yyline, yytext());}
"false"          {return new Symbol(sym.False, yychar, yyline, yytext());}
"int"            {return new Symbol(sym.Int, yychar, yyline, yytext());}
"continue"       {return new Symbol(sym.Continue, yychar, yyline, yytext());}
"break"          {return new Symbol(sym.Break, yychar, yyline, yytext());}
"true"           {return new Symbol(sym.True, yychar, yyline, yytext());}
"double"         {return new Symbol(sym.Double, yychar, yyline, yytext());}
"float"          {return new Symbol(sym.Float, yychar, yyline, yytext());}
"default"        {return new Symbol(sym.Default, yychar, yyline, yytext());}
"try"            {return new Symbol(sym.Try, yychar, yyline, yytext());}
"protected"      {return new Symbol(sym.Protected, yychar, yyline, yytext());}
"if"             {return new Symbol(sym.If_condicional, yychar, yyline, yytext());}
"else"           {return new Symbol(sym.Else_condicional, yychar, yyline, yytext());}
"switch"         {return new Symbol(sym.Switch_condicional, yychar, yyline, yytext());}
"for"            {return new Symbol(sym.For_ciclo, yychar, yyline, yytext());}
"while"          {return new Symbol(sym.While_ciclo, yychar, yyline, yytext());}
system println   {return new Symbol(sym.System_Println, yychar, yyline, yytext());}
printf           {return new Symbol(sym.Printf, yychar, yyline, yytext());}
scanf            {return new Symbol(sym.Scanf, yychar, yyline, yytext());}
"+"              {return new Symbol(sym.Suma, yychar, yyline, yytext());}
"-"              {return new Symbol(sym.Resta, yychar, yyline, yytext());}
"*"              {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}
"/"              {return new Symbol(sym.Division, yychar, yyline, yytext());}
"="              {return new Symbol(sym.Igual, yychar, yyline, yytext());}
( "\"" )         {return new Symbol(sym.Comillas, yychar, yyline, yytext());} 
"("              {return new Symbol(sym.Parentesis_I, yychar, yyline, yytext());}
")"              {return new Symbol(sym.Parentesis_D, yychar, yyline, yytext());}
"{"              {return new Symbol(sym.Llave_I, yychar, yyline, yytext());}
"}"              {return new Symbol(sym.Llave_D, yychar, yyline, yytext());} 
( "[" )          {return new Symbol(sym.Corchete_I, yychar, yyline, yytext());}
( "]" )          {return new Symbol(sym.Corchete_D, yychar, yyline, yytext());} 
";"              {return new Symbol(sym.Fin, yychar, yyline, yytext());}
( byte |  char | long )                                 {return new Symbol(sym.T_dato, yychar, yyline, yytext());} 
( "&&" | "||" | "!" | "&" | "|" )                       {return new Symbol(sym.Op_logico, yychar, yyline, yytext());} 
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.Op_relacional, yychar, yyline, yytext());} 
( "+=" | "-="  | "*=" | "/=" | "%=" )                   {return new Symbol(sym.Op_atribucion, yychar, yyline, yytext());} 
( "++" | "--" )                                         {return new Symbol(sym.Op_incremento, yychar, yyline, yytext());}
(true | false)                                          {return new Symbol(sym.Op_booleano, yychar, yyline, yytext());} 
{L}({L}|{N})*    {return new Symbol(sym.Identificador, yychar, yyline, yytext());}
("(-"{N}+")")|{N}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}
. {return new Symbol(sym.ERROR, yychar, yyline, yytext());}

