; *********************************************************************************
; * PROJETO CHUVA DE METEOROS - LEIC-A - IAC 2021/2022
; * GRUPO 02 
; *	ELEMENTOS DO GRUPO:
;	- 103471 - João Francisco Santos Fidalgo
;	- 104139 - Rodrigo Manuel Ferreira Friães
;	- 103938 - José António Ribeiro da Silva Lopes  
; *********************************************************************************
;*********************************************************************************
; * Constantes
; *********************************************************************************
DEFINE_LINHA    		EQU 600AH      ; endereço do comando para definir a linha
DEFINE_COLUNA   		EQU 600CH      ; endereço do comando para definir a coluna
DEFINE_PIXEL    		EQU 6012H      ; endereço do comando para escrever um pixel
SELECIONA_ECRÃ			EQU 6004H      ; endereço do comando para selecionar o ecrã
APAGA_AVISO     		EQU 6040H      ; endereço do comando para apagar o aviso de nenhum cenário selecionado
APAGA_ECRÃ	 		    EQU 6002H      ; endereço do comando para apagar todos os pixels já desenhados
SELECIONA_CENARIO_FUNDO  EQU 6042H      ; endereço do comando para selecionar uma imagem de fundo
TOCA_SOM			EQU 605AH       ; endereço do comando para tocar um som
VIDEO_LOOP          EQU 605CH	    ; endereço do comando para reproduzir um vídeo em loop
TERMINA_VIDEO       EQU 6066H	    ; endereço do comando para terminar de reproduzir o vídeo em loop
TERMINA_TUDO		EQU 6068H	    ; endereço do comando para terminar a reporodução de todos os vídeos e sons a reproduzir
PAUSA_TUDO          EQU 6062H	    ; endereço do comando para pausar todos os vídeos e sons a reproduzir
RETOMA_TUDO			EQU 6064H	    ; endereço do comando para retomar todos os vídeos e sons a reproduzir

; TECLADO
DISPLAYS		EQU  0A000H		    ; endereço do periférico que liga aos displays
TEC_LIN			EQU  0C000H			; endereço das linhas do teclado (periférico POUT-2)
TEC_COL			EQU  0E000H			; endereço das colunas do teclado (periférico PIN)
LINHA_TECLADO	EQU 	8			; linha a testar (4ª linha, 1000b)
MASCARA			EQU	0FH				; para isolar os 4 bits de menor peso, ao ler as colunas do teclado

; TECLAS
TECLA_C				EQU 12		; tecla na primeira coluna do teclado (tecla C)
TECLA_D				EQU 13		; tecla na segunda coluna do teclado (tecla D)
TECLA_F				EQU 15		; tecla na quarta coluna do teclado (tecla F)
TECLA_ESQUERDA		EQU 0		; tecla na primeira coluna do teclado (tecla 0)
TECLA_MISSIL		EQU 1		; tecla da segunda coluna do teclado (tecla 1)
TECLA_DIREITA		EQU 2		; tecla na terceira coluna do teclado (tecla 2)


CONTINUAR    		EQU 0	  	; constante que indica que o jogo está a decorrer
SUSPENSO			EQU 1		; constante que indica que o jogo está suspenso

COMEÇAR				EQU 0		; constante que indica que o jogo ainda não começou
FIM					EQU 1		; constante que indica que o jogo já acabou

; METEOROS
N_METEOROS       	  EQU    4
SEM_VALOR_TIPO   	  EQU	-1
SEM_VALOR_COLUNA 	  EQU	-1
MAX_INDICE_ALEATORIOS EQU	14

METEORO_BOM		EQU 0			; constantes que indica o tipo do meteoro (0 é bom e 1 é mau)
NAVE_INIMIGA		EQU 1			

LINHA_INICIAL_METEORO   EQU  0   ; linha inicial do meteoro

LINHA_1			EQU  2	 ; linha do meteoro 1 (2x2)
LINHA_2			EQU	 5	 ; linha do meteoro 2 (3x3)
LINHA_3			EQU  8   ; linha do meteoro 3 (4x4)
LINHA_FINAL		EQU	 11  ; linha do meteoro 4 (5x5)

MIN_COLUNA_NAVE		EQU  0		    ; número da coluna mais à esquerda que a nave pode ocupar
MAX_COLUNA_NAVE		EQU  58         ; número da coluna mais à direita que a nave pode ocupar
MAX_LINHA_0 		EQU  31			; número da linha máxima que o pixel mais em cima do meteoro pode ocupar

MAX_LINHA_1 		EQU  27			; número da linha a partir da qual o meteoro começa a desaparecer por baixo
MAX_LINHA_2 		EQU  28			; número da linha a partir da qual o meteoro se torna 3x5
MAX_LINHA_3 		EQU  29			; número da linha a partir da qual o meteoro se torna 2x5
MAX_LINHA_4			EQU  30			; número da linha a partir da qual o meteoro se torna 1x5

LARGURA_0			EQU 1		; largura do meteoro 1x1
ALTURA_0			EQU 1		; altura do meteoro 1x1

LARGURA_1			EQU 2		; largura do meteoro 2x2
ALTURA_1			EQU 2		; altura do meteoro 2x2

LARGURA_2			EQU 3		; largura do meteoro 3x3
ALTURA_2			EQU 3		; altura do meteoro 3x3

LARGURA_3			EQU 4		; largura do meteoro 4x4
ALTURA_3			EQU 4		; altura do meteoro 3x3

LARGURA_FINAL		EQU	5		; largura do meteoro final
ALTURA_FINAL 		EQU 5		; altura do meteoro final, da nave inimiga final, da nave e da explosão 

; CORES
VERDE					EQU	0F0F0H	; cor verde
CINZENTO				EQU	0C888H	; cor cinzenta (com trasnparência)
VERMELHO				EQU 0FF00H	; cor vermelha
AMARELO					EQU	0FFF0H  ; cor amarela
VIOLETA					EQU	0FB0FH	; cor violeta
AZUL                    EQU 0F0FFH  ; cor azul claro
AZUL_ESCURO				EQU 0F00FH	; cor azul_escuro
LARANJA      			EQU 0FFA0H	; cor laranja
PRETO   				EQU 0F444H	; cor preta
CINZENTO_CLARO			EQU 0FBBBH	; cor cinzento claro
CINZENTO_ESCURO			EQU	0F777H	; cor cinzento_escuro
BRANCO        			EQU 0FFFFH	; cor branca


; NAVE
LINHA_NAVE    		EQU 28          ; linha da nave
COLUNA_NAVE			EQU 30          ; coluna da nave
LARGURA_NAVE		EQU	5		    ; largura da nave 
ALTURA_NAVE     	EQU 4 		    ; altura da nave
ATRASO_NAVE			EQU 850H		; atraso no movimenteo da nave


LINHA_MISSIL 		EQU 0			; constante para definir a linha do míssil
COLUNA_MISSIL 		EQU 0			; constante para definir a coluna do míssil
MAX_LINHA_MISSIL	EQU 14			; número da máxima linha onde o míssil pode chegar 

APAGA_MISSIL 		EQU 1

ENERGIA_MAXIMA		EQU 100			; número inicial da energia da nave

; *********************************************************************************
; * Dados 
; *********************************************************************************
	PLACE       1000H

; Reserva do espaço para as pilhas dos processos
	STACK 100H				; espaço reservado para a pilha do processo "programa principal"
SP_inicial_prog_princ:		; este é o endereço com que o SP deste processo deve ser inicializado
							
	STACK 100H				; espaço reservado para a pilha do processo "teclado"
SP_inicial_teclado:			; este é o endereço com que o SP deste processo deve ser inicializado

	STACK 100H				; espaço reservado para a pilha do processo "nave"
SP_inicial_nave:			; este é o endereço com que o SP deste processo deve ser inicializado

	STACK 100H				; espaço reservado para a pilha do processo "displays"
SP_inicial_displays:		; este é o endereço com que o SP deste processo deve ser inicializado

	STACK 100H				; espaço reservado para a pilha do processo "meteoro_0"
