parser: lex.yy.c grammar.tab.c parser.c hash.h hash.c var.h command.h command.c
	gcc -o parser lex.yy.c grammar.tab.c parser.c hash.c command.c -ll

lex.yy.c : grammar.lex
	flex grammar.lex

grammar.tab.c grammar.tab.h : grammar.y
	bison -d grammar.y
