#include <iostream>
extern "C" {
	void display_message(const char* message);
	char read_input();
	void asmMain();

}

using namespace std;

int main() {
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