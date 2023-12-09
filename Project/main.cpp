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
   int movePlayerCard(int sel);
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

int movePlayerCard(int sel){
   sel = sel - 1;
   playerHand.push_back(deck[sel]);
   deck.erase(deck.begin() + sel);
   return 0;
}

void moveDealerCard(int sel){
   sel = sel - 1;
   dealerHand.push_back(deck[sel]);
   deck.erase(deck.begin() + sel);
}