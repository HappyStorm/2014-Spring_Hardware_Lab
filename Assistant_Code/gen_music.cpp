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
char in[200], temp[200];

int main()
{
    int tmp = 0;
    memset(in, '\0', sizeof(in));
    memset(temp, '\0', sizeof(temp));
    while(gets(in)!=NULL){
        int len = strlen(in), ct = 0;
        for(int i=0 ; i<len ; ++i)
            if(isdigit(in[i]) || isalpha(in[i]))
                temp[ct++] = in[i];
        //  3:tmp <= 4'h5;
        if(strlen(temp)>0)
            printf("%d:tmp <= 4'h%s;\n", tmp++, temp);
        else
            puts("//------");
        memset(temp, '\0', sizeof(temp));
        memset(in, '\0', sizeof(in));
    }
    return 0;
}
