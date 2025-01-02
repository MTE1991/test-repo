%{
#include <stdio.h>
#include<stdlib.h>
int ln=1;
%}

%%
[/][/][a-zA-Z0-9_,.!?:#@$%^& \t]*[\n] {printf("%s is a single line comment \n",yytext);}
[/][*][a-zA-Z0-9_,.!?:#@$%^& \t\n]*[*][/] {printf("%s is a multi line comment \n",yytext);}
["][a-zA-Z0-9_,.!?:#@$%^& \t]*["] {printf("%s is a literal \n",yytext);}
[0-9]+ {printf("%s is a int \n",yytext);}
[0-9]*[.][0-9]+ {printf("%s is a real number \n",yytext);}
"include"|"bits"|"stdc++"|"using"|"namespace"|"std"|"int"|"if"|"return" {printf("%s is a key word \n",yytext);}
[a-zA-Z_][a-zA-Z_0-9]* {printf("%s is a identifier \n",yytext);}
[(){}\[\]] {printf("%s is a bracket \n",yytext);}
[<>=!][=] {printf("%s is a relational operator \n",yytext);}
[+\-*/=<>] {printf("%s is a operator \n",yytext);}
[;.] {printf("%s is a puncuation \n",yytext);}
[ \t\n]+ {}
. {printf("%s is a unknown characer \n",yytext);}
%%
int yywrap(){}

int main(int argc,char **argv)
{
if(argc>1)
{
FILE *file=fopen(argv[1],"r");
if(!file)
{
perror("fopen");
return EXIT_FAILURE;
}
yyin=file;
}
yylex();
return 0;
}






