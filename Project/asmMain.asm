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
playerScore word 0      ; Word (2 bytes) variable to store player's score
dealerScore word 0     ; Word (2 bytes) variable to store dealer's score

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
   ret

_gameStart ENDP

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

