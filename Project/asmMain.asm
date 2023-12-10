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
   pop rsp
   call _dealPlayer
   add playerHandSize, 2

   call _dealDealer
   call _dealDealer
   add dealerHandSize, 2

   call _getScore
   ret

_gameStart ENDP

_dealPlayer PROC
   call randomNumber
   mov rcx, rax
   call movePlayerCard
   add rsp, 8  ; Adjust the stack pointer to clean up the stack after the call
   ret
_dealPlayer ENDP

_dealDealer PROC
   call randomNumber
   mov rcx, rax
   call moveDealerCard
   add rsp, 8  ; Adjust the stack pointer to clean up the stack after the call
   ret
_dealDealer ENDP


_getScore PROC

   mov cx, playerHandSize
   playerLoop:
   mov bx, playerHandSize
   sub bx, cx
      push cx ; Save cx (iterator count)
      mov cx, bx ; Move bx to cx to pass value to function readPlayerCard
      call readPlayerCard
      add playerScore, ax
      pop cx ; Restore cx (iterator count)
   loop playerLoop

   mov cx, dealerHandSize
   dealerLoop:
      mov bx, dealerHandSize
      sub bx, cx
      push cx
      mov cx, bx
      call readDealerCard
      add dealerScore, ax
      pop cx
   loop dealerLoop
   ret

_getScore ENDP


END

