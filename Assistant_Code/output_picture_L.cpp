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
char in[100];


int main()
{
    int left = 63, pre = 0;
    memset(in, '\0', sizeof(in));
    while(gets(in)!=NULL){
        if(pre==0)
            printf("\t\t\tLEFT_GRAPH[%4d:%4d] <= %s;\n", pre, left, in);
        else
            printf("\t\t\tLEFT_GRAPH[%4d:%4d] <= %s;\n", pre, left, in);
        left += 64;
        pre += 64;
    }
    return 0;
}