SP_inicial_meteoro_0:		; este é o endereço com que o SP deste processo deve ser inicializado
	STACK 100H				; espaço reservado para a pilha do processo "meteoro_1"
SP_inicial_meteoro_1:		; este é o endereço com que o SP deste processo deve ser inicializado
	STACK 100H				; espaço reservado para a pilha do processo "meteoro_2"
SP_inicial_meteoro_2:		; este é o endereço com que o SP deste processo deve ser inicializado		
	STACK 100H				; espaço reservado para a pilha do processo "meteoro_3"
SP_inicial_meteoro_3:		; este é o endereço com que o SP deste processo deve ser inicializado		

	STACK 100H				; espaço reservado para a pilha do processo "missil"
SP_inicial_missil:			; este é o endereço com que o SP deste processo deve ser inicializado

	STACK 100H				; espaço reservado para a pilha do processo "finish"
SP_inicial_finish:			; este é o endereço com que o SP deste processo deve ser inicializado

meteoro_SP_tab:				; tabela com os SP's dos meteoros
	WORD	SP_inicial_meteoro_0
	WORD	SP_inicial_meteoro_1
	WORD	SP_inicial_meteoro_2
	WORD	SP_inicial_meteoro_3
							
tecla_carregada:
	LOCK 0				; LOCK para o teclado comunicar aos restantes processos que tecla detetou
tecla_continuo:
	LOCK 0				; LOCK para o teclado comunicar aos restantes processos que tecla detetou, enquanto a tecla estiver carregada

evento_int_0:			; LOCK para a rotina de int 0 controlar a frequência do processo dos meteoros
	LOCK 0							

evento_int_1:			; LOCK para a rotina de int 0 controlar a frequência do processo do míssil
	LOCK 0

evento_int_2:			; LOCK para a rotina de int 0 controlar a frequência do processo dos displays
	LOCK 0
						
; Tabela das rotinas de interrupção
tab:
	WORD rot_int_0			; rotina de atendimento da interrupção 0
	WORD rot_int_1			; rotina de atendimento da interrupção 1
	WORD rot_int_2			; rotina de atendimento da interrupção 2

DEF_METEORO_NEUTRO_0:		; tabela que define o meteoro neutro 1x1
	WORD		LARGURA_0
	WORD 		ALTURA_0
	WORD 		CINZENTO

DEF_METEORO_NEUTRO_1:		; tabela que define o meteoro neutro 2x2
	WORD 		LARGURA_1
	WORD 		ALTURA_1
	WORD		CINZENTO, CINZENTO
	WORD 		LARGURA_1
	WORD		CINZENTO, CINZENTO

DEF_METEORO_BOM_0:			; tabela que define o meteoro bom 3x3
	WORD 		LARGURA_2
	WORD 		ALTURA_2
	WORD		0, BRANCO, 0
	WORD 		LARGURA_2
	WORD		BRANCO, AZUL_ESCURO, BRANCO
	WORD 		LARGURA_2
	WORD		0, BRANCO, 0

DEF_METEORO_BOM_1:			; tabela que define o meteoro bom 4x4
	WORD 		LARGURA_3
	WORD		ALTURA_3
	WORD 		0, BRANCO, BRANCO , 0
	WORD 		LARGURA_3
	WORD		BRANCO, AZUL_ESCURO, PRETO, BRANCO
	WORD 		LARGURA_3
	WORD		AZUL_ESCURO, AZUL_ESCURO, AZUL_ESCURO, AZUL_ESCURO
	WORD 		LARGURA_3
	WORD 		0, BRANCO, BRANCO, 0

DEF_METEORO_BOM_FINAL:		; tabela que define o meteoro bom 5x5
	WORD		LARGURA_FINAL
	WORD 		ALTURA_FINAL
	WORD 		0, BRANCO, BRANCO, BRANCO, 0
	WORD 		LARGURA_FINAL
	WORD		BRANCO, BRANCO, AZUL_ESCURO, AZUL_ESCURO, BRANCO 		
	WORD 		LARGURA_FINAL
	WORD		BRANCO, BRANCO, AZUL_ESCURO, PRETO, BRANCO
	WORD 		LARGURA_FINAL
	WORD		AZUL_ESCURO, AZUL_ESCURO, AZUL_ESCURO, AZUL_ESCURO, AZUL_ESCURO
	WORD 		LARGURA_FINAL
	WORD 		AZUL_ESCURO, VERMELHO, BRANCO, BRANCO, BRANCO

DEF_METEORO_BOM_CHAO_0:		; tabela que define o meteoro bom 4x5
	WORD		LARGURA_FINAL
	WORD 		ALTURA_3
	WORD 		0, BRANCO, BRANCO, BRANCO, 0
	WORD 		LARGURA_FINAL
	WORD		BRANCO, BRANCO, AZUL_ESCURO, AZUL_ESCURO, BRANCO 		
	WORD 		LARGURA_FINAL
	WORD		BRANCO, BRANCO, AZUL_ESCURO, PRETO, BRANCO
	WORD 		LARGURA_FINAL
	WORD		AZUL_ESCURO, AZUL_ESCURO, AZUL_ESCURO, AZUL_ESCURO, AZUL_ESCURO

DEF_METEORO_BOM_CHAO_1:		; tabela que define o meteoro bom 3x5
	WORD		LARGURA_FINAL
	WORD 		ALTURA_2
	WORD 		0, BRANCO, BRANCO, BRANCO, 0
	WORD 		LARGURA_FINAL
	WORD		BRANCO, BRANCO, AZUL_ESCURO, AZUL_ESCURO, BRANCO 		
	WORD 		LARGURA_FINAL
	WORD		BRANCO, BRANCO, AZUL_ESCURO, PRETO, BRANCO

DEF_METEORO_BOM_CHAO_2:		; tabela que define o meteoro bom 2x5
	WORD		LARGURA_FINAL
	WORD 		ALTURA_1
	WORD 		0, BRANCO, BRANCO, BRANCO, 0
	WORD 		LARGURA_FINAL
	WORD		BRANCO, BRANCO, AZUL_ESCURO, AZUL_ESCURO, BRANCO 		
	
DEF_METEORO_BOM_CHAO_3:		; tabela que define o meteoro bom 1x5
	WORD		LARGURA_FINAL
	WORD 		ALTURA_0
	WORD 		 0, AZUL, AZUL_ESCURO, AZUL, 0

DEF_NAVE_INIMIGA_0:			; tabela que define a nave inimiga 3x3
	WORD 		LARGURA_2
	WORD 		ALTURA_2
	WORD		CINZENTO_CLARO, 0, CINZENTO_CLARO
	WORD 		LARGURA_2
	WORD		0, PRETO, 0
	WORD 		LARGURA_2
	WORD		CINZENTO_CLARO, 0, CINZENTO_CLARO

DEF_NAVE_INIMIGA_1:			; tabela que define a nave inimiga 4x4
	WORD 		LARGURA_3
	WORD 		ALTURA_3
	WORD		CINZENTO_CLARO, 0, 0, CINZENTO_CLARO
	WORD 		LARGURA_3
	WORD		CINZENTO_CLARO, 0, 0, CINZENTO_CLARO
	WORD 		LARGURA_3
	WORD		0, PRETO, PRETO, 0
	WORD 		LARGURA_3
	WORD		CINZENTO_CLARO, 0, 0, CINZENTO_CLARO


DEF_NAVE_INIMIGA_FINAL:		; tabela que define a nave inimiga 5x5
	WORD		LARGURA_FINAL
	WORD 		ALTURA_FINAL
	WORD 		CINZENTO_CLARO, 0, 0, 0, CINZENTO_CLARO
	WORD 		LARGURA_FINAL
	WORD		CINZENTO_CLARO, 0, PRETO, 0, CINZENTO_CLARO
	WORD 		LARGURA_FINAL
	WORD		CINZENTO_ESCURO, PRETO , PRETO, PRETO, CINZENTO_ESCURO 
	WORD 		LARGURA_FINAL
	WORD		CINZENTO_CLARO, 0, PRETO, 0, CINZENTO_CLARO
	WORD 		LARGURA_FINAL
	WORD 		CINZENTO_CLARO, 0, 0, 0, CINZENTO_CLARO

