%{
#include <stdio.h>
#include <stdlib.h>
int ln = 1;
%}

%option noyywrap

%%
"sizeof"|"main"|"if"|"else"|"else if"|"int"|"char"|"float"|"double"|"printf"|"for"|"while"|"do" {printf("KEYWORD: %s\n", yytext);}
[0-9]+\.[0-9]+([eE][-+]?[0-9]+)? {printf("FLOATING POINT NUMBER: %s\n", yytext);}
[0-9]+ {printf("NUMBER (INTEGER): %s\n", yytext);}
[0-9]+[a-zA-Z][a-zA-z0-9_]* {printf("INVALID IDENTIFIER: %s\n", yytext);}
[a-zA-Z][a-zA-z0-9_]* {printf("IDENTIFIER: %s\n", yytext);}
[+\-*/%><=] {printf("OPERATOR: %s\n", yytext);}
[ \t] {/* Ignore whitespaces, tabs*/}
[\n] {ln++;}
[\(\)\{\}\[\]] {printf("BRACKET: %s\n", yytext);}
["][a-zA-Z0-9_,.!?:#@$%^& \t]*["] {printf("STRING LITERAL: %s\n", yytext);}
; {printf("END OF STATEMENT (SEMICOLON): %s\n", yytext);}
"//".* { /* Skip single-line comments */ }
. {printf("UNKNOWN SYMBOL: %s at line %d\n", yytext, ln);}
%%

int main() {
    yylex();
    return 0;
}
