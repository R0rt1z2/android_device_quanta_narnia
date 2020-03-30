#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    /* Return the remainder of the unsigned division of a and b */
    uint32_t __umodsi3(uint32_t numerator, uint32_t denominator) 
    {
        uint32_t rem;
        rem = numerator % denominator;
        return rem;
    }
}
