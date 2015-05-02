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
    int left = 0, right = 63;
    while(gets(in)){
        printf("temp_R[%4d:%4d] <= %s;\n", left, right, in);
        left += 64;
        right += 64;
        memset(in, '\0', sizeof(in));
    }
    return 0;
}
