grammar SimpleCalc;

prog :		stat+;
stat :		expr NEWLINE
	|	Literal '=' expr
	|	NEWLINE;
    
expr: multAndDiv (('+' | '-') multAndDiv) * ';' *;
multAndDiv: var (('*' | '/') var) * ';' *;

var 	:	INT
	|	Literal
	|	'(' expr ')';

Literal 	:	('a'..'z'|'A'..'Z')+;
INT 	:	'0'..'9'+;
NEWLINE :	'\r'?'\n';
WHITESPACE : ( ' ' | ' \t ' | '\n' | '\r')+ -> channel(HIDDEN);
