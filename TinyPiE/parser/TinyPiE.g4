// antlr4 -package parser -o antlr-generated  -no-listener parser/TinyPiE.g4
grammar TinyPiE;

expr: addExpr
      ;

addExpr: addExpr ADDOP bitExpr
	| bitExpr
	;

bitExpr: bitExpr BITOP mulExpr
	| mulExpr
	;

mulExpr: mulExpr MULOP unaryExpr
	| unaryExpr
	;

unaryExpr: VALUE			# literalExpr
	| IDENTIFIER			# varExpr
	| '(' expr ')'			# parenExpr
	;

ADDOP: '+'|'-';
BITOP: '&'|'|';
MULOP: '*'|'/';

IDENTIFIER: 'x'|'y'|'z';
VALUE: [1-9] ([0-9]*);
WS: [ \t\r\n] -> skip;
