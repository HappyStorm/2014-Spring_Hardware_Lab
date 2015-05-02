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
    int tmp = 0;
    memset(in, '\0', sizeof(in));
    while(gets(in)!=NULL){
        printf("\t\t\t\t\t\t\t%d%s\n", tmp++, in);
        memset(in, '\0', sizeof(in));
    }
    return 0;
}
