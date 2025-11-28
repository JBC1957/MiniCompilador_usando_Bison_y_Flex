/* Nombre: miniComp.y
 * Enunciado: 
 * Autor: Juan Francsico Benavente Carzolio
 * Organización: Universidad de Burogs
 * Asignatura: Procesadores de Lenguaje
 * Versión: v0.7
 * Fecha última mod: 27/11/2025
 */
%{
#include<stdio.h>

/* Prototipos de funciones que vienen de fuera */
int yylex();
void yyerror(char *s);
int yydebug =1;

int nuevaEtiqueta(){
  static int contador=0;
  return contador++;
}
%}

%token<num> NUM
%token<str> SEMICOLON SI SINO HACER MIENTRAS IMPRIMIR LPAREN RPAREN LLLAVE RLLAVE PLUS MINUS MULTI DIV IGUAL PLUSIGUAL MINUSIGUAL MULTIIGUAL DIVIGUAL ID

%union {
  int num;
  char *str;
}

%%
list_stncs: 
    sntnc SEMICOLON list_stncs 
  | sntnc SEMICOLON ;

sntnc:
    sel_stmt 
  | iter_stmt 
  | assig_stmt 
  | print_stmt 
  | error { fprintf(stderr, "Error general encontrado\n");} ;

expr:
    expr PLUS multi_expr {printf("\tsum\n");}
  | expr MINUS multi_expr {printf("\tsub\n");}
  | multi_expr ;

val: 
    NUM {printf("\tmete %d\n", $<num>1);} 
  | ID {printf("\tvalord %s\n", $1); free($1);}
  | LPAREN expr RPAREN ;

multi_expr: 
    multi_expr DIV val {printf("\tdiv\n");}
  | multi_expr MULTI val {printf("\tmul\n");}
  | val ;

print_stmt: 
  IMPRIMIR LPAREN expr RPAREN {printf("\tprint\n");} ;

sel_stmt: 
  SI {$<num>$=nuevaEtiqueta();} LPAREN expr RPAREN {printf("\tsifalsovea LBL%d\n",$<num>2);} 
  LLLAVE list_stncs RLLAVE sino ;

sino:
    {$<num>$ = nuevaEtiqueta();} SINO {printf("\tvea LBL%d\n", $<num>1); printf("LBL%d\n", $<num>-7);} LLLAVE list_stncs RLLAVE {printf("LBL%d\n", $<num>1);}
  | {printf("LBL%d\n", $<num>-7);}
  ;

iter_stmt: 
    {$<num>$ = nuevaEtiqueta();} MIENTRAS {printf("LBL%d\n", $<num>1);} LPAREN expr RPAREN {$<num>$ = nuevaEtiqueta(); printf("\tsifalsovea LBL%d\n", $<num>$);} LLLAVE list_stncs RLLAVE {printf("\tvea LBL%d\n", $<num>1); printf("LBL%d\n", $<num>7);}
  | {$<num>$ = nuevaEtiqueta();} HACER {printf("LBL%d\n", $<num>1);} LLLAVE list_stncs RLLAVE MIENTRAS LPAREN expr RPAREN {printf("\tsiciertovea LBL%d\n", $<num>1);};

assig_stmt: 
    ID {printf("\tvalori %s\n", $1);} IGUAL expr {printf("\tasigna\n");}
  | ID {printf("\tvalori %s\n", $1); printf("\tvalord %s\n", $1);} PLUSIGUAL expr {printf("\tsum\n"); printf("\tasigna\n");}
  | ID {printf("\tvalori %s\n", $1); printf("\tvalord %s\n", $1);} MINUSIGUAL expr {printf("\tsub\n"); printf("\tasigna\n");}
  | ID {printf("\tvalori %s\n", $1); printf("\tvalord %s\n", $1);} MULTIIGUAL expr {printf("\tmul\n"); printf("\tasigna\n");}
  | ID {printf("\tvalori %s\n", $1); printf("\tvalord %s\n", $1);} DIVIGUAL expr {printf("\tdiv\n"); printf("\tasigna\n");};


%%

/* Definición de yyerror */
void yyerror(char *s)
{
  fprintf(stderr, "Error sintáctico: %s\n", s);
}

/* main sencillito para arrancar el parser */
int main(void)
{
  return yyparse();
}