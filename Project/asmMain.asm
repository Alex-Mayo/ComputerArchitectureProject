shuffle PROTO
getDeckSize PROTO
randomNumber PROTO

.data

player db "player",0
dealer db "dealer",0

playerHandSize DD 0
dealerHandSize DD 0
playerScore DD ?       ; Double-word (4 bytes) variable to store player's score
dealerScore DD ?       ; Double-word (4 bytes) variable to store dealer's score

player_prompt db "Enter 'h' to hit or 's' to stand: ", 0 ; Prompt for player input
input_format db "%c", 0  ; Format string for reading a character input
player_input db 0        ; Variable to store player's input

newline db 10, 0         ; Newline character for formatting


.CODE
asmMain PROC

   ; Your game logic for asmMain goes here
   
      

   ret
asmMain ENDP

_gameStart PROC ; deal two cards to player and dealer

   shuffleCheck:
      call getDeckSize
      pop rax
      cmp rax, 52
      jnbe noShuffle
      call shuffle

   noShuffle:
   
   lea si, player
   call _deal
   call _deal
   add playerHandSize, 2

   lea si, dealer
   call _deal
   call _deal
   add dealerHandSize, 2

   call _getScore

_gameStart ENDP

_deal PROC

   call getDeckSize
   call randomNumber
   


_deal ENDP

_getScore PROC


_getScore ENDP


END

