% Inicializar matrices A (3x3) y B (3x1)
A = zeros(3, 3);
B = zeros(3, 1);

% Ingresar los elementos de la matriz A
for i = 1:3
    for j = 1:3
        A(i, j) = input("Ingrese lod elementos de A");
    end
end

% Ingresar los elementos del vector B
for i = 1:3
    B(i, 1) = input("Ingrese los elementos de B");
end

% Guardar la matriz original y el vector B para la comprobación
A_original = A;
B_original = B;

% Paso 1: Eliminación Gaussiana
n = 3; % Tamaño de la matriz
for k = 1:n-1
    for i = k+1:n
        factor = A(i, k) / A(k, k);
        A(i, :) = A(i, :) - factor * A(k, :);
        B(i) = B(i) - factor * B(k);
    end
end

% Mostrar la matriz A y el vector B después de la eliminación
disp("Matriz A después de la eliminación:");
disp(A);
disp("Vector B después de la eliminación:");
disp(B);

% Paso 2: Sustitución hacia atrás para encontrar las soluciones
X = zeros(3, 1);
X(3) = B(3) / A(3, 3);
X(2) = (B(2) - A(2, 3) * X(3)) / A(2, 2);
X(1) = (B(1) - A(1, 2) * X(2) - A(1, 3) * X(3)) / A(1, 1);

% Paso 3: Comprobación de la solución utilizando la matriz original
comprobarB = A_original * X;

% Mostrar resultados finales
disp("Matriz A original:");
disp(A_original);
disp("Vector B original:");
disp(B_original);
disp("Solución X:");
disp(X);
disp("Comprobación A_original * X:");
disp(comprobarB);


