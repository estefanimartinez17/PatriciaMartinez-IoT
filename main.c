#include <stdio.h>
#include "encipher.h"

int main() {
    printf("Cifrado Cesar utilizando una llave=3 en C\n");
    char texto[] = "IoTEmbebidos";
    printf("Mensaje original: %s\n", texto);
    
    encipher(texto, 3);
    printf("Mensaje cifrado: %s\n", texto);
    
    return 0;
}