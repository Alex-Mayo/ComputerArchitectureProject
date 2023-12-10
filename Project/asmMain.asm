shuffle PROTO
getDeckSize PROTO
randomNumber PROTO
readPlayerCard PROTO
readDealerCard PROTO
movePlayerCard PROTO
moveDealerCard PROTO
extern ReadConsoleA : PROC
includelib user32.lib

.data

player word 'p'
dealer word 'd'

playerHandSize word 0
dealerHandSize word 0
playerScore word 0      ; Word (2 bytes) variable to store player's score
dealerScore word 0     ; Word (2 bytes) variable to store dealer's score

player_prompt db "Enter 'h' to hit or 's' to stand: ", 0 ; Prompt for player input
input_format db "%c", 0  ; Format string for reading a character input
player_input db 0        ; Variable to store player's input

newline db 10, 0         ; Newline character for formatting

input_buffer BYTE 10 DUP (?) ; Buffer to store user input

iteratorSave word ?

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
   
   playerInputLoop:
        ; Display player prompt and get input
        call getPlayerInput

        ; Check the input (assuming 'h' for hit, 's' for stand)
        cmp al, 'h'
        je hit
        cmp al, 's'
        je stand
        jmp playerInputLoop ; Invalid input, loop again

    hit:
        ; Handle player hit logic (call a function, update scores, etc.)
        ; ...

        jmp afterPlayerTurn

    stand:
        ; Handle player stand logic (call a function, update scores, etc.)
        ; ...

    afterPlayerTurn:
        ; Continue with the rest of the game logic
        ret

   ret

_gameStart ENDP

getPlayerInput PROC
    lea rdx, player_prompt  ; Load the address of the player prompt
    lea rcx, input_buffer   ; Load the address of the input buffer
    mov r8, 10              ; Maximum number of characters to read
    call ReadConsoleA       ; Call ReadConsoleA to read a character input
    movzx eax, byte ptr [input_buffer] ; Load the character input into eax
    ret
getPlayerInput ENDP

_dealPlayer PROC

   push rsp
   call randomNumber
   mov rcx, rax
   call movePlayerCard
   add rsp, 8
   ret

_dealPlayer ENDP

_dealDealer PROC

   push rsp
   call randomNumber
   mov rcx, rax
   call moveDealerCard
   add rsp, 8
   ret

_dealDealer ENDP

_getScore PROC

   mov playerScore, 0
   mov dealerScore, 0

   movzx rcx, playerHandSize
   playerLoop:
      movzx rbx, playerHandSize
      sub rbx, rcx
      mov iteratorSave, cx ; Save cx (iterator count) in variable
      mov rcx, rbx ; Move rbx to rcx to pass value to function readPlayerCard
      push rsp
      call readPlayerCard
      add rsp, 8
      add playerScore, ax
      movzx rcx, iteratorSave ; return the original cx value saved in iteratorSave
   loop playerLoop

   

   movzx rcx, dealerHandSize
   dealerLoop:
      movzx rbx, dealerHandSize
      sub rbx, rcx
      mov iteratorSave, cx
      mov rcx, rbx
      push rsp
      call readDealerCard
      add rsp, 8
      add dealerScore, ax
      movzx rcx, iteratorSave
   loop dealerLoop
   ret

_getScore ENDP


END

