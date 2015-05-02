#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cctype>
#include <cmath>
#include <algorithm>
#include <stack>
#include <map>
#include <set>
#include <queue>
#include <vector>
#include <list>
using namespace std;
char in[100];
vector<string> all;
bool cmp(string a, string b)
{
    if(a.size()!=b.size())
        return a.size() > b.size();
    else
        return a<b;
}

int main()
{
    memset(in, '\0', sizeof(in));
    while(gets(in)!=NULL){
        all.push_back((string) in);
        memset(in, '\0', sizeof(in));
    }
    sort(all.begin(), all.end(), cmp);
    for(int i=0 ; i<all.size() ; ++i)
        puts(all[i].c_str());
    return 0;
}