DEF_NAVE_INIMIGA_CHAO_0:		; tabela que define a nave inimiga 4x5
	WORD		LARGURA_FINAL
	WORD 		ALTURA_3
	WORD 		CINZENTO_CLARO, 0, 0, 0, CINZENTO_CLARO
	WORD 		LARGURA_FINAL
	WORD		CINZENTO_CLARO, 0, PRETO, 0, CINZENTO_CLARO
	WORD 		LARGURA_FINAL
	WORD		CINZENTO_ESCURO, PRETO , PRETO, PRETO, CINZENTO_ESCURO 
	WORD 		LARGURA_FINAL
	WORD		CINZENTO_CLARO, 0, PRETO, 0, CINZENTO_CLARO

DEF_NAVE_INIMIGA_CHAO_1:		; tabela que define a nave inimiga 3x5
	WORD		LARGURA_FINAL
	WORD 		ALTURA_2
	WORD 		CINZENTO_CLARO, 0, 0, 0, CINZENTO_CLARO
	WORD 		LARGURA_FINAL
	WORD		CINZENTO_CLARO, 0, PRETO, 0, CINZENTO_CLARO
	WORD 		LARGURA_FINAL
	WORD		CINZENTO_ESCURO, PRETO , PRETO, PRETO, CINZENTO_ESCURO 
	
DEF_NAVE_INIMIGA_CHAO_2:		; tabela que define a nave inimiga 2x5
	WORD		LARGURA_FINAL
	WORD 		ALTURA_1
	WORD 		CINZENTO_CLARO, 0, 0, 0, CINZENTO_CLARO
	WORD 		LARGURA_FINAL
	WORD		CINZENTO_CLARO, 0, PRETO, 0, CINZENTO_CLARO

DEF_NAVE_INIMIGA_CHAO_3:		; tabela que define a nave inimiga 1x5
	WORD		LARGURA_FINAL
	WORD 		ALTURA_0
	WORD 		CINZENTO_CLARO, 0, 0, 0, CINZENTO_CLARO

DEF_EXPLOSAO:				; tabela que define a explosão
	WORD		LARGURA_FINAL
	WORD 		ALTURA_FINAL
	WORD		0, LARANJA, 0, LARANJA, 0
	WORD 		LARGURA_FINAL
	WORD 		LARANJA, 0, AMARELO, 0, LARANJA
	WORD 		LARGURA_FINAL
	WORD 		0, AMARELO, 0, AMARELO, 0
	WORD 		LARGURA_FINAL
	WORD 		LARANJA, 0, AMARELO, 0, LARANJA
	WORD 		LARGURA_FINAL
	WORD 		0, LARANJA, 0, LARANJA, 0

DEF_NAVE:					; tabela que define a nave 
	WORD		LARGURA_NAVE
	WORD 		ALTURA_NAVE
	WORD		0, 0, BRANCO, 0, 0
	WORD		LARGURA_NAVE
	WORD        0, 0, BRANCO, 0,0
	WORD		LARGURA_NAVE
	WORD		BRANCO, 0,VERMELHO, 0, BRANCO
	WORD		LARGURA_NAVE
	WORD		VERMELHO, CINZENTO_CLARO, BRANCO,CINZENTO_CLARO, VERMELHO


COORD_NAVE:					; coluna da nave guardada em memória
	WORD	   COLUNA_NAVE

PAUSA:						; 
	WORD CONTINUAR
	LOCK 0

REINICIAR:
	WORD COMEÇAR
	LOCK 0
REINICIAR_MISSIL:
	WORD COMEÇAR
TERMINAR_JOGO:
	WORD CONTINUAR
	LOCK 0

VALORES_ALEATORIOS:
	; coluna
	WORD SEM_VALOR_COLUNA ;0
	WORD SEM_VALOR_COLUNA ;2
	WORD SEM_VALOR_COLUNA ;4
	WORD SEM_VALOR_COLUNA ;6
	; tipo de meteoro
	WORD SEM_VALOR_TIPO   ;8  (0+8)
	WORD SEM_VALOR_TIPO   ;10 (2+8)
	WORD SEM_VALOR_TIPO   ;12 (4+8)
	WORD SEM_VALOR_TIPO   ;14 (6+8)

VALOR_DISPLAY:				; valor do display guardado em memória
	WORD 100

COORD_MISSIL:				; coordenadas do míssil guardadas em memória
	WORD	LINHA_MISSIL
	WORD 	COLUNA_MISSIL
; *********************************************************************************
; * Código
; *********************************************************************************
PLACE   0                     ; o código tem de começar em 0000H
inicio:
	MOV  SP, SP_inicial_prog_princ		; inicializa SP do programa principal
                            
	MOV  BTE, tab						; inicializa BTE (registo de Base da Tabela de Exceções)

    MOV  [APAGA_AVISO], R1				; apaga o aviso de nenhum cenário selecionado (o valor de R1 não é relevante)
	MOV  [APAGA_ECRÃ], R1				; apaga todos os pixels já desenhados (o valor de R1 não é relevante)
	MOV	R1, 0							; cenário de fundo número 0
	MOV  [VIDEO_LOOP], R1				; seleciona o cenário de fundo 0
	MOV R1, 1							; cenária de fundo número 1
	MOV  [VIDEO_LOOP], R1				; seleciona o cenário de fundo 1
     
	EI0					; permite interrupções 0
	EI1					; permite interrupções 1
	EI2					; permite interrupções 2
	EI					; permite interrupções (geral)
						; a partir daqui, qualquer interrupção que ocorra usa
						; a pilha do processo que estiver a correr nessa altura


	; Criar processos

	CALL	teclado				; cria o processo teclado
	
começa:
	MOV	R1, [tecla_carregada]	; bloqueia neste LOCK até uma tecla ser carregada
	MOV R10, TECLA_C
	CMP R1, R10
	JNZ começa
	MOV R1, 0
	MOV  [TERMINA_VIDEO], R1			
	MOV	R1, 2							; cenário de fundo número 0
	MOV  [VIDEO_LOOP], R1	; seleciona o cenário de fundo
	CALL	finish
inicia:
	MOV	R11, N_METEOROS		; número de bonecos a usar (até 4)
	CALL	nave
	CALL    displays
	CALL    missil
loop_meteoros:
	SUB	R11, 1			; próximo boneco
	CALL	meteoro			; cria uma nova instância do processo boneco (o valor de R11 distingue-as)
						; Cada processo fica com uma cópia independente dos registos
	CMP  R11, 0			; já criou as instâncias todas?
     JNZ	loop_meteoros		; se não, continua

; o resto do programa principal é também um processo (neste caso, trata dos displays)


obtem_tecla:	
	MOV	R1, [tecla_carregada]	; bloqueia neste LOCK até uma tecla ser carregada
suspende_D:
	MOV R10, TECLA_F
	CMP R1, R10
	JNZ nao_suspende_D
	MOV R3, [TERMINAR_JOGO+2]
nao_suspende_D:
	MOV R3, [TERMINAR_JOGO]
	CMP R3, FIM
	JZ  obtem_tecla
	MOV R10, TECLA_D
	CMP	R1, R10			; é tecla D?
	JNZ	obtem_tecla
suspende:	
	MOV	R1, [PAUSA]
	CMP R1, CONTINUAR          ; não está em pausa?
	JNZ continuar			   ; se estiver em pausa vai retomar o jogo
	MOV [PAUSA_TUDO], R10
	MOV R10, SUSPENSO		   ; vai suspender o jogo
	MOV	[PAUSA], R10
	JMP	obtem_tecla
continuar:
	MOV [RETOMA_TUDO], R10
	MOV R10, CONTINUAR			; vai continuar o jogo
	MOV	[PAUSA], R10
	MOV [PAUSA+2], R10
	JMP	obtem_tecla



PROCESS SP_inicial_finish

