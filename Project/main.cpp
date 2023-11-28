extern "C" void  asmMain();
#include<iostream>


using namespace std;

class Card{

   public:
      void setName(string temp){name = temp;}
      void setNum(int temp){number = temp;}
      void setSuit(string temp){suit = temp;}

      string getName(){return name;}
      int getNum(){return number;}
      string getSuit(){return suit;}

   private:
      string name;
      int number;
      string suit;
};




int main(){
   asmMain();
   return 0;
}
