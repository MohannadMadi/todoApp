#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

void sum(int x, int y);


int main() 
{
    int x,y;
    scanf("%d",&x);
    scanf("%d",&y);
    sum(x,y);
    return 0;
}

void sum(int x, int y)
{
    int sum = x+y;
    printf("%d", sum);
}