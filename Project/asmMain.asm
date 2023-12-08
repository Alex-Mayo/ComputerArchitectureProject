;name of function PROTO


.data
card STRUCT
   cName DB 128 DUP(?)       ; Allocate space for a name with a maximum of 128 characters
   number DB ?         ; A single-byte field to store the card number
   secondNum DB ?      ; A single-byte field for an alternative number
card ENDS

;Begin card creation
card1 card <"Ace of Clubs", 11, 1>
card2 card <"Ace of Diamonds", 11, 1>
card3 card <"Ace of Hearts", 11, 1>
card4 card <"Ace of Spades", 11, 1>
card5 card <"Two of Clubs", 2>
card6 card <"Two of Diamonds", 2>
card7 card <"Two of Hearts", 2>
card8 card <"Two of Spades", 2>
card9 card <"Three of Clubs", 3>
card10 card <"Three of Diamonds", 3>
card11 card <"Three of Hearts", 3>
card12 card <"Three of Spades", 3>
card13 card <"Four of Clubs", 4>
card14 card <"Four of Diamonds", 4>
card15 card <"Four of Hearts", 4>
card16 card <"Four of Spades", 4>
card17 card <"Five of Clubs", 5>
card18 card <"Five of Diamonds", 5>
card19 card <"Five of Hearts", 5>
card20 card <"Five of Spades", 5>
card21 card <"Six of Clubs", 6>
card22 card <"Six of Diamonds", 6>
card23 card <"Six of Hearts", 6>
card24 card <"Six of Spades", 6>
card25 card <"Seven of Clubs", 7>
card26 card <"Seven of Diamonds", 7>
card27 card <"Seven of Hearts", 7>
card28 card <"Seven of Spades", 7>
card29 card <"Eight of Clubs", 8>
card30 card <"Eight of Diamonds", 8>
card31 card <"Eight of Hearts", 8>
card32 card <"Eight of Spades", 8>
card33 card <"Nine of Clubs", 9>
card34 card <"Nine of Diamonds", 9>
card35 card <"Nine of Hearts", 9>
card36 card <"Nine of Spades", 9>
card37 card <"Ten of Clubs", 10>
card38 card <"Ten of Diamonds", 10>
card39 card <"Ten of Hearts", 10>
card40 card <"Ten of Spades", 10>
card41 card <"Jack of Clubs", 10>
card42 card <"Jack of Diamonds", 10>
card43 card <"Jack of Hearts", 10>
card44 card <"Jack of Spades", 10>
card45 card <"Queen of Clubs", 10>
card46 card <"Queen of Diamonds", 10>
card47 card <"Queen of Hearts", 10>
card48 card <"Queen of Spades", 10>
card49 card <"King of Clubs", 10>
card50 card <"King of Diamonds", 10>
card51 card <"King of Hearts", 10>
card52 card <"King of Spades", 10>
;End card creation

playerScore DD ?       ; Double-word (4 bytes) variable to store player's score
dealerScore DD ?       ; Double-word (4 bytes) variable to store dealer's score

deck card 52 DUP({}) ; Array to represent the deck of cards, initialized with zeros
player_hand card 10 DUP({}) ; Array to store player's hand, initialized with zeros
dealer_hand card 10 DUP({}) ; Array to store dealer's hand, initialized with zeros
suits db "CDHS"         ; String containing the four suits
ranks db "23456789XJQKA" ; String containing the ranks of the cards
hidden_card db "??"     ; String representing a hidden card

player_prompt db "Enter 'h' to hit or 's' to stand: ", 0 ; Prompt for player input
input_format db "%c", 0  ; Format string for reading a character input
player_input db 0        ; Variable to store player's input

newline db 10, 0         ; Newline character for formatting


.CODE
asmMain PROC
   lea rdi, deck
   lea rsi, player_hand
   
   call _shuffle

   ; Your game logic for asmMain goes here
   ; Player Turn
   playerTurn:
      mov rcx, LENGTHOF player_hand
      cmp rcx, 0
      jna playerInput
      
      displayLoop:
         mov rbx, LENGTHOF player_hand
         sub rbx, rcx
         push [rdi + rbx].cName
         call displayCard
         loop displayLoop

      playerInput:
         call getInput
         pop rax
         cmp rax, 0 ; 0 = stand, 1 = hit
         jna dealerTurn   
           call _deal
 
   ; Dealer Turn
   dealerTurn:
      

   ret
asmMain ENDP



_shuffle PROC ; A function that refills the deck
  
   ;mov each card into the deck array
   mov rdi, card1.number   


   ret
_shuffle ENDP


_deal PROC ; A function that deals one card to a certain player



   ; random card selection
   mov rax, LENGTHOF deck 
   push rax
   call randomNumber ; calls randomNumber from c++ file
   pop rax

_deal ENDP

END

