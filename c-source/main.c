#include <stdio.h>

extern double logic(double accuracy);

int main(int argc, char *argv[]) {
    double accuracy;

    if (argc == 3) {   
        FILE *input = fopen(argv[1], "r");
        if (input == NULL) {
            printf("Error");
            return 0;
        }
        fscanf(input, "%lf", &accuracy);
        fclose(input);

        if (accuracy > 0.0005 || accuracy < 0.000001) {
            printf("Wrong accuracy(must be between 0.000002 and 0.0005), will be replaced with default 0.0005");
            accuracy = 0.0005;
        }

        FILE *output = fopen(argv[2], "w");
        if (output == NULL) {
            printf("Error");
            return 0;
        }
        fprintf(output, "%lf ", logic(accuracy));
        fclose(output);
        return 0;
    }
    printf("Wrong amount of console parapmeters");
    return 0;
}