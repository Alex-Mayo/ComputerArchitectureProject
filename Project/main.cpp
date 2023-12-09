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
   int readPlayerCard(int val);
   int readDealerCard(int val);
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
   
}

int readPlayerCard(int val){
   return playerHand[val].num;
}

int readDealerCard(int val) {
   return dealerHand[val].num;
}

void moveCard(int sel, char person){

}