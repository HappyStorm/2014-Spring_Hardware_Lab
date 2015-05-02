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

//  9'd0	:	PATTERN = RIGHT_GRAPH[0:7];
//  9'd1	:	PATTERN = RIGHT_GRAPH[8:15];
int main()
{
    int left = 7, pre = 0;
    for(int i=0 ; i<=511 ; ++i){
        printf("9'd%d\t:\tPATTERN = LEFT_GRAPH[%d:%d];\n", i, left, pre);
        left += 8;
        pre += 8;
    }
    return 0;
}
