#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    /* Return the remainder of the unsigned division of a and b */
    unsigned int __umodsi3(unsigned int a, unsigned int b) 
    {
        unsigned int rem;
        rem = a % b;
        return rem;
    }
}
