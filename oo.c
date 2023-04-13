#include<stdio.h>
#include<string.h>

int romanToInt(char * s);


int main(){
char *s;

scanf("%s",s);
romanToInt(s);

}


int romanToInt(char * s)
{
if((strlen(s)>=1)&&(strlen(s)<=15))    
{int sum=0;
    for(int i= 0, n= strlen(s); i<n; i++)
    {
        //M checker
        if((s[i]=='M'))
        {
            sum+=1000;
            if(s[i-1]=='D')
            {
                sum-=500*2;
            }
            else if(s[i-1]=='C')
            {
                sum-=100*2;
            }
            else if(s[i-1]=='L')
            {
                sum-=50*2;
            }
            else if(s[i-1]=='X')
            {
                sum-=10*2;
            }
            else if(s[i-1]=='V')
            {
                sum-=5*2;
            }
            else if(s[i-1]=='I')
            {
                sum-=1*2;
            }
        }

            //D checker
        if(s[i]=='D')
        {
            sum+=500;
            if(s[i-1]=='C')
            {
                sum-=100*2;
            }
            else if(s[i-1]=='L')
            {
                sum-=50*2;
            }
            else if(s[i-1]=='X')
            {
                sum-=10*2;
            }
            else if(s[i-1]=='V')
            {
                sum-=5*2;
            }
            else if(s[i-1]=='I')
            {
                sum-=1*2;
            }
        }
            //C checker
        if(s[i]=='C')
        {
            sum+=100;
            if(s[i-1]=='L')
            {
                sum-=50*2;
            }
            else if(s[i-1]=='X')
            {
                sum-=10*2;
            }
            else if(s[i-1]=='V')
            {
                sum-=5*2;
            }
            else if(s[i-1]=='I')
            {
                sum-=1*2;
            }
        }
            //L checker
        if(s[i]=='L')
        {
            sum+=50;
            if(s[i-1]=='X')
            {
                sum-=10*2;
            }
            else if(s[i-1]=='V')
            {
                sum-=5*2;
            }
            else if(s[i-1]=='I')
            {
                sum-=1*2;
            }
        }
            //X checker
        if(s[i]=='X')
        {
            sum+=10;
            if(s[i-1]=='V')
            {
                sum-=5*2;
            }
            else if(s[i-1]=='I')
            {
                sum-=1*2;
            }
            
        }    //V checker
        if(s[i]=='V')
        {
            sum+=5;
            if(s[i-1]=='I')
            {
                sum-=1*2;
            }

        }    
            //I checker
        if(s[i]=='I')
        {
            sum+=1;
        }
    
        }
    printf("%d", sum);
    return 0;
 }
 else
 {
     return 1;
 }
}