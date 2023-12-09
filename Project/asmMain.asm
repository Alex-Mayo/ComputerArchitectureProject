shuffle PROTO
getDeckSize PROTO
randomNumber PROTO
readPlayerCard PROTO
readDealerCard PROTO
movePlayerCard PROTO
moveDealerCard PROTO

.data

player word 'p'
dealer word 'd'

playerHandSize word 0
dealerHandSize word 0
playerScore word 0      ; Double-word (4 bytes) variable to store player's score
dealerScore word 0     ; Double-word (4 bytes) variable to store dealer's score

player_prompt db "Enter 'h' to hit or 's' to stand: ", 0 ; Prompt for player input
input_format db "%c", 0  ; Format string for reading a character input
player_input db 0        ; Variable to store player's input

newline db 10, 0         ; Newline character for formatting


.CODE
asmMain PROC

   ; Your game logic for asmMain goes here
   call _gameStart
      

   ret
asmMain ENDP

_gameStart PROC ; deal two cards to player and dealer

   shuffleCheck:
      call getDeckSize
      cmp rax, 52
      jnbe noShuffle
      call shuffle

   noShuffle:
   mov playerScore, 0
   mov dealerScore, 0
   mov playerHandSize, 0
   mov dealerHandSize, 0 

   call _dealPlayer
   call _dealPlayer
   add playerHandSize, 2

   call _dealDealer
   call _dealDealer
   add dealerHandSize, 2

   call _getScore

_gameStart ENDP

_dealPlayer PROC

   call getDeckSize
   push rax
   call randomNumber
   mov rbx, rax
   pop rax
   push rbx
   call movePlayerCard


_dealPlayer ENDP

_dealDealer PROC

   call getDeckSize
   push rax
   call randomNumber
   push rax
   call moveDealerCard


_dealDealer ENDP

_getScore PROC

   mov cx, playerHandSize
   playerLoop:
   mov bx, playerHandSize
   sub bx, cx
      push bx
      call readPlayerCard
      add playerScore, ax
   loop playerLoop

   mov cx, dealerHandSize
   dealerLoop:
      mov bx, dealerHandSize
      sub bx, cx
      push bx
      call readDealerCard
      add dealerScore, ax
   loop dealerLoop

_getScore ENDP


END