finish:
	MOV	R1, [tecla_carregada]	; bloqueia neste LOCK até uma tecla ser carregada
	MOV R10, TECLA_C
	CMP	R1, R10			        ; é tecla C?
	JNZ	testa_F			        ; se não for, testa a tecla F
	

	MOV R5, 9
	MOV [TERMINA_VIDEO], R5
	MOv R5, 8
	MOV [TERMINA_VIDEO], R5
	MOv R5, 5
	MOV [TERMINA_VIDEO], R5
	MOV R5, 4
	MOV [TERMINA_VIDEO], R5
	MOV R5, 2
	MOV [VIDEO_LOOP], R5
	MOV R5, 1
	MOV [VIDEO_LOOP], R5

	MOV R5, 100
	MOV [VALOR_DISPLAY], R5
	MOV R5, 100H
	MOV [DISPLAYS], R5

	MOV R1, LINHA_NAVE
	MOV R2, [COORD_NAVE]
	MOV R11, 4	
	CALL apaga_nave
	MOV R2, COLUNA_NAVE
	MOV	[COORD_NAVE], R2

	MOV R5, N_METEOROS
	MOV	[REINICIAR], R5

	MOV R2, FIM
	MOV [REINICIAR_MISSIL], R2

	MOV R5, CONTINUAR
	MOV [TERMINAR_JOGO], R5
	MOV [PAUSA], R5
	MOV [TERMINAR_JOGO+2], R5
	MOV [PAUSA+2], R5
	JMP	finish
testa_F:
	MOV R10, TECLA_F
	CMP	R1, R10					; é tecla F?
	JNZ finish					; se não for, retoma
	MOV	R2, [TERMINAR_JOGO]
	CMP R2, CONTINUAR         	; o jogo está a decorrer?
	JNZ finish
	MOV R10, FIM			  	; vai suspender e finalizar o jogo 
	MOV	[PAUSA], R10
	MOV	[TERMINAR_JOGO], R10
	MOV [REINICIAR_MISSIL], R10

	MOV [APAGA_ECRÃ], R5
	MOV R5, 2
	MOV [TERMINA_VIDEO], R5
	MOV R5, 1
	MOV [TERMINA_VIDEO], R5
	MOV R5, 4
	MOV [VIDEO_LOOP], R5
	MOV R5, 5
	MOV [TOCA_SOM], R5
	JMP	finish

; **********************************************************************
; ROT_INT_0 - 	Rotina de atendimento da interrupção 0
;			Faz simplesmente uma escrita no LOCK que o processo boneco lê.
;			Como basta indicar que a interrupção ocorreu (não há mais
;			informação a transmitir), basta a escrita em si, pelo que
;			o registo usado, bem como o seu valor, é irrelevante
; **********************************************************************
rot_int_0:
	MOV	[evento_int_0], R0	; desbloqueia processo boneco (qualquer registo serve) 
	RFE

; **********************************************************************
; ROT_INT_1 - 	Rotina de atendimento da interrupção 1
;			Faz simplesmente uma escrita no LOCK que o processo boneco lê.
;			Como basta indicar que a interrupção ocorreu (não há mais
;			informação a transmitir), basta a escrita em si, pelo que
;			o registo usado, bem como o seu valor, é irrelevante
; **********************************************************************
rot_int_1:
	MOV [evento_int_1], R0
	RFE

; **********************************************************************
; ROT_INT_2 - 	Rotina de atendimento da interrupção 2
;			Faz simplesmente uma escrita no LOCK que o processo boneco lê.
;			Como basta indicar que a interrupção ocorreu (não há mais
;			informação a transmitir), basta a escrita em si, pelo que
;			o registo usado, bem como o seu valor, é irrelevante
; **********************************************************************
rot_int_2:
	MOV [evento_int_2], R0
	RFE

; **********************************************************************
; Processo
;
; TECLADO - Processo que deteta quando se carrega numa tecla do teclado e 
;			escreve o valor da tecla num LOCK.
;
; **********************************************************************

PROCESS SP_inicial_teclado	; indicação de que a rotina que se segue é um processo,
						; com indicação do valor para inicializar o SP
teclado:
					; processo que implementa o comportamento do teclado
	MOV  R2, TEC_LIN		; endereço do periférico das linhas
	MOV  R3, TEC_COL		; endereço do periférico das colunas
	MOV  R5, MASCARA		; para isolar os 4 bits de menor peso, ao ler as colunas do teclado
	MOV  R1, LINHA_TECLADO	; testar a linha 4 
	MOV  R7, 0         		; inicializa contador da linha
    MOV  R8, 0         		; inicializa contador da coluna
	MOV  R6, R1
	MOV  R10, VALORES_ALEATORIOS
	MOV  R11, MAX_INDICE_ALEATORIOS

espera_tecla:				; neste ciclo espera-se até uma tecla ser premida
    YIELD					; ciclo potencialmente bloqueante
	CMP R1, 0
	JZ teclado
	MOVB [R2], R1			; escrever no periférico de saída (linhas)
	MOVB R0, [R3]			; ler do periférico de entrada (colunas)
	MOV  R8, R0
	AND  R0, R5				; elimina bits para além dos bits 0-3
    CMP  R0, 0
	JNZ  inicializa_contadores
    SHR  R6, 1         		; deslocamento à direita com a linha
	MOV  R1, R6		   		; guarda a nova linha no R6
	CMP  R9, R11            ; já percorreu toda a tabela?
	JLE  proximo
	MOV  R9, 0              ; se sim, volta para o primeiro valor da tabela 
proximo:
	SHR  R8, 5          	; coloca os bits 7-5 (aleatórios) no bits 2-0
	MOV  [R10+R9], R8   	; guarda o valor na tabela
	ADD  R9, 2          	; adiciona 2 porque as tabelas são de WORDS
	JMP  espera_tecla   

inicializa_contadores:
	MOV  R7, 0         		; inicializa contador da linha
    MOV  R8, 0         		; inicializa contador da coluna
indice_linha:
    SHR  R1, 1         		; desloca à direita o valor da linha até ser 0
    CMP  R1, 0         		; se for 0 vai começar o contador da coluna
    JZ   indice_coluna  
    ADD  R7, 1         		; incrementa ao contador enquanto
    JMP  indice_linha  		; o valor é diferente de 0

indice_coluna: 
    SHR  R0, 1         		; desloca à direita o valor da linha até ser 0
    CMP  R0, 0         		; se for 0 vai determinar a tecla pressinonada
    JZ   hexadecimal   
    ADD  R8, 1         		; incrementa ao contador enquanto
    JMP  indice_coluna 		; o valor é diferente de 0
    
hexadecimal:
    SHL  R7, 2         		; calcula o valor pressionado no teclado
    ADD  R7, R8	
	MOV	[tecla_carregada], R7	; informa quem estiver bloqueado neste LOCK que uma tecla foi carregada, e esse valor fica guardado na variável 
						

ha_tecla:					; neste ciclo espera-se até NENHUMA tecla estar premida

	YIELD						; ciclo potencialmente bloqueante
	MOV	[tecla_continuo], R7	; informa quem estiver bloqueado neste LOCK que uma tecla está a ser carregada
    MOV  R1, R6        			; testa a linha (R1 tinha sido alterado)
	MOVB [R2], R1				; escrever no periférico de saída (linhas)
    MOVB R0, [R3]				; ler do periférico de entrada (colunas)
	AND  R0, R5					; elimina bits para além dos bits 0-3
    CMP  R0, 0			    	; há tecla premida?
    JZ   teclado				; se ainda houver uma tecla premida, espera até não haver
	JMP	ha_tecla				

; **********************************************************************
; Processo
; meteoro - Processo que trata dos meteoros e das naves inimigas 
;			(movimentos e colisões)
; **********************************************************************

PROCESS SP_inicial_meteoro_0		; indicação de que a rotina que se segue é um processo,
								; com indicação do valor para inicializar o SP
