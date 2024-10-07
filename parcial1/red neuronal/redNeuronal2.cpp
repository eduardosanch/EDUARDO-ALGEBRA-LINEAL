#include <iostream>
#include <fstream>
#include <string>
#include<cstdlib>
using namespace std;

// Función para convertir los valores en 1 o -1
void convertir(double a[], int resultado[], int size) {
    for (int i = 0; i < size; ++i) {
        if (a[i] > 0) {
            resultado[i] = 1;
        } else {
            resultado[i] = -1;
        }
    }
}

// Función para leer una matriz desde un archivo txt
void leerMatriz(const string& nombreArchivo, int matriz[9][9]) {
    ifstream archivo(nombreArchivo.c_str());
    if (!archivo.is_open()) {
        cerr << "No se pudo abrir el archivo: " << nombreArchivo << endl;
        exit(1);
    }
    
    for (int i = 0; i < 9; ++i) {
        for (int j = 0; j < 9; ++j) {
            archivo >> matriz[i][j];
        }
    }

    archivo.close();
}

// Función para convertir una matriz 9x9 en un vector de 81 elementos
void convertirMatrizEnVector(int matriz[9][9], int vector[81]) {
    int index = 0;
    for (int i = 0; i < 9; ++i) {
        for (int j = 0; j < 9; ++j) {
            vector[index++] = matriz[i][j];
        }
    }
}

int main() {
    // Declarar matrices de 9x9 para cada figura
    int figura1[9][9], figura2[9][9], figura3[9][9], figura4[9][9], figura5[9][9], figura6[9][9], figura7[9][9];
    
    // Leer las matrices desde los archivos
    leerMatriz("uno.txt", figura1);
    leerMatriz("dos.txt", figura2);
    leerMatriz("tres.txt", figura3);
    leerMatriz("cuatro.txt", figura4);
    leerMatriz("cinco.txt", figura5);
    leerMatriz("seis.txt", figura6);
    leerMatriz("siete.txt", figura7);
    
    // Convertir las matrices en vectores de 81 elementos
    int vector1[81], vector2[81], vector3[81], vector4[81], vector5[81], vector6[81], vector7[81];
    convertirMatrizEnVector(figura1, vector1);
    convertirMatrizEnVector(figura2, vector2);
    convertirMatrizEnVector(figura3, vector3);
    convertirMatrizEnVector(figura4, vector4);
    convertirMatrizEnVector(figura5, vector5);
    convertirMatrizEnVector(figura6, vector6);
    convertirMatrizEnVector(figura7, vector7);

    // Matriz de pesos de 81x81 inicializada en 0
    double w[81][81] = {0};

    // Sumar los productos externos para formar la matriz de pesos
    int* vectores[7] = {vector1, vector2, vector3, vector4, vector5, vector6, vector7};
    
    for (int k = 0; k < 7; ++k) {
        for (int i = 0; i < 81; ++i) {
            for (int j = 0; j < 81; ++j) {
                w[i][j] += vectores[k][i] * vectores[k][j];
            }
        }
    }

    // Vector de entrada proporcionado por el usuario
    int vec1[81];
    cout << "Ingresa un vector de 81 valores entre corchetes ([]): " << endl;
    for (int i = 0; i < 81; ++i) {
        cin >> vec1[i];
    }

    double vec2[81] = {0};

    // Bucle hasta que el vector de entrada no cambie
    bool converged = false;
    while (!converged) {
        converged = true;
        
        // Multiplicar vec1 por la matriz de pesos w para obtener vec2
        for (int i = 0; i < 81; ++i) {
            vec2[i] = 0;
            for (int j = 0; j < 81; ++j) {
                vec2[i] += vec1[j] * w[i][j];
            }
        }

        // Convertir vec2 a vec1 usando la función convertir
        int temp[81];
        convertir(vec2, temp, 81);

        // Comparar vec1 con temp para ver si ha convergido
        for (int i = 0; i < 81; ++i) {
            if (vec1[i] != temp[i]) {
                converged = false;
                break;
            }
        }

        // Actualizar vec1 si no ha convergido
        if (!converged) {
            for (int i = 0; i < 81; ++i) {
                vec1[i] = temp[i];
            }
        }
    }

    // Mostrar el vector resultado
    cout << "La figura más parecida es:" << endl;
    for (int i = 0; i < 81; ++i) {
        cout << vec1[i] << " ";
        if ((i + 1) % 9 == 0) {
            cout << endl;
        }
    }

    return 0;
}

