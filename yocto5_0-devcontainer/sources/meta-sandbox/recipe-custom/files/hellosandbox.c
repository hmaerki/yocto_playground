#include <stdio.h>

void func_sandbox()
{
        printf("Inside func_sandbox()\n");
}

int main(void)
{
        printf("Hello Sandbox\n");
        func_sandbox();

        return 0;
}
