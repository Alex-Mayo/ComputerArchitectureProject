; Define function prototypes (PROTOCOL) for external functions
shuffle PROTO
getDeckSize PROTO
randomNumber PROTO
readPlayerCard PROTO
readDealerCard PROTO
movePlayerCard PROTO
moveDealerCard PROTO
playerAceSwap PROTO
dealerAceSwap PROTO
displayGameState PROTO
hitCheck PROTO
endGameMessage PROTO
rerunCheck PROTO

.data
; Constants and variables for player and dealer identifiers, hand sizes, and scores
player word 'p'
dealer word 'd'
playerHandSize word 0
dealerHandSize word 0
playerScore word 0      ; Word (2 bytes) variable to store player's score
dealerScore word 0     ; Word (2 bytes) variable to store dealer's score

; Variable to save the iterator count during score calculation
iteratorSave word ?


.CODE
asmMain PROC
   ; Your game logic for asmMain goes here
   
   gameStart:

   call _gameStart
   call _playerTurn
   call _dealerTurn
   call _gameEnd

   ; Alex
   push rsp
   call rerunCheck
   add rsp, 8
   
   cmp rax, 1
   je gameStart

   ret
asmMain ENDP


; Alex
_gameStart PROC ; deal two cards to player and dealer
   ; Game initialization logic
   ; Check if shuffling is needed based on the deck size
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

   ; Deal two cards to the player and dealer
   call _dealPlayer
   call _dealPlayer
   add playerHandSize, 2

   call _dealDealer
   call _dealDealer
   add dealerHandSize, 2

   ; Calculate initial scores
   call _getScore
   
   ret
_gameStart ENDP

_getPlayerScore PROC

   movzx rax, playerScore
   ret

_getPlayerScore ENDP

_getDealerScore PROC

   movzx rax, dealerScore
   ret

_getDealerScore ENDP

; Alex and Jacky
_dealPlayer PROC

   push rsp
   call randomNumber
   mov rcx, rax
   call movePlayerCard
   add rsp, 8
   ret

_dealPlayer ENDP

; Alex and Jacky
_dealDealer PROC

   push rsp
   call randomNumber
   mov rcx, rax
   call moveDealerCard
   add rsp, 8
   ret

_dealDealer ENDP

; Alex
_getScore PROC
   ; Calculate scores for both player and dealer hands

   playerScoreCount:

   mov playerScore, 0
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
   cmp playerScore, 21
   jnbe playerAceCheck

   ; Calculate dealer hand score
   dealerScoreCount:

   mov dealerScore, 0
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
   cmp dealerScore, 21
   jnbe dealerAceCheck


   endOfFunction:
      ret

   playerAceCheck:
      call playerAceSwap
      cmp rax, 1
      je playerScoreCount ; if value changed, redo playerScoreCount
      jmp dealerScoreCount

   dealerAceCheck:
      call dealerAceSwap
      cmp rax, 1
      je dealerScoreCount ; if value changed, redo dealerScoreCount
      jmp endOfFunction

_getScore ENDP

; Jacky
_playerTurn PROC

   hitLoop:

      push rsp
      call displayGameState
      add rsp, 8

      push rsp
      call hitCheck
      add rsp, 8

      cmp rax, 1 ; Checks if hit (1) was selected by the player
      jne stand ; jumps to stand if not equal to 1


      call _dealPlayer

      add playerHandSize, 1
      call _getScore

      cmp playerScore, 21
      ja bust
      
      jmp hitLoop
      
   stand:
      ret
      
   bust:
      push rsp
      call displayGameState
      add rsp, 8

      ret

_playerTurn ENDP

; Jacky
_dealerTurn PROC

   mov ax, playerScore
   cmp dealerScore, ax
   jnbe stand
   
   hitLoop:   
      call _dealDealer
      add dealerHandSize, 1

      call _getScore

      cmp dealerScore, 21
      jnbe bust ; if score is over 21, bust

      mov ax, playerScore
      cmp dealerScore, ax 
      jnbe stand ; if score is above playerScore, stand

      jmp hitLoop ; otherwise hit until one of the conditions is met

   stand:
      push rsp
      call displayGameState
      add rsp, 8
      ret

   bust:
      push rsp
      call displayGameState
      add rsp, 8
      ret

_dealerTurn ENDP

_gameEnd PROC

   cmp playerScore, 21
   ja playerBust

   cmp dealerScore, 21
   ja dealerBust
   
   mov rcx, 3
   push rsp
   call endGameMessage
   add rsp, 8
   ret


   playerBust:
      mov rcx, 1
      push rsp
      call endGameMessage
      add rsp, 8
      ret

   dealerBust:
      mov rcx, 2
      push rsp
      call endGameMessage
      add rsp, 8
      ret

_gameEnd ENDP

END