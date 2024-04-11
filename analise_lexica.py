# Importacoes
from sys import argv
from antlr4 import *
from LA_grammar import LA_grammar

# Objeto para identificacao de tokens que possuem um conteudo dinamico
tokens_dinamicos = {
    "IDENT": "IDENT",
    "NUM_INT": "NUM_INT",
    "NUM_REAL": "NUM_REAL",
    "CADEIA": "CADEIA",
}

def main(argv):
    # Verifica se o programa foi executado com os 2 parametros obrigatorios (fora o nome do arquivo executavel)
    if len(argv) != 3:
        print("Uso: python analise_lexica.py <arquivo_de_entrada.txt> <arquivo_de_saida.txt>")
        return

    # Recupera os caminhos dos arquivos de entrada e saida
    caminho_arquivo_entrada = argv[1]
    caminho_arquivo_saida = argv[2]

    # Le o arquivo de entrada com codificacao UTF-8
    input_stream = FileStream(caminho_arquivo_entrada, encoding='utf-8')
    lexer = LA_grammar(input_stream)

    # Abre o arquivo de saida para escrita
    with open(caminho_arquivo_saida, 'w', encoding='utf-8') as arquivo_saida:
        for token in lexer.getAllTokens():
            # Verifica, nos tres if's abaixo, se o token representa algum dos possiveis padroes de erros definidos
            if token.type == lexer.ERRO_SIMBOLO:
                arquivo_saida.write(f"Linha {token.line}: {token.text} - simbolo nao identificado\n")
                exit(1)
            elif token.type == lexer.COMENTARIO_NAO_FECHADO:
                arquivo_saida.write(f"Linha {token.line}: comentario nao fechado\n")
                exit(1)
            elif token.type == lexer.CADEIA_NAO_FECHADA:
                arquivo_saida.write(f"Linha {token.line}: cadeia literal nao fechada\n")
                exit(1)
            
            # Caso o token atual seja valido, recupera-se o nome para verificar se eh dinamico ou nao
            token_name = lexer.symbolicNames[token.type]
            is_token_dinamico = tokens_dinamicos.get(token_name)
            # Sendo dinamico, exibimos o nome correspondente, caso contrario repetimos o valor como texto
            if is_token_dinamico:
                arquivo_saida.write(f"<'{token.text}',{token_name}>\n")
            else:
                arquivo_saida.write(f"<'{token.text}','{token.text}'>\n")

# Caso o programa seja executado diretamente, passar os parametros recebidos para a funcao main
if __name__ == '__main__':
    main(argv)
