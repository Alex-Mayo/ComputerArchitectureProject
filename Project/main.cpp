#include <iostream>
#include <string>
#include <vector>
#include <stdlib.h>
#include <time.h>
extern "C" {
   void display_message(const char* message);
   char read_input();
   extern void asmMain();
   int randomNumber();
   void shuffle();
   int getDeckSize();
   int readPlayerCard(int val);
   int readDealerCard(int val);
   void movePlayerCard(int sel);
   void moveDealerCard(int sel);
}

using namespace std;


class Card{
   public:
      Card(string cardName, int value){name = cardName; num = value;};
      Card(string cardName, int value, int altValue){name = cardName; num = value; altNum = altValue;};
      string name;
      int num, altNum;
};

vector<Card> deck;
vector<Card> playerHand;
vector<Card> dealerHand;

int calculateScore(const vector<Card>& hand) {
    int score = 0;
    for (const Card& card : hand) {
        score += card.num;
    }
    return score;
}


void displayGameState() {
    // Display player's cards
    cout << "Player's Hand: ";
    for (const Card& card : playerHand) {
        cout << card.name << " ";
    }
    cout << endl;

    // Display dealer's cards
    cout << "Dealer's Hand: ";
    for (const Card& card : dealerHand) {
        cout << card.name << " ";
    }
    cout << endl;

    // Display scores
    cout << "Player Score: " << calculateScore(playerHand) << endl;
    cout << "Dealer Score: " << calculateScore(dealerHand) << endl;
}

int main() {
   srand(time(NULL));
   display_message("Welcome to Blackjack!\n\n");
   display_message("Press any key to start...\n");
   cin.get();

   // Initialize the game state
   shuffle();
   movePlayerCard(1);
   movePlayerCard(2);
   moveDealerCard(1);
   moveDealerCard(2);

   // Display the initial game state
   displayGameState();

   // Enter the game loop (you may want to replace this with your actual game logic)
   while (true) {
       // Display the game state before each turn
       displayGameState();

       // Read player input and perform game actions
       char userInput = read_input();
       if (userInput == 'q') {
           break;  // Exit the loop if the user presses 'q'
       }
       else if (userInput == 'h') {
           // Handle player hit logic
           movePlayerCard(1);  // For simplicity, always add one card when hitting
       }
       else if (userInput == 's') {
           // Handle player stand logic
           // Implement the logic for what happens when the player stands
           // For now, let's just break out of the loop
           break;
       }

       // Update game state after player's action
       // (You may want to add more game logic here)

       // Check if the game is over based on your conditions
       // (You may want to add more end-game logic here)
   }
   
   asmMain();

   return 0;
}

void display_message(const char* message) {
   cout << message;
}


char read_input() {
   char input;
   cin >> input;
   return input;
}

int getDeckSize(){
   return deck.size();
}

int randomNumber(){
   int temp;
   temp = rand() % getDeckSize() + 1;
   return temp;
}

//Refill the deck with every card
void shuffle(){
   deck.clear();
   Card temp = Card("Ace of Spades", 11, 1);
   deck.push_back(temp);
   temp = Card("Ace of Heart", 11, 1);
   deck.push_back(temp);
   temp = Card("Ace of Diamonds", 11, 1);
   deck.push_back(temp);
   temp = Card("Ace of Clubs", 11, 1);
   deck.push_back(temp);
   temp = Card("Two of Spades", 2);
   deck.push_back(temp);
   temp = Card("Two of Hearts", 2);
   deck.push_back(temp);
   temp = Card("Two of Diamonds", 2);
   deck.push_back(temp);
   temp = Card("Two of Clubs", 2);
   deck.push_back(temp);
   temp = Card("Three of Spades", 3);
   deck.push_back(temp);
   temp = Card("Three of Hearts", 3);
   deck.push_back(temp);
   temp = Card("Three of Diamonds", 3);
   deck.push_back(temp);
   temp = Card("Three of Clubs", 3);
   deck.push_back(temp);
   temp = Card("Four of Spades", 4);
   deck.push_back(temp);
   temp = Card("Four of Hearts", 4);
   deck.push_back(temp);
   temp = Card("Four of Diamonds", 4);
   deck.push_back(temp);
   temp = Card("Four of Clubs", 4);
   deck.push_back(temp);
   temp = Card("Five of Spades", 5);
   deck.push_back(temp);
   temp = Card("Five of Hearts", 5);
   deck.push_back(temp);
   temp = Card("Five of Diamonds", 5);
   deck.push_back(temp);
   temp = Card("Five of Clubs", 5);
   deck.push_back(temp);
   temp = Card("Six of Spades", 6);
   deck.push_back(temp);
   temp = Card("Six of Hearts", 6);
   deck.push_back(temp);
   temp = Card("Six of Diamonds", 6);
   deck.push_back(temp);
   temp = Card("Six of Clubs", 6);
   deck.push_back(temp);
   temp = Card("Seven of Spades", 7);
   deck.push_back(temp);
   temp = Card("Seven of Hearts", 7);
   deck.push_back(temp);
   temp = Card("Seven of Diamonds", 7);
   deck.push_back(temp);
   temp = Card("Seven of Clubs", 7);
   deck.push_back(temp);
   temp = Card("Eight of Spades", 8);
   deck.push_back(temp);
   temp = Card("Eight of Hearts", 8);
   deck.push_back(temp);
   temp = Card("Eight of Diamonds", 8);
   deck.push_back(temp);
   temp = Card("Eight of Clubs", 8);
   deck.push_back(temp);
   temp = Card("Nine of Spades", 9);
   deck.push_back(temp);
   temp = Card("Nine of Diamonds", 9);
   deck.push_back(temp);
   temp = Card("Nine of Hearts", 9);
   deck.push_back(temp);
   temp = Card("Nine of Clubs", 9);
   deck.push_back(temp);
   temp = Card("Ten of Spades", 10);
   deck.push_back(temp);
   temp = Card("Ten of Hearts", 10);
   deck.push_back(temp);
   temp = Card("Ten of Diamonds", 10);
   deck.push_back(temp);
   temp = Card("Ten of Clubs", 10);
   deck.push_back(temp);
   temp = Card("Jack of Spades", 10);
   deck.push_back(temp);
   temp = Card("Jack of Hearts", 10);
   deck.push_back(temp);
   temp = Card("Jack of Diamonds", 10);
   deck.push_back(temp);
   temp = Card("Jack of Clubs", 10);
   deck.push_back(temp);
   temp = Card("Queen of Spades", 10);
   deck.push_back(temp);
   temp = Card("Queen of Hearts", 10);
   deck.push_back(temp);
   temp = Card("Queen of Diamonds", 10);
   deck.push_back(temp);
   temp = Card("Queen of Clubs", 10);
   deck.push_back(temp);
   temp = Card("King of Spades", 10);
   deck.push_back(temp);
   temp = Card("King of Hearts", 10);
   deck.push_back(temp);
   temp = Card("King of Diamonds", 10);
   deck.push_back(temp);
   temp = Card("King of Clubs", 10);
   deck.push_back(temp);
}

int readPlayerCard(int val){
   return playerHand[val].num;
}

int readDealerCard(int val) {
   return dealerHand[val].num;
}

void movePlayerCard(int sel){
   sel = sel - 1;
   playerHand.push_back(deck[sel]);
   deck.erase(deck.begin() + sel);
   return;
}

void moveDealerCard(int sel){
   sel = sel - 1;
   dealerHand.push_back(deck[sel]);
   deck.erase(deck.begin() + sel);
}

