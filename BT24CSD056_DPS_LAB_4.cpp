#include <bits/stdc++.h>
using namespace std; 
 
int main() { 
    string plaintext = "The Department of Computer Science and Engineering is organizing a national level technical workshop for students"; 
    string keyword = "NETWORK"; 
 
    for (char c : plaintext) c = toupper(c); 
 
    string text = ""; 
    for (char c : plaintext) { 
        if (c != ' ') text += c; 
    } 
 
    int text_len = text.length(); 
    int cols = keyword.length();  
 
    int rows = (text_len + cols -1) / cols; 
    vector<vector<char>> matrix(rows, vector<char>(cols, 'X')); 
 
    int k = 0; 
 
    for(int i = 0; i < rows; i++) { 
        for(int j = 0; j < cols; j++) { 
            if(k < text_len) matrix[i][j] = text[k++]; 
        } 
    } 
 
    vector<pair<char, int>> order; 
 
    for (int i = 0; i < cols; i++) { 
        order.push_back({keyword[i], i}); 
    } 
 
    sort(order.begin(), order.end()); 
 
    cout << "Keyword: "; 
    for (char c : keyword) cout << c << " "; 
    cout << endl; 
 
    cout << "Number: "; 
 
    int number[10]; 
 
    for (int i = 0; i < cols; i++) { 
        number[order[i].second] = i + 1; 
    } 
 
    for (int i = 0; i < cols; i++) 
        cout << number[i] << " "; 
 
    cout << "\nMatrix:\n"; 
 
    for (int i = 0; i < rows; i++) { 
        for (int j = 0; j < cols; j++) { 
            cout << matrix[i][j] << " "; 
        } 
        cout << endl; 
    } 
 
    string ciphertext = ""; 
 
    for (int i = 0; i < cols; i++) { 
        int col = order[i].second; 
 
        for (int row = 0; row < rows; row++) { 
            ciphertext += matrix[row][col]; 
        } 
    } 
 
    cout << "\nCiphertext: " << ciphertext << endl; 


    vector<vector<char>> decrypt_matrix(rows, vector<char>(cols, 'X')); 
 
    k = 0; 
 
    for (int i = 0; i < cols; i++) { 
        int col = order[i].second; 
 
        for (int row = 0; row < rows; row++) { 
            if(k < ciphertext.length()) { 
                decrypt_matrix[row][col] = ciphertext[k++]; 
            } 
        } 
    } 
 
    string decrypted_text = ""; 
 
    for (int i = 0; i < rows; i++) { 
        for (int j = 0; j < cols; j++) { 
            decrypted_text += decrypt_matrix[i][j]; 
        } 
    } 
 
    while (!decrypted_text.empty() && decrypted_text.back() == '#') 
        decrypted_text.pop_back(); 
 
    cout << "Decrypted Text: " << decrypted_text << endl; 
 
    return 0; 
}