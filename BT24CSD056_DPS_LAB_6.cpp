#include<bits/stdc++.h>
using namespace std;

long long mypower(long long base,long long power,long long mod){
    long long ans=1;
    base=base%mod;
    while(power>0){
        if(power%2==1){
            ans=(ans*base)%mod;
        }
        power=power/2;
        base=(base*base)%mod;
    }
    return ans;
}

int main() {
    long long p,q,e;
    cout<<"enter p: ";
    cin>>p;
    cout<<"enter q: ";
    cin>>q;

    long long n=p*q;
    long long phi=(p-1)*(q-1);

    cout<<"enter e: ";
    cin>>e;

    long long d=2;
    while(true){
        if((d*e)%phi==1){
            break;
        }
        d++;
    }

    cout<<"public key is ("<<e<<", "<<n<<")"<<endl;
    cout<<"private key is ("<<d<<", "<<n<<")"<<endl;

    string msg;
    cout<<"enter plaintext message: ";
    cin>>msg;

    vector<long long> cipher;
    for(int i=0;i<msg.length();i++){
        long long asciival=(long long)msg[i];
        long long c=mypower(asciival,e,n);
        cipher.push_back(c);
    }

    string decrypted="";
    for(int i=0;i<cipher.size();i++){
        long long m=mypower(cipher[i],d,n);
        decrypted+=(char)m;
    }

    cout<<"original plaintext: "<<msg<<endl;

    cout<<"encrypted ciphertext: ";
    for(int i=0;i<cipher.size();i++){
        cout<<cipher[i]<<" ";
    }
    cout<<endl;
    
    cout<<"decrypted plaintext: "<<decrypted<<endl;

    return 0;
}