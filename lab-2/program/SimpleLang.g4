grammar SimpleLang;

prog: stat+ ;

stat: expr NEWLINE ;

expr: numExpr											 # NumExpres
    | STRING                       # String
    | BOOL                         # Bool
    | '(' expr ')'                 # Parens
		| STRING op='++' STRING				 # Concat
    ;

numExpr: numExpr op='**' numExpr   # Expon
    | numExpr op=('*'|'/') numExpr # MulDiv
    | numExpr op=('+'|'-') numExpr # AddSub
    | INT                          # Int
    | FLOAT                        # Float
		;


INT: [0-9]+ ;
FLOAT: [0-9]+'.'[0-9]* ;
STRING: '"' .*? '"' ;
BOOL: 'true' | 'false' ;
NEWLINE: '\r'? '\n' ;
WS: [ \t]+ -> skip ;
