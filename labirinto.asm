 
; -----------------------------------------------
; Programa: Neander Maze - Labirinto em Assembly
; Autora: Maria Gabriella Silva de Lima
; Turma: E03
; Data: 19/09/2025
; -----------------------------------------------

; Este programa simula um pequeno labirinto. O jogador começa em um ponto
; de partida e precisa fazer a escolha certa (1 ou 2) para cada etapa.
; A cada decisão, a lógica do código verifica o caminho, levando à vitória
; ou a uma armadilha, utilizando apenas as instruções mais básicas do
; processador Neander.

ORG 0

INICIO:
    LDA VAL_UM
    STA POSICAO

LOOP:
    LDA POSICAO
    OUT 0       ; Saída de dados. O operando 0 é exigido pelo compilador.
    IN 0        ; Entrada de dados. O operando 0 é exigido pelo compilador.
    STA OPCAO
    
    LDA POSICAO
    SUB VAL_UM
    JZ P1
    
    LDA POSICAO
    SUB VAL_DOIS
    JZ P2
    
    LDA POSICAO
    SUB VAL_TRES
    JZ P3

    JMP GAMEOVER
    
P1:
    LDA OPCAO
    SUB VAL_UM
    JZ AVANCA1
    JMP GAMEOVER

AVANCA1:
    LDA VAL_DOIS
    STA POSICAO
    JMP LOOP

P2:
    LDA OPCAO
    SUB VAL_DOIS
    JZ AVANCA2
    JMP GAMEOVER

AVANCA2:
    LDA VAL_TRES
    STA POSICAO
    JMP LOOP

P3:
    LDA OPCAO
    SUB VAL_UM
    JZ VITORIA
    JMP GAMEOVER

VITORIA:
    LDA MSG_VITORIA
    OUT 0
    HLT

GAMEOVER:
    LDA MSG_ERRO
    OUT 0
    HLT

ORG 20
POSICAO: DB 0
OPCAO:   DB 0

VAL_UM:   DB 1
VAL_DOIS: DB 2
VAL_TRES: DB 3

MSG_VITORIA: DB 7
MSG_ERRO: DB 9