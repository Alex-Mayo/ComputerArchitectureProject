#include <iostream>
#include <stdlib.h>
#include <time.h>
extern "C" {
   void display_message(const char* message);
   char read_input();
   extern void asmMain();
   int randomNumber(int size);
   void displayCard(string name);
}

using namespace std;

int main() {
   srand(time(NULL));
   display_message("Welcome to Blackjack!\n\n");
   display_message("Press any key to start...\n");

   char userInput = read_input();
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

extern "C" int randomNumber(int size){
   int temp = rand() % size + 1;
   return temp;
}

//Display the cards in the current hand
void displayCard(string name){
   cout << name;
}