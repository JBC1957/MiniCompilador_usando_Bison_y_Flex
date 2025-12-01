# miniComp – Mini compilador en Lex/Bison

Proyecto de un **mini–compilador** desarrollado para la asignatura **Procesadores de Lenguaje** de la **Universidad de Burgos**.  
Autor: **Juan Francisco Benavente Carzolio**  
Versión: **v0.7** (últ. modificación: 27/11/2025)

El objetivo del proyecto es implementar el **analizador léxico** y el **analizador sintáctico** de un lenguaje imperativo sencillo, con una sintaxis similar a C, sobre el que se pueden escribir pequeños programas de prueba.

Actualmente el compilador se centra en:

- **Reconocer los tokens** del lenguaje (identificadores, números, operadores, etc.).
- **Comprobar la corrección sintáctica** de los programas de entrada.
- Informar de **errores léxicos/sintácticos** mediante mensajes comprensibles.

No genera aún código máquina ni código intermedio; su función principal es **validar** que la entrada cumple la gramática especificada en la práctica.


## Estructura del proyecto

- `miniLex.l`  
  Fichero de **Flex/Lex** que define el **analizador léxico**:
  - Reconoce números enteros (`NUM`).
  - Reconoce identificadores (`ID`).
  - Reconoce operadores, incluyendo `"/="` (token `DIVIGUAL`) y otros operadores definidos en la práctica.
  - Ignora espacios en blanco y saltos de línea.
  - Gestiona comentarios:
    - Comentarios de línea: `// ...`
    - Comentarios de bloque: `/* ... */` (usando el estado `COMML`).

- `miniComp.y`  
  Fichero de **Bison/Yacc** que define el **analizador sintáctico**:
  - Declara los tokens que recibe desde el léxico.
  - Define la gramática del mini–lenguaje (expresiones, sentencias, etc.).
  - Implementa la función `yyerror` para informar de errores:
    ```c
    void yyerror(char *s)
    {
      fprintf(stderr, "Error sintáctico: %s\n", s);
    }
    ```
  - Define un `main` mínimo que simplemente invoca `yyparse()`:
    ```c
    int main(void)
    {
      return yyparse();
    }
    ```


## Requisitos

Para compilar y ejecutar el proyecto se recomienda un entorno tipo **Unix/Linux** con:

- [x] `flex` o `lex`
- [x] `bison` o `yacc`
- [x] `gcc` (u otro compilador C compatible)

En la mayoría de distribuciones Linux bastará con instalar los paquetes:

```bash
sudo apt-get install flex bison gcc    # Debian/Ubuntu
# o equivalente en tu distribución
```
## Como compilar el código
Desde el directorio donde están miniLex.l y miniComp.y:
```bash
# 1. Generar el parser (analizador sintáctico) con Bison
bison -d miniComp.y          # genera y.tab.c y y.tab.h

# 2. Generar el lexer (analizador léxico) con Flex
flex miniLex.l               # genera lex.yy.c

# 3. Compilar y enlazar ambos ficheros C en un ejecutable
gcc y.tab.c lex.yy.c -o miniComp -lfl
```
En algunos sistemas puede ser necesario usar -ll en lugar de -lfl:
```bash
gcc y.tab.c lex.yy.c -o miniComp -ll
```
