package codigo; 
import static codigo.Tokens.*;

%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
N=[0-9]+
espacio=[ \t\r]+

%{
    // Variable para almacenar el lexema actual
    public String lexeme;
%}

%%
{espacio} {/* Ignorar espacios en blanco, tabulaciones y retornos de carro */}
"//".* {/* Ignorar comentarios de una línea */}
"/*" ([^*]|\*+[^*/])* "*"+ "/"  // Ignorar comentarios multilínea
"\n" {lexeme=yytext(); return Linea;}
( "String" )     {lexeme=yytext(); return String;}
"class"          { lexeme = yytext(); return Class; }
"java\\.until"   { lexeme = yytext(); return Java_until; }
"main"           { lexeme = yytext(); return Main; }
"args"           { lexeme = yytext(); return Args; }
"public"         { lexeme = yytext(); return Public; }
"void"           { lexeme = yytext(); return Void; }
"import"         { lexeme = yytext(); return Import; }
"case"           { lexeme = yytext(); return Case; }
"this"           { lexeme = yytext(); return This; }
"false"          { lexeme = yytext(); return False; }
"int"            { lexeme = yytext(); return Int; }
"continue"       { lexeme = yytext(); return Continue; }
"break"          { lexeme = yytext(); return Break; }
"true"           { lexeme = yytext(); return True; }
"double"         { lexeme = yytext(); return Double; }
"float"          { lexeme = yytext(); return Float; }
"default"        { lexeme = yytext(); return Default; }
"try"            { lexeme = yytext(); return Try; }
"protected"      { lexeme = yytext(); return Protected; }
"if"             { lexeme = yytext(); return If_condicional; }
"else"           { lexeme = yytext(); return Else_condicional; }
"switch"         { lexeme = yytext(); return Switch_condicional; }
"for"            { lexeme = yytext(); return For_ciclo; }
"while"          { lexeme = yytext(); return While_ciclo; }
system println   { lexeme = yytext(); return System_Println;}
printf           { lexeme = yytext(); return Printf;}
scanf            { lexeme = yytext(); return Scanf;}
"+"              { lexeme = yytext(); return Suma;} // Operador de suma
"-"              { lexeme = yytext(); return Resta;} // Operador de resta
"*"              { lexeme = yytext(); return Multiplicacion;} // Operador de multiplicación
"/"              { lexeme = yytext(); return Division;} // Operador de división
"="              { lexeme = yytext(); return Igual;} // Operador de asignación
( "\"" )         { lexeme = yytext(); return Comillas;}
"("              { lexeme = yytext(); return Parentesis_I;}
")"              { lexeme = yytext(); return Parentesis_D;}
"{"              { lexeme = yytext(); return Llave_I;}
"}"              { lexeme = yytext(); return Llave_D;}
( "[" )          { lexeme = yytext(); return Corchete_I;}
( "]" )          { lexeme = yytext(); return Corchete_D;}
";"              { lexeme = yytext(); return Fin;}
( byte |  char | long )                                 {lexeme = yytext(); return T_dato;}
( "&&" | "||" | "!" | "&" | "|" )                       {lexeme = yytext(); return Op_logico;}
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return Op_relacional;}
( "+=" | "-="  | "*=" | "/=" | "%=" )                   {lexeme = yytext(); return Op_atribucion;}
( "++" | "--" )                                         {lexeme = yytext(); return Op_incremento;}
(true | false)                                          {lexeme = yytext(); return Op_booleano;}
{L}({L}|{N})*                                           {lexeme = yytext(); return Identificador;}
("(-"{N}+")")|{N}+                                      {lexeme = yytext(); return Numero;}
. {return ERROR;}






