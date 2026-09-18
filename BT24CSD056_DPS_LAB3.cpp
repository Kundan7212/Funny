#include <bits/stdc++.h>
using namespace std;

string encrypt(string s){
    vector<string> rail(3);
    int row=0,dir=1;
    for(char ch:s){
        rail[row]+=ch;
        if(row==0) dir=1;
        else if(row==2) dir=-1;
        row+=dir;
    }
    cout<<"Rail 1: "<<rail[0]<<endl;
    cout<<"Rail 2: "<<rail[1]<<endl;
    cout<<"Rail 3: "<<rail[2]<<endl;
    return rail[0]+rail[1]+rail[2];
}

string decrypt(string s){
    vector<string> rail(3);
    vector<int> pattern;
    int row=0,dir=1;
    for(int i=0;i<s.size();i++){
        pattern.push_back(row);
        if(row==0) dir=1;
        else if(row==2) dir=-1;
        row+=dir;
    }
    int pos=0;
    for(int i=0;i<3;i++){
        for(int j=0;j<pattern.size();j++){
            if(pattern[j]==i) rail[i]+=s[pos++];
        }
    }
    vector<int> idx(3,0);
    string ans;
    for(int r:pattern) ans+=rail[r][idx[r]++];
    return ans;
}

int main(){
    string s="THE DEPARTMENT WILL CONDUCT A TECHNICAL WORKSHOP ON CYBER SECURITY AND ALL INTERESTED STUDENTS ARE REQUESTED TO REGISTER BEFORE THE LAST DATE";
    string pt;
    for(char ch:s){
        if(isalpha(ch)) pt+=toupper(ch);
    }
    cout<<"Plaintext: "<<pt<<endl;
    cout<<"Plaintext characters: "<<pt.size()<<endl;
    cout<<"Rail Arrangement:"<<endl;
    string ct=encrypt(pt);
    cout<<"Ciphertext: "<<ct<<endl;
    cout<<"Ciphertext characters: "<<ct.size()<<endl;
    string ans=decrypt(ct);
    cout<<"Decrypted plaintext: "<<ans<<endl;
    return 0;
}