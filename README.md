## Integrantes do grupo

Gabriel Ripper de Mendonça Furtado - RA: 804070 - Curso: BCC

Leonardo da Silva Lopes - RA: 761880 - Curso: BCC

Maria Luíza Edwards de Magalhães Cordeiro - RA: 802645 - Curso: BCC

## Passo a passo para a execução do analisador léxico

### Instalações
Uma vez que o ANTLR é feito na linguagem Java, é necessário a ter instalada. Isso pode ser feito por meio do link abaixo:
[Download Java](https://www.java.com/pt-BR/download/)

Como a implementação do analisador léxico está em Python, também será necessário instalá-lo. Da versão 3.6 em diante é o suficiente:
[Download Python](https://www.python.org/downloads/)

Precisaremos também do arquivo pronto a ser executado (código ANTLR) junto ao nosso arquivo de gramática caso não tenha o seu próprio. O arquivo .jar pode ser recuperado por meio do link abaixo:
[Download ANTLR .jar file](https://www.antlr.org/download/antlr-4.13.1-complete.jar)

Utilizaremos ainda o gerenciador de pacotes PIP (que já vem com a instalação do Python nas versões mais recentes).

Por fim, para a parte de testes, temos o corretor automático fornecido pelo professor. Este encontra-se no link abaixo:
[Download corretor automático](https://github.com/dlucredio/compiladores-corretor-automatico/blob/master/target/compiladores-corretor-automatico-1.0-SNAPSHOT-jar-with-dependencies.jar)

### Execução

Primeiro iremos instalar o pacote para trabalhar com o ANTLR em Python: `pip install antlr4-python3-runtime`

Em seguida executaremos o arquivo .jar, passando o caminho para tal arquivo com a flag para utilização do Python e o nome do nosso arquivo .g4 que contém a nossa gramática. Substitua `<caminho_para_antlr4.jar>` pelo caminho do arquivo em sua máquina. Garanta que a execução do comando abaixo seja no diretório onde se encontra o arquivo LA_grammar.g4, ou inclua o caminho até o arquivo:

`java -jar <caminho_para_antlr4.jar> -Dlanguage=Python3 LA_grammar.g4`

Por fim, para executar em linha de comando o arquivo principal `analise_lexica.py` utilizamos:
`python analise_lexica.py <caminho_arquivo_entrada> <caminho_arquivo_saida>`

Ou, caso não funcione a versão acima, tente:
`python3 analise_lexica.py <caminho_arquivo_entrada> <caminho_arquivo_saida>`

Caso seja passado apenas um parâmetro, o nome do arquivo de saída será o mesmo que o nome do arquivo de entrada e ele estará contido na pasta 'saida'. Caso contrario, com dois parâmetros passados, o resultado será salvo no caminho de saída indicado.

OBS: a versão com apenas um parâmetro só foi mantida para os testes feitos manualmente.

### Teste

Para a verificação dos resultados, utilizando o corretor automático mencionado anteriormente, utilizamos o comando abaixo. Para executá-lo, substitua os campos marcados com <> pelo caminho para o arquivo de teste automatizado .jar, pelo caminho para o arquivo analise_lexica.py, pelo caminho para o compilador gcc, pelo caminho para a saída gerada pela execução em cada caso de teste e, por fim, pelo caminho para a pasta que contém todos os testes, respectivamente. Onde há 'python', novamente, talvez seja necessário utilizar 'python3':
`java -jar "<caminho_para_teste_automatizado>" "python <caminho_para_arquivo_principal>"  "<caminho_para_compilador_gcc>" "<caminho_para_saida_gerada>" "<caminho_para_pasta_de_testes>" "761880, 802645, 804070" "tipoTeste (t1|gabarito)"`
