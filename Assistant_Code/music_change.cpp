#include <iostream>
#include <fstream>
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
char in[200];

int main()
{
    memset(in, '\0', sizeof(in));
    while(gets(in)!=NULL){
        int len = strlen(in), st = 0;
        for(int i=0 ; i<len ; ++i){
            if(in[i]==':') st = 1;
            if(st==1)
                putchar(in[i]);
        }
        putchar(10);
        memset(in, '\0', sizeof(in));
    }
    return 0;
}