meteoro:						; processo que implementa o comportamento do meteoro e da nave inimiga 
	YIELD						; ciclo potencialmente bloquante
	MOV  R10, R11				; cópia do nº de instância do processo
	SHL  R10, 1			    	; multiplica por 2 porque as tabelas são de WORDS
	MOV  R9, meteoro_SP_tab		; tabela com os SPs iniciais das várias instâncias deste processo
	MOV	SP, [R9+R10]			; re-inicializa SP deste processo, de acordo com o nº de instância
						
	MOV  R1, LINHA_INICIAL_METEORO		; linha inicial do meteoro
						
	MOV  R9, VALORES_ALEATORIOS			; valores aleatórios para as colunas dos meteoros
	MOV  R7, 1							; incremento da linha, para o objeto andar para baixo
	MOV  R2, [R9+R10]         			; valor aleatório da coluna
	CMP  R2, SEM_VALOR_COLUNA 			; se não houver valor aleatório espera até que haja
    JZ   meteoro
	MOV  R8, SEM_VALOR_COLUNA
	MOV  [R9+R10], R8
	SHL  R2, 3				  			; R2 varia entre 0-7 (8 colunas possíveis), multiplica-se por 8 para obter colunas múltiplas de 8 no ecrã de 64 colunas
	MOV  R8, 8					
	ADD  R10, R8              	; adiciona 8 para aceder aos valores dos tipos de meteoro
	MOV  R3, [R9+R10]         	; valor aleatório do tipo de meteoro
	CMP  R3, SEM_VALOR_TIPO   	; se não houver valor aleatório espera até que haja
    JZ   meteoro
	MOV  R8, SEM_VALOR_TIPO		; para modificar aleatoriamente o tipo do meteoro
	MOV  [R9+R10], R8
	MOV  R8, 8
	SUB  R10, R8  
	CMP  R3, 1                	; como R3 varia entre 0-7
	JLE  meteoro_bom		  	; se R3 for menor ou igual a 1 será um meteoro bom (chance 25%)
	JMP  nave_inimiga		  ; se R3 for maior que 1 será um meteoro mau (chance 75%)
meteoro_bom:
	MOV  R3, METEORO_BOM
	JMP  ciclo_meteoro
nave_inimiga:
	MOV  R3, NAVE_INIMIGA						
ciclo_meteoro:
	MOV R8, [REINICIAR]
	CMP R8, COMEÇAR
	JZ nao_reinicia
	SUB R8, 1
	MOV [REINICIAR], R8
	JMP meteoro
nao_reinicia:
	CALL	desenha_meteoro		; desenha o meteoro/nave inimiga a partir da tabela
	MOV	R8, [evento_int_0]		; lê o LOCK e bloqueia até a interrupção escrever nele
suspende_meteoro:
	MOV R8, [PAUSA]
	CMP R8, SUSPENSO
	JNZ nao_suspende_meteoro
	MOV R8, [PAUSA+2]
nao_suspende_meteoro:
	CALL	apaga_meteoro		; apaga o meteoro/nave inimiga na sua posição corrente
	CALL	testa_limites_meteoro
	CALL	verifica_explosao
	CMP     R1, -1
	JZ 		meteoro
	CALL    verifica_colisao_nave 
	MOV		R8, [TERMINAR_JOGO]
	CMP     R8, FIM
	JZ  	suspende_meteoro
	CMP R1, -1                  ; se o meteoro/nave inimiga chegar ao fundo vai obter novos valores
	JZ meteoro
	ADD	R1, R7					; para desenhar o meteoro/nave inimiga na linha seguinte 
	JMP	ciclo_meteoro		

verifica_explosao:
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	
	MOV R4, [COORD_MISSIL]
	ADD R1, 6					; para obter a parte de baixo do meteoro/nave inimiga
	MOV R5, [COORD_MISSIL+2]
	CMP R5, R2					; se o píxel da explosão estiver à esquerda do píxel mais à esquerda do meteoro/nave inimiga, então não há colisão 
	JLT sai_explosao
	ADD R2, 4
	CMP R5, R2					; se o píxel da explosão estiver à direita do píxel mais à direita do meteoro/nave inimiga, então não há colisão 
	JGT sai_explosao
	CMP R4, R1					; se o píxel mais em baixo do meteoro/nave inimiga estiver na mesma linha ou do míssil ou na de baixo, então houve colisão
	JGE sai_explosao
	CMP R3, NAVE_INIMIGA		; se for uma nave inimiga ganha 5% de energia
	JNZ toca_som_meteoro_bom
	MOV R8, 13			; vai tocar o som da explosão da nave inimiga
	MOV [TOCA_SOM], R8
	MOV R0, [VALOR_DISPLAY]
	ADD R0, 5
	MOV [VALOR_DISPLAY], R0
	CALL calcula_valor
	JMP energia

toca_som_meteoro_bom:
	MOV R8, 12			; vai tocar o som da explosão do meteoro bom
	MOV [TOCA_SOM], R8
energia:
	SUB R1, 6					; volta a repor os valores da linha e da coluna do meteoro/nave inimiga
	SUB R2, 4
	CALL desenha_explosao		; desenha a explosão
	MOV R8, APAGA_MISSIL		
	MOV [REINICIAR_MISSIL], R8	; reinicia o míssil
	MOV R8, [evento_int_1]
	CALL apaga_explosao			; apaga a explosão	
	MOV R1, -1					; dá reset à linha do meteoro/nave inimiga
	JMP explode					
sai_explosao:
    SUB R1, 6					; caso não tenha havido explosão retoma o valor da linha do meteoro/nave inimiga
explode:
	POP R6
	POP	R5
	POP	R4
	POP	R3
	POP	R2
	RET

desenha_explosao:
	PUSH	R1
	PUSH	R2
	PUSH	R3
	PUSH	R4				; LINHA
	PUSH 	R5				; COLUNA
	PUSH 	R6
	PUSH    R7
	MOV R7, R2
	MOV R4, DEF_EXPLOSAO
	MOV R5, [R4]
	ADD R4, 2
	MOV R6, [R4]
	ADD R4, 2
desenha_linha_explosao:
	MOV R8, [R4]
	CALL	escreve_pixel
	ADD R4, 2
	ADD R2, 1
	SUB R5, 1
	JNZ desenha_linha_explosao
muda_linha_explosao:
	MOV R5, [R4]
	ADD R4, 2
	MOV R2, R7
	ADD R1, 1
	SUB R6, 1
	JNZ desenha_linha_explosao
	POP R7
	POP R6
	POP	R5
	POP	R4
	POP	R3
	POP	R2
	POP R1
	RET

apaga_explosao:
	PUSH	R1
	PUSH	R2
	PUSH	R3
	PUSH	R4				; LINHA
	PUSH 	R5				; COLUNA
	PUSH 	R6
	PUSH 	R7
	MOV R7, R2
	MOV R4, DEF_EXPLOSAO
	MOV R5, [R4]
	ADD R4, 2
	MOV R6, [R4]
	ADD R4, 2
apaga_linha_explosao:
	MOV R8, 0
	CALL	escreve_pixel
	ADD R4, 2
	ADD R2, 1
	SUB R5, 1
	JNZ apaga_linha_explosao
muda_linha_apaga_explosao:
	MOV R5, [R4]
	ADD R4, 2
	MOV R2, R7
	ADD R1, 1
	SUB R6, 1
	JNZ apaga_linha_explosao
	POP R7
	POP R6
	POP	R5
	POP	R4
	POP	R3
	POP	R2
	POP R1
	RET

verifica_colisao_nave:
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R7
	MOV R4, LINHA_NAVE			; linha da nave
	MOV R5, [COORD_NAVE]		; coluna da nave
	ADD R1, 5
	ADD R5, 4
	CMP R5, R2
	JLT sai_colisao
	ADD R2, 4
	SUB R5, 4
	CMP R5, R2
	JGT sai_colisao
	CMP R1, R4
	JLT sai_colisao
	CMP R3, NAVE_INIMIGA
	JNZ energia_colisao
	CALL game_over 
	MOV  R1, -1
	JMP sai_colisao


energia_colisao:
	MOV R0, 10
	MOV [TOCA_SOM], R0

	MOV R0, [VALOR_DISPLAY]
	MOV R7, 10
	ADD R0, R7
	MOV R8, ENERGIA_MAXIMA
	CMP R0, R8
	JLT energia_maxima
	MOV R0, ENERGIA_MAXIMA
energia_maxima:
	MOV [VALOR_DISPLAY], R0
	CALL calcula_valor
	SUB R1, 5
	SUB R2, 4
	MOV R1, -1
	JMP explode_colisao
 sai_colisao:
	SUB R1, 5
