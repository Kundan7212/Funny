#include <bits/stdc++.h>
using namespace std;

int fun(vector<int> &lfsr, vector<int> &tap) {
    int x = 0;

    for(int i : tap){
        x ^= lfsr[i];
    }
    int bit = lfsr[3];

    for(int i = 3; i > 0; i--){
        lfsr[i] = lfsr[i-1];
    }

    lfsr[0] = x;

    return bit;
}

int main() {
    string s;
    int n, k;

    cout << "Enter 4-bit seed: ";
    cin >> s;

    if(s == "0000") s = "0001";

    vector<int> lfsr(4);

    for(int i = 0; i < 4; i++)
        lfsr[i] = s[i] - '0';

    cout << "Enter number of tap positions: ";
    cin >> k;

    vector<int> tap(k);

    cout << "Enter tap positions (1 to 4): ";
    for(int i = 0; i < k; i++) {
        cin >> tap[i];
        tap[i]--;
    }

    int it;
    cout << "Enter number of iterations: ";
    cin >> it;

    string seq = "";
    
    cout << "LFSR states: "<<endl;

    for(int i = 0; i < it; i++) {
        int bit = fun(lfsr, tap);
        seq += char(bit + '0');

        for(int j = 0; j < 4; j++){
            cout << lfsr[j];
        }
        cout << endl;
    }

    cout << "Pseudorandom sequence: " << seq << endl;
    return 0;
}