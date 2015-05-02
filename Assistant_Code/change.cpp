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



int main(void){
    int i, j;
    for(i=0; i<8; i++)
        for(j=0; j<64; j++)
    printf("					9'd%3d	:	PATTERN = {RIGHT_GRAPH[%4d], RIGHT_GRAPH[%4d], RIGHT_GRAPH[%4d], RIGHT_GRAPH[%4d], RIGHT_GRAPH[%4d], RIGHT_GRAPH[%4d], RIGHT_GRAPH[%4d], RIGHT_GRAPH[%4d]};\n", (64*i+j), (512*i+j)+448, (512*i+j)+384, (512*i+j)+320, (512*i+j)+256, (512*i+j)+192, (512*i+j)+128, (512*i+j)+64, (512*i+j));
    return 0;
}
//int main(void){
//    int i, j;
//    for(i=7; i>=0; --i)
//        for(j=63; j>=0; --j)
//    printf("					9'd%3d	:	PATTERN = {RIGHT_GRAPH[%4d], RIGHT_GRAPH[%4d], RIGHT_GRAPH[%4d], RIGHT_GRAPH[%4d], RIGHT_GRAPH[%4d], RIGHT_GRAPH[%4d], RIGHT_GRAPH[%4d], RIGHT_GRAPH[%4d]};\n", (64*i+j), (512*i+j), (512*i+j)+64, (512*i+j)+128, (512*i+j)+192, (512*i+j)+256, (512*i+j)+320, (512*i+j)+384, (512*i+j)+448);
//    return 0;
//}

