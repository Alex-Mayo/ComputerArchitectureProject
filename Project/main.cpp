#include <iostream>
#include <cstdlib>

extern "C" {
    void asmMain(); // Declare the assembly function
}

using namespace std;

int main() {
    char playAgain;

    do {
        cout << "Welcome to Blackjack!\n";
        asmMain(); // Call the assembly function

        // Ask the user if they want to play again
        cout << "Do you want to play again? (y/n): ";
        cin >> playAgain;

    } while (playAgain == 'y' || playAgain == 'Y');

    cout << "Thanks for playing!\n";
    return 0;
}
