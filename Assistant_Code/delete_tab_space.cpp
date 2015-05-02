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

int main()
{
    memset(in, '\0', sizeof(in));
    while(gets(in)!=NULL){
        int len = strlen(in);
        for(int i=0 ; i<len ; ++i)
            if(in[i]!='\t' && in[i]!=' ')
                putchar(in[i]);
        putchar(10);
        memset(in, '\0', sizeof(in));
    }
    return 0;
}

