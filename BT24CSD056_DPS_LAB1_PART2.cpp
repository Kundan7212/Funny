#include <bits/stdc++.h>
using namespace std;

int main() {
    char key[10][10] = {
        {'o','e','r','a','t','i','e','w','n','a'},
        {'s','o','i','s','d','h','o','t','d','e'},
        {'h','s','p','a','e','h','n','i','x','o'},
        {'e','q','e','e','n','t','l','h','y','s'},
        {'a','i','e','p','j','w','r','e','n','a'},
        {'t','z','m','f','d','a','i','r','l','t'},
        {'u','g','c','e','g','u','t','o','e','l'},
        {'b','i','t','u','h','c','e','n','r','y'},
        {'t','n','c','h','b','o','t','v','a','f'},
        {'a','k','r','s','l','d','m','o','r','s'}
    };

    unordered_map<char, pair<int, vector<pair<int, int>>>> mp;

    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            mp[key[i][j]].second.push_back({i, j});
        }
    }

    cout << "Enter string: ";
    string s;
    getline(cin, s);

    string ans;

    for (char c : s) {
        char ch = tolower(c);

        if(mp.count(ch)) {
            int idx = mp[ch].first;
            ans += char('0' + mp[ch].second[idx].first);
            ans += char('0' + mp[ch].second[idx].second);
            mp[ch].first = (idx + 1) % mp[ch].second.size();
        }
        else ans += c;
    }

    cout << "Encrypted string: " << ans << endl;

    return 0;
}

