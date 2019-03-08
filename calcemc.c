#include <stdio.h>
#include <curses.h>
#include <time.h>
#include <sys/time.h>
#include <math.h>

clock_t start, end;
double total;

int main(){

    start = clock();
    double num;

    float x = -16;
    num = fabs(x);
    printf("X em absoluto: %.4f\n", num);

    float a = 16;
    num = sqrt(a);
    printf("A raiz de x: %.4f\n", num);

    float ln = 10;
    num = log(ln)/log(M_E);
    printf("O logaritmo neperiano: %.4f\n", num);

    float b = 16;
    num = sin(b);
    printf("O seno de x: %.4f\n", num);

    num = cos(b);
    printf("O cosseno de x: %.4f\n", num);

    num = tan(b);
    printf("A tangente de x: %.4f\n", num);

    num = atan(b);
    printf("O arco tangente de x: %.4f\n", num);
    
    float d = 0.5;
    num = acos(d);
    printf("O arco cosseno de x: %.4f\n", num);

    num = asin(d);
    printf("O arco seno de x: %.4f\n", num);

    float y = 3.5;
    num = pow(M_E, y);
    printf("'e' elevado ao expoente y: %.4f\n", num);

    end = clock();
    total = (double)(end - start)/CLOCKS_PER_SEC;
    printf("Tempo decorrido: %f\n", total);

    return 0;
}