explode_colisao:
	POP R7
	POP R6
	POP R5
	POP R4
	POP R3
	POP R2
	RET
; **********************************************************************
; DESENHA_meteoro - Desenha um meteoro ou uma nave inimiga na linha e coluna indicadas
; **********************************************************************
desenha_meteoro:
	PUSH    R1
	PUSH	R2
	PUSH	R3
	PUSH	R4
	PUSH	R5
	PUSH	R6
	PUSH 	R7
	PUSH    R8				; registo auxiliar para comparar as linhas do boneco 
	MOV R7, R2				; guardar o valor da coluna num registo auxiliar 	
meteoro_neutro_0:
	MOV R8, LINHA_1
	CMP R8, R1
	JLT	meteoro_neutro_1
	MOV R4, DEF_METEORO_NEUTRO_0
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2				
	MOV R6, [R4]
	ADD R4, 2
	JMP desenha_linha_meteoro
meteoro_neutro_1:
	MOV R8, LINHA_2
	CMP R8, R1
	JLT nave_inimiga_0
	MOV R4, DEF_METEORO_NEUTRO_1
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP desenha_linha_meteoro
nave_inimiga_0:
	CMP R3, METEORO_BOM     ; verifica se é bom ou mau
	JZ meteoro_bom_0
	MOV R8, LINHA_3
	CMP R8, R1
	JLT nave_inimiga_1
	MOV R4, DEF_NAVE_INIMIGA_0
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP desenha_linha_meteoro
nave_inimiga_1:
	MOV R8, LINHA_FINAL
	CMP R8, R1
	JLT nave_inimiga_final
	MOV R4, DEF_NAVE_INIMIGA_1
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP desenha_linha_meteoro
nave_inimiga_final:
	MOV R8, MAX_LINHA_1
	CMP R8, R1
	JLT nave_inimiga_chao_0
	MOV R4, DEF_NAVE_INIMIGA_FINAL
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP desenha_linha_meteoro
nave_inimiga_chao_0:
	MOV R8, MAX_LINHA_2
	CMP R8, R1
	JLT nave_inimiga_chao_1
	MOV R4, DEF_NAVE_INIMIGA_CHAO_0
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP desenha_linha_meteoro
nave_inimiga_chao_1:
	MOV R8, MAX_LINHA_3
	CMP R8, R1
	JLT nave_inimiga_chao_2
	MOV R4, DEF_NAVE_INIMIGA_CHAO_1
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP desenha_linha_meteoro
nave_inimiga_chao_2:
	MOV R8, MAX_LINHA_4
	CMP R8, R1
	JLT nave_inimiga_chao_3
	MOV R4, DEF_NAVE_INIMIGA_CHAO_2
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP desenha_linha_meteoro
nave_inimiga_chao_3:
	MOV R4, DEF_NAVE_INIMIGA_CHAO_3
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP desenha_linha_meteoro

meteoro_bom_0:
	MOV R8, LINHA_3
	CMP R8, R1
	JLT meteoro_bom_1
	MOV R4, DEF_METEORO_BOM_0
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP desenha_linha_meteoro
meteoro_bom_1:
	MOV R8, LINHA_FINAL
	CMP R8, R1
	JLT meteoro_bom_final
	MOV R4, DEF_METEORO_BOM_1
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP desenha_linha_meteoro
meteoro_bom_final:
	MOV R8, MAX_LINHA_1
	CMP R8, R1
	JLT meteoro_bom_chao_0
	MOV R4, DEF_METEORO_BOM_FINAL
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP desenha_linha_meteoro
meteoro_bom_chao_0:
	MOV R8, MAX_LINHA_2
	CMP R8, R1
	JLT meteoro_bom_chao_1
	MOV R4, DEF_METEORO_BOM_CHAO_0
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP desenha_linha_meteoro
meteoro_bom_chao_1:
	MOV R8, MAX_LINHA_3
	CMP R8, R1
	JLT meteoro_bom_chao_2
	MOV R4, DEF_METEORO_BOM_CHAO_1
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP desenha_linha_meteoro
meteoro_bom_chao_2:
	MOV R8, MAX_LINHA_4
	CMP R8, R1
	JLT meteoro_bom_chao_3
	MOV R4, DEF_METEORO_BOM_CHAO_2
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP desenha_linha_meteoro
meteoro_bom_chao_3:
	MOV R4, DEF_METEORO_BOM_CHAO_3
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
desenha_linha_meteoro:
	MOV	 R8, [R4]			; obtém a cor do próximo pixel da nave
	CALL	escreve_pixel	; escreve cada pixel da nave
	ADD	 R4, 2				; endereço da cor do próximo pixel 
    ADD  R2, 1              ; próxima coluna
    SUB  R5, 1			    ; menos uma coluna para tratar
    JNZ  desenha_linha_meteoro      ; continua até percorrer toda a largura da nave
muda_linha_meteoro:
	MOV  R5, [R4]           ; repõe o valor da largura
	ADD  R4, 2              ; endereço da cor do próximo pixel
	MOV  R2, R7             ; recupera o valor da coluna
	ADD  R1, 1
	SUB  R6, 1				; próxima linha 
	JNZ  desenha_linha_meteoro
	POP R8
	POP R7
	POP R6
	POP	R5
	POP	R4
	POP	R3
	POP	R2
	POP R1
	RET

; **********************************************************************
; APAGA_METEORO - Apaga um meteoro ou uma nave inimiga na linha e coluna indicadas
; **********************************************************************
apaga_meteoro:
	PUSH	R1
	PUSH	R2
	PUSH	R3
	PUSH	R4
	PUSH	R5
	PUSH 	R6
	PUSH 	R7
	PUSH    R8				; registo auxiliar para comparar as linhas do boneco 
	MOV R7, R2
apaga_meteoro_neutro_0:
	MOV R8, LINHA_1
	CMP R8, R1
	JLT apaga_meteoro_neutro_1
	MOV R4, DEF_METEORO_NEUTRO_0
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP apaga_linha_meteoro
apaga_meteoro_neutro_1:
	MOV R8, LINHA_2
	CMP R8, R1
	JLT apaga_nave_inimiga_0
	MOV R4, DEF_METEORO_NEUTRO_1
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP apaga_linha_meteoro
apaga_nave_inimiga_0:
	CMP R3, 0               ; verifica se é bom ou mau
	JZ apaga_meteoro_bom_0
	MOV R8, LINHA_3
	CMP R8, R1
	JLT apaga_nave_inimiga_1
	MOV R4, DEF_NAVE_INIMIGA_0
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP apaga_linha_meteoro
apaga_nave_inimiga_1:
	MOV R8, LINHA_FINAL
	CMP R8, R1
	JLT apaga_nave_inimiga_final
	MOV R4, DEF_NAVE_INIMIGA_1
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP apaga_linha_meteoro
apaga_nave_inimiga_final:
	MOV R8, MAX_LINHA_1
	CMP R8, R1
	JLT apaga_nave_inimiga_chao_0
	MOV R4, DEF_NAVE_INIMIGA_FINAL
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP apaga_linha_meteoro
apaga_nave_inimiga_chao_0:
	MOV R8, MAX_LINHA_2
	CMP R8, R1
	JLT apaga_nave_inimiga_chao_1
	MOV R4, DEF_NAVE_INIMIGA_CHAO_0
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP apaga_linha_meteoro
apaga_nave_inimiga_chao_1:
	MOV R8, MAX_LINHA_3
	CMP R8, R1
	JLT apaga_nave_inimiga_chao_2
	MOV R4, DEF_NAVE_INIMIGA_CHAO_1
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP apaga_linha_meteoro
apaga_nave_inimiga_chao_2:
	MOV R8, MAX_LINHA_4
	CMP R8, R1
	JLT apaga_nave_inimiga_chao_3
	MOV R4, DEF_NAVE_INIMIGA_CHAO_2
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP apaga_linha_meteoro
apaga_nave_inimiga_chao_3:
	MOV R4, DEF_NAVE_INIMIGA_CHAO_3
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP apaga_linha_meteoro
apaga_meteoro_bom_0:
	MOV R8, LINHA_3
	CMP R8, R1
	JLT apaga_meteoro_bom_1
	MOV R4, DEF_METEORO_BOM_0
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP apaga_linha_meteoro
apaga_meteoro_bom_1:
	MOV R8, LINHA_FINAL
	CMP R8, R1
	JLT apaga_meteoro_bom_final
	MOV R4, DEF_METEORO_BOM_1
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP apaga_linha_meteoro
apaga_meteoro_bom_final:
	MOV R8, MAX_LINHA_1
	CMP R8, R1
	JLT apaga_meteoro_bom_chao_0
	MOV R4, DEF_METEORO_BOM_FINAL
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP apaga_linha_meteoro
apaga_meteoro_bom_chao_0:
	MOV R8, MAX_LINHA_2
	CMP R8, R1
	JLT apaga_meteoro_bom_chao_1
	MOV R4, DEF_METEORO_BOM_CHAO_0
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP apaga_linha_meteoro
apaga_meteoro_bom_chao_1:
	MOV R8, MAX_LINHA_3
	CMP R8, R1
	JLT apaga_meteoro_bom_chao_2
	MOV R4, DEF_METEORO_BOM_CHAO_1
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP apaga_linha_meteoro
apaga_meteoro_bom_chao_2:
	MOV R8, MAX_LINHA_4
	CMP R8, R1
	JLT apaga_meteoro_bom_chao_3
	MOV R4, DEF_METEORO_BOM_CHAO_2
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
	JMP apaga_linha_meteoro
