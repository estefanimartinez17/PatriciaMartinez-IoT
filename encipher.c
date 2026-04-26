

#include "encipher.h"

void encipher(char *mensaje, int llave) {
    for (int i = 0; mensaje[i] != '\0'; ++i) {
        char c = mensaje[i];
        if (c >= 'a' && c <= 'z') {
            c = c + llave;
            if (c > 'z') c = c - 26;
            mensaje[i] = c;
        }
    }
}