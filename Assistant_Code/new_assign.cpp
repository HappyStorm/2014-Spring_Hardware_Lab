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
/*
    assign temp_L[63:0] = 64'b0000000000000000000000000000000000000000000000000000000000000000;
	assign temp_L[127:64] = 64'b0000000000000000000000000000000000000000000000000000000000000000;
*/


int main()
{
    memset(in, '\0', sizeof(in));
    int right = 63, pre = 0;
    while(gets(in)){
        printf("assign temp_L[%4d:%4d] = %s;\n", pre, right, in);
        right += 64;
        pre += 64;
        memset(in, '\0', sizeof(in));
    }
    return 0;
}
