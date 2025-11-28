/* Nombre: miniLex.l
 * Enunciado: 
 * Autor: Juan Francisco Benavente Carzolio
 * Organización: Universidad de Burgos
 * Asignatura: Procesadores de Lenguaje
 * Versión: v0.7
 * Fecha última mod: 27/11/2025
 */
%{
#include "y.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%x COMML

%%

";"                     {return SEMICOLON;}
"si"                    {return SI;}
"sino"                  {return SINO;}
"hacer"                 {return HACER;}
"mientras"              {return MIENTRAS;}
"imprimir"              {return IMPRIMIR;}
"("                     {return LPAREN;}
")"                     {return RPAREN;}
"{"                     {return LLLAVE;}
"}"                     {return RLLAVE;}
"+"                     {return PLUS;}
"-"                     {return MINUS;}
"*"                     {return MULTI;}
"/"                     {return DIV;}
"="                     {return IGUAL;}
"+="                    {return PLUSIGUAL;}
"-="                    {return MINUSIGUAL;}
"*="                    {return MULTIIGUAL;}
"/="                    {return DIVIGUAL;}

[0-9]+ 		            {yylval.num = atoi(yytext); return NUM;}
[a-zA-Z_][a-zA-Z0-9_]*  {yylval.str = strdup(yytext); return ID;}


<COMML>"*/"     		{BEGIN(INITIAL);}
<*>"//"[^\n]*			{;}
<*>"/*" 			    {BEGIN(COMML);}

<*>\n			    	{;}
<*>" "                  {;}
.			        	{return yytext[0];}
<COMML>.		    	{;}
%%