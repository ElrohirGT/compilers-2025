grammar SimpleLang;

prog: stat+ ;

stat: expr NEWLINE ;

expr: expr op='**' expr						 # Expon
    | expr op=('*'|'/') expr			 # MulDiv
    | expr op=('+'|'-') expr			 # AddSub
    | INT                          # Int
    | FLOAT                        # Float
    | STRING                       # String
    | BOOL                         # Bool
    | '(' expr ')'                 # Parens
		| expr op='++' expr						 # Concat
    ;

INT: [0-9]+ ;
FLOAT: [0-9]+'.'[0-9]* ;
STRING: '"' .*? '"' ;
BOOL: 'true' | 'false' ;
NEWLINE: '\r'? '\n' ;
WS: [ \t]+ -> skip ;
