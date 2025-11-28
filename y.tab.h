/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    NUM = 258,                     /* NUM  */
    SEMICOLON = 259,               /* SEMICOLON  */
    SI = 260,                      /* SI  */
    SINO = 261,                    /* SINO  */
    HACER = 262,                   /* HACER  */
    MIENTRAS = 263,                /* MIENTRAS  */
    IMPRIMIR = 264,                /* IMPRIMIR  */
    LPAREN = 265,                  /* LPAREN  */
    RPAREN = 266,                  /* RPAREN  */
    LLLAVE = 267,                  /* LLLAVE  */
    RLLAVE = 268,                  /* RLLAVE  */
    PLUS = 269,                    /* PLUS  */
    MINUS = 270,                   /* MINUS  */
    MULTI = 271,                   /* MULTI  */
    DIV = 272,                     /* DIV  */
    IGUAL = 273,                   /* IGUAL  */
    PLUSIGUAL = 274,               /* PLUSIGUAL  */
    MINUSIGUAL = 275,              /* MINUSIGUAL  */
    MULTIIGUAL = 276,              /* MULTIIGUAL  */
    DIVIGUAL = 277,                /* DIVIGUAL  */
    ID = 278                       /* ID  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define NUM 258
#define SEMICOLON 259
#define SI 260
#define SINO 261
#define HACER 262
#define MIENTRAS 263
#define IMPRIMIR 264
#define LPAREN 265
#define RPAREN 266
#define LLLAVE 267
#define RLLAVE 268
#define PLUS 269
#define MINUS 270
#define MULTI 271
#define DIV 272
#define IGUAL 273
#define PLUSIGUAL 274
#define MINUSIGUAL 275
#define MULTIIGUAL 276
#define DIVIGUAL 277
#define ID 278

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 26 "miniComp.y"

  int num;
  char *str;

#line 118 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
