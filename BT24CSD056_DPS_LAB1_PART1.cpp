#include <iostream>
#include <limits>
using namespace std;

void encrypt() {
    string plainText;
    int key;

    cout << "Enter plain text : ";
    cin.ignore(numeric_limits<streamsize>::max(), '\n');
    getline(cin, plainText);

    cout << "Enter shift key : ";
    cin >> key;

    while (key < 0 || key > 25) {
        cout << "Shift key invalid!!! Enter again: ";
        cin >> key;
    }

    string cipherText = "";

    for (char ch : plainText) {
        if (isalpha(ch))
            cipherText += (toupper(ch) - 'A' + key) % 26 + 'A';
        else
            cipherText += ch;      
    }

    cout << "Encrypted Text : " << cipherText << endl;
}

void decrypt() {
    string encryptedText, result = "";
    int key;

    cout << "Enter cipher text : ";
    cin.ignore(numeric_limits<streamsize>::max(), '\n');
    getline(cin, encryptedText);

    cout << "Enter shift key (0-25) : ";
    cin >> key;

    while (key < 0 || key > 25) {
        cout << "Shift key invalid!!! Enter again: ";
        cin >> key;
    }

    for (char c : encryptedText) {
        if (isalpha(c)) {
            char upperChar = toupper(c);
            char decryptedChar = (upperChar - 'A' - key + 26) % 26 + 'A';
            result += decryptedChar;
        } else {
            result += c;
        }
    }

    cout << "Decrypted Text : " << result << endl;
}

int main() {
    char inp;

    cout << "Select the Operation: " << endl;
    cout << "Encryption (e) or Decryption (d): ";
    cin >> inp;

    if (inp == 'e')
        encrypt();
    else if (inp == 'd')
        decrypt();
    else
        cout << "Enter a valid option!" << endl;

    return 0;
}
