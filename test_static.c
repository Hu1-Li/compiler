#include <stdio.h>
void A()
{
    static int i = 0;
    if(!i) {
        printf("%d", i++);
    } else {
        printf("%d", i);
    }
}
int main()
{
    A();
    A();
    return 0;
}