apaga_meteoro_bom_chao_3:
	MOV R4, DEF_METEORO_BOM_CHAO_3
	MOV	R5, [R4]			; obtém a largura do boneco
	ADD	R4, 2			
	MOV R6, [R4]
	ADD R4, 2
apaga_linha_meteoro:       		; desenha os pixels da nave a partir da tabela
	MOV	 R8, 0			        ; cor para apagar o próximo pixel da nave
	CALL escreve_pixel		    ; escreve cada pixel da nave
	ADD	 R4, 2			        ; endereço da cor do próximo pixel (2 porque cada cor de pixel é uma word)
    ADD  R2, 1                  ; próxima coluna
    SUB  R5, 1			        ; menos uma coluna para tratar
    JNZ  apaga_linha_meteoro            ; continua até percorrer toda a largura da nave
muda_linha_apagar_meteoro:
    MOV  R5, [R4]               ; repõe o valor da largura
    ADD  R4, 2                  ; endereço da cor do próximo pixel
    MOV  R2, R7                 ; recupera o valor da coluna
    ADD  R1, 1
    SUB  R6, 1                  ; próxima linha
    JNZ  apaga_linha_meteoro
	POP R8
	POP R7
	POP R6
	POP	R5
	POP	R4
	POP	R3
	POP	R2
	POP R1
	RET


; **********************************************************************
; ESCREVE_PIXEL - Escreve um pixel na linha e coluna indicadas.
; Argumentos:   R1 - linha
;               R2 - coluna
;               R8 - cor do pixel (em formato ARGB de 16 bits)
;
; **********************************************************************
escreve_pixel:
	MOV  [SELECIONA_ECRÃ], R11
	MOV  [DEFINE_LINHA], R1		; seleciona a linha
	MOV  [DEFINE_COLUNA], R2		; seleciona a coluna
	MOV  [DEFINE_PIXEL], R8		; altera a cor do pixel na linha e coluna já selecionadas
	RET


; **********************************************************************
; TESTA_LIMITES_METEORO 
; **********************************************************************
testa_limites_meteoro:
	PUSH 	R4
	PUSH	R5
testa_limite_baixo:		; vê se o boneco chegou à última linha
	MOV	R5, MAX_LINHA_0
	CMP	R1, R5 
	JNZ sai_testa_limites_meteoro
	MOV R1, LINHA_INICIAL_METEORO - 1
sai_testa_limites_meteoro:	
	POP	R5
	POP R4
	RET


; **********************************************************************
; Processo
;
; NAVE - Processo que trata da nave (movimentos e colisões)
;
; **********************************************************************

PROCESS SP_inicial_nave	; indicação de que a rotina que se segue é um processo,
						; com indicação do valor para inicializar o SP
nave:					; processo que implementa o comportamento do boneco
						; desenha o boneco na sua posição inicial
    MOV R1, LINHA_NAVE	
	MOV	R2, [COORD_NAVE]
	MOV	R4, DEF_NAVE			; endereço da tabela que define o boneco
ciclo_nave:
	CALL	desenha_nave		; desenha o boneco a partir da tabela
espera_movimento:
	MOV	R3, [tecla_continuo]	; lê o LOCK e bloqueia até o teclado escrever nele novamente
fim_nave:
	MOV R8, TECLA_C
	CMP R3, R8                  ; é a tecla C?
	JNZ suspende_nave
	JMP nave
suspende_nave:
	MOV R8, [PAUSA]
	CMP R8, SUSPENSO
	JNZ testa_esquerda
	MOV R8, [PAUSA+2]
	JMP espera_movimento
testa_esquerda:
	MOV R8, TECLA_ESQUERDA  
	CMP R3, R8               ; verifica se a tecla premida é a tecla C
	JNZ	testa_direita        ; caso não seja verifica a próxima
	MOV	R7, -1			     ; vai deslocar a nave para a esquerda
	JMP sai
testa_direita:
	MOV R8, TECLA_DIREITA
	CMP	R3, R8               ; verifica se a tecla premida é a tecla D
	JNZ	espera_movimento	 ; caso não seja verifica a próxima
	MOV	R7, +1			     ; vai deslocar a nave para a direita
sai:
	MOV	R6, [R4]					; obtém a largura do boneco
	CALL	testa_limites_nave		; vê se chegou aos limites do ecrã e nesse caso inverte o sentido
	CMP R7, 0
	JZ  bordas
	CALL	atraso
	CALL	apaga_nave				; apaga o boneco na sua posição corrente
bordas:
	ADD	R2, R7						; para desenhar objeto na coluna seguinte (direita ou esquerda)
	MOV [COORD_NAVE], R2
	JMP	nave		

atraso:						; rotina que trata do atraso da nave
	PUSH R0
	MOV  R0, ATRASO_NAVE
decrementa:
	SUB  R0, 1
	CMP  R0, 0
	JNZ  decrementa
	POP  R0
	RET
	
; **********************************************************************
; DESENHA_NAVE - Desenha a nave na linha e coluna indicadas
; **********************************************************************
desenha_nave:
	PUSH	R1
	PUSH	R2
	PUSH	R3
	PUSH	R4
	PUSH	R5
	PUSH	R6
    PUSH    R7
    MOV R7, R2              ; e guarda no R7
	MOV	R5, [R4]			; R5 obtém a largura da nave
	ADD	R4, 2				
	MOV R6, [R4]			; R6 obtém a altura da nave
	ADD R4, 2				; endereço da cor do 1º pixel (2 porque a largura é uma word)
desenha_linha:
	MOV	 R8, [R4]			; obtém a cor do próximo pixel da nave
	CALL	escreve_pixel	; escreve cada pixel da nave
	ADD	 R4, 2				; endereço da cor do próximo pixel 
    ADD  R2, 1              ; próxima coluna
    SUB  R5, 1			    ; menos uma coluna para tratar
    JNZ  desenha_linha      ; continua até percorrer toda a largura da nave
muda_linha:
	MOV  R5, [R4]           ; repõe o valor da largura
	ADD  R4, 2              ; endereço da cor do próximo pixel
	MOV  R2, R7             ; recupera o valor da coluna
	ADD  R1, 1
	SUB  R6, 1				; próxima linha 
	JNZ  desenha_linha
    POP R7
	POP R6
	POP	R5
	POP	R4
	POP	R3
	POP	R2
	POP R1
	RET

