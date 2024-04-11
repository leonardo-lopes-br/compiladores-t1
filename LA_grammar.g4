lexer grammar LA_grammar;

// Todas as palavras chave da linguagem
PALAVRA_CHAVE: 'algoritmo' | 'declare' | 'procedimento' | 'var' | 'fim_procedimento' | 'retorne' | 'funcao' | 'fim_funcao' | 'literal' | 'inteiro' | 'real' | 'logico' | 'leia' | 'escreva' | 'se' | 'entao' | 'senao' | 'fim_se' | 'fim_para' |  'para' | 'faca' | 'ate' | 'caso' | 'seja' | 'fim_caso' | 'enquanto' | 'fim_enquanto' | 'registro' | 'fim_registro' | 'tipo' | 'constante' | 'fim_algoritmo';

// Simbolos especiais da linguagem
ABRE_PARENTESES: '('; 
FECHA_PARENTESES: ')';
ABRE_COLCHETES: '[';
FECHA_COLCHETES: ']';
VIRGULA: ',';
DOIS_PONTOS: ':';
DOIS_PONTOS_FINAIS: '..';
PONTO: '.';
PONTEIRO: '^';
ATRIBUICAO: '<-';
REFERENCIA: '&';

// Operadores logicos e valores booleanos
OPERADOR_LOGICO: 'e' | 'ou' | 'nao';
VALOR_BOOLEANO: 'falso' | 'verdadeiro';

// Variaveis e strings
IDENT: [a-zA-Z_] [a-zA-Z0-9_]*;
CADEIA: '"' (ESC_SEQ | ~('"' | '\\' | '\n'))* '"';

// Padrao para reconhecer um erro de cadeia nao fechada
CADEIA_NAO_FECHADA: '"' (ESC_SEQ | ~('"' | '\\' | '\n'))* '\n';

// Padroes auxiliares
fragment
ESC_SEQ: '\\"';

// Operadores aritmeticos e relacionais
OPERADOR_RELACIONAL: '>' | '>=' | '<' | '<=' | '=' | '<>';
OPERADOR_ARITMETICO: '+' | '-' | '*' | '/' | '%';

// Definicao de constantes numericas
NUM_INT: [0-9]+;
NUM_REAL: [0-9]+ '.' [0-9]+;

// Comentarios bem formados
COMENTARIO: '{' (~('{' | '}' | '\n'))*? '}' -> skip;

// Padrao para reconhecer um erro de comentario nao fechado
COMENTARIO_NAO_FECHADO: '{' (~('{' | '}' | '\n'))*? '\n';

// Ignorando espacos e tabulacoes
WS: [ \t\r\n] -> skip;

// Reconhecendo demais simbolos que nao pertencem a linguagem
ERRO_SIMBOLO: . -> channel(HIDDEN);