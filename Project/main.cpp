#include <iostream>
#include <string>
#include <vector>
#include <stdlib.h>
#include <time.h>
extern "C" {
   void display_message(const char* message);
   char read_input();
   extern void asmMain();
   int randomNumber(int size);
   void displayCard(const char* name);
   void shuffle();
   int getDeckSize();
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

int main() {
   srand(time(NULL));
   display_message("Welcome to Blackjack!\n\n");
   display_message("Press any key to start...\n");
   cin.ignore();
   
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

int randomNumber(int size){
   int temp = rand() % size + 1;
   return temp;
}

//Refill the deck with every card
void shuffle(){
   deck.clear();
   Card temp = Card("Ace of Spades", 11, 1);
   deck.push_back(temp);
}