; **********************************************************************
; APAGA_NAVE - Apaga a nave na linha e coluna indicadas
; **********************************************************************
apaga_nave:
	PUSH    R1 
	PUSH	R2
	PUSH	R3
	PUSH	R4
	PUSH	R5
    PUSH    R6
    PUSH    R7
    MOV R7, R2              ; e guarda no R7
	MOV R4, DEF_NAVE        ; endereço da tabela que define a nave
	MOV	R5, [R4]			; obtém a largura da nave
	ADD	R4, 2				; obtém a altura da nave
	MOV R6, [R4]			; e guarda-a no R6
	ADD R4, 2				; endereço da cor do 1º pixel (2 porque a largura é uma word)
apaga_linha_nave:       		        ; desenha os pixels da nave a partir da tabela
	MOV	 R8, 0			        ; cor para apagar o próximo pixel da nave
	CALL escreve_pixel		    ; escreve cada pixel da nave
	ADD	 R4, 2			        ; endereço da cor do próximo pixel (2 porque cada cor de pixel é uma word)
    ADD  R2, 1                  ; próxima coluna
    SUB  R5, 1			        ; menos uma coluna para tratar
    JNZ  apaga_linha_nave            ; continua até percorrer toda a largura da nave
muda_linha_apagar_nave:
    MOV  R5, [R4]               ; repõe o valor da largura
    ADD  R4, 2                  ; endereço da cor do próximo pixel
    MOV  R2, R7                 ; recupera o valor da coluna
    ADD  R1, 1
    SUB  R6, 1                  ; próxima linha
    JNZ  apaga_linha_nave
    POP  R7
    POP  R6
	POP	 R5
	POP	 R4
	POP	 R3
	POP	 R2
    POP  R1 
	RET

; **********************************************************************
; TESTA_LIMITES_NAVE - Testa se a nave chegou aos limites do ecrã e 
;			   		   nesse caso inverte o sentido de movimento
; **********************************************************************
testa_limites_nave:
	PUSH	R5
	PUSH	R6
testa_limite_esquerdo:		; vê se o boneco chegou ao limite esquerdo
	MOV	R5, MIN_COLUNA_NAVE
	CMP	R2, R5
	JGT	testa_limite_direito
	CMP	R7, 0			    ; passa a deslocar-se para a direita
	JGE	sai_testa_limites_nave
	JMP	impede_movimento_nave	; entre limites. Mantém o valor do R7
testa_limite_direito:		; vê se o boneco chegou ao limite direito
	MOV	R5, MAX_COLUNA_NAVE
	CMP	R2, R5
	JLE	sai_testa_limites_nave	; entre limites. Mantém o valor do R7
	CMP	R7, 0			    ; passa a deslocar-se para a direita
	JGT	impede_movimento_nave
	JMP	sai_testa_limites_nave	; entre limites. Mantém o valor do R7
impede_movimento_nave:
	MOV	R7, 0			    ; impede o movimento, forçando R7 a 0
sai_testa_limites_nave:	
	POP	R6
	POP	R5
	RET

; **********************************************************************
; Processo
; DISPLAYS - Processo que trata dos displays (decrementos, pausas e
;			 game over por falta de energia)
; **********************************************************************

PROCESS SP_inicial_displays	; indicação de que a rotina que se segue é um processo,

displays:
	MOV  R3, [PAUSA]
	CMP  R3, SUSPENSO
	JNZ  nao_suspende_displays
	MOV  R3, [PAUSA+2]      ; lê o LOCK e bloqueia até que o jogo retome
nao_suspende_displays:
	CALL calcula_valor
	MOV  R1, [evento_int_2]
	MOV  R2, [VALOR_DISPLAY]
	SUB  R2, 5

	MOV  R3, 20
	CMP  R2, R3
	JNZ  vai_a_baixo
	MOV  R0, 11
	MOV  [TOCA_SOM], R0
	JMP  not_zero

vai_a_baixo:
	CMP  R2, 0             ; game over
	JGT  not_zero         
	MOV  R2, 0  
	MOV  [VALOR_DISPLAY], R2
	CALL calcula_valor
	CALL zero_energia
not_zero:
	MOV  [VALOR_DISPLAY], R2
	JMP  displays
	

calcula_valor:
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	MOV  R4, 10				; divisor
	MOV  R3, 1000           ; fator
	MOV  R5, 0              ; resultado
	MOV	 R6, 3              ; número de displays/digitos
	MOV  R2, [VALOR_DISPLAY]
proximo_digito:
	MOV  R2, [VALOR_DISPLAY]
	MOD  R2, R3
	DIV  R3, R4	
	DIV  R2, R3
	SHL  R5, 4
	OR   R5, R2
	SUB  R6, 1
	CMP  R6, 0
	JNZ  proximo_digito	
	MOV [DISPLAYS], R5            ; mostra o valor calculado nos displays
	POP  R6
	POP  R5
	POP	 R4
	POP	 R3
	POP	 R2
	RET

game_over:
	MOV  [APAGA_ECRÃ], R1
	MOV  [TERMINA_TUDO], R1
	MOV  R1, 9
	MOV  [VIDEO_LOOP], R1
	MOV  R1, 8     
	MOV  [VIDEO_LOOP], R1

	MOV  R1, SUSPENSO
	MOV  [PAUSA], R1
	MOV  R1, FIM
	MOV  [TERMINAR_JOGO], R1
	RET
zero_energia:
	MOV  [APAGA_ECRÃ], R1
	MOV  [TERMINA_TUDO], R1
	MOV  R1, 6
	MOV  [TOCA_SOM], R1
	MOV  R1, 7     
	MOV  [VIDEO_LOOP], R1

	MOV  R1, SUSPENSO
	MOV  [PAUSA], R1
	MOV  R1, FIM
	MOV  [TERMINAR_JOGO], R1
	RET

; ******************************************************************************
; Processo
; MISSIL - Processo que trata do míssil (disparo, movimentações e pausas)
; ******************************************************************************

PROCESS SP_inicial_missil

missil:
	MOV R5, -1
	MOV [COORD_MISSIL], R5
	MOV [COORD_MISSIL+2], R5
	MOV R0, [tecla_carregada]
	MOV R4, [PAUSA]
	CMP R4, SUSPENSO
	JNZ testa_tecla_missil
	MOV R0, [PAUSA+2]
	JMP missil 
testa_tecla_missil:
	CMP R0, TECLA_MISSIL
	JNZ missil
	MOV R0, 3
	MOV [TOCA_SOM], R0
	MOV R0, [VALOR_DISPLAY]
	SUB R0, 5
	MOV [VALOR_DISPLAY], R0
	CALL calcula_valor
coords_missil:
	MOV R0, COMEÇAR
	MOV [REINICIAR_MISSIL], R0
	MOV R4, LINHA_NAVE		    ; linha da nave
	SUB R4, 1					; para centrar a linha 
	MOV R5, [COORD_NAVE]		; coluna da nave
	ADD R5, 2					; para centrar a coluna
	MOV [COORD_MISSIL], R4
	MOV [COORD_MISSIL+2], R5
	MOV R1, [COORD_MISSIL]		; linha do missil 
	MOV R2, [COORD_MISSIL+2]	; coluna do missil
	MOV R7, MAX_LINHA_MISSIL
loop_missil:
	YIELD
	MOV R8, VERDE
	CALL escreve_pixel
	MOV R6, [evento_int_1]
	MOV R8, 0
tira_missil:
	MOV R3, [TERMINAR_JOGO]
	CMP R3, 0
	JZ suspende_missil
	MOV R3, [TERMINAR_JOGO+2]
	JMP missil
suspende_missil:
	MOV R0, [PAUSA]
	CMP R0, SUSPENSO
	JNZ reinicia_missil
	MOV R0, [PAUSA+2]
	JMP loop_missil
reinicia_missil:
	MOV R0, [REINICIAR_MISSIL]
	CMP R0, FIM
	JNZ nao_reinicia_missil
	MOV R0, COMEÇAR
	MOV [REINICIAR_MISSIL], R0
	CALL escreve_pixel
	JMP missil
nao_reinicia_missil:
	CALL escreve_pixel
	SUB R1, 1
	CMP R1, R7
	JZ  missil
	MOV [COORD_MISSIL], R1
	MOV [COORD_MISSIL+2], R2
	JMP loop_missil

