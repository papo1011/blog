#include <stdio.h>
#include <stdlib.h>

#define SIZE 10000

int main() {
    int (*matrix)[SIZE] = malloc(SIZE * sizeof(*matrix));
    if (!matrix) {
        printf("Memory allocation failed :(\n");
        return 1;
    }

    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            matrix[i][j] = 0;
        }
    }

    free(matrix);

    return 0;
}
