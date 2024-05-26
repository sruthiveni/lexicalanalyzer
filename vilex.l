%{
int COMMENT=0;
%}
identifier [a-zA-Z][a-zA-Z0-9]*
%%
#.* { printf(&quot;\n%s is a PREPROCESSOR DIRECTIVE&quot;,yytext);}
int |
float |
char |
double |
while |
for |
do |
if |
break |
continue |
void |
switch |
case |
long |
struct |
const |
typedef |
return |
else |
goto {printf(&quot;\n\t%s is a KEYWORD&quot;,yytext);}
&quot;/*&quot; {COMMENT = 1;}
&quot;*/&quot; {COMMENT = 0;}
\)(\;)? {if(!COMMENT) printf(&quot;\n\t&quot;);ECHO;printf(&quot;\n&quot;);}
\( ECHO;
= {if(!COMMENT)printf(&quot;\n\t%s is an ASSIGNMENT OPERATOR&quot;,yytext);}
\&lt;= |
\&gt;= |
\&lt; |
== |
\&gt; {if(!COMMENT) printf(&quot;\n\t%s is a RELATIONAL OPERATOR&quot;,yytext);}
%%
int main(int argc,char **argv)
{
if (argc &gt; 1)
{
FILE *file;
file = fopen(argv[1],&quot;r&quot;);
if(!file)
{
printf(&quot;could not open %s \n&quot;,argv[1]);
exit(0);
}
yyin = file;
}
yylex();
printf(&quot;\n\n&quot;);
return 0;
} int yywrap()
{
return 0;
}
