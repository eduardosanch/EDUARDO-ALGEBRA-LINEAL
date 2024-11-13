
A = zeros(3, 3);
B = zeros(3, 1);

for i = 1:3
    for j = 1:3
        A(i, j) = input("Ingrese los elemento de A: ");
    end
end

for i = 1:3
    B(i, 1) = input("Ingrese los elemento de B: ");
end

A_original = A;
B_original = B;

% Paso 1: Comprobamos si el determinante de A es distinto de cero
determinanteA = det(A);
if determinanteA == 0
    disp("No hay solución única por el método de Gauss-Jordan.");
else
    % Paso 2: Método Gauss-Jordan

    escalar = A(1, 1);
    A(1, :) = A(1, :) / escalar;
    B(1) = B(1) / escalar;


    for i = 2:3
        factor = A(i, 1);
        A(i, :) = A(i, :) - factor * A(1, :);
        B(i) = B(i) - factor * B(1);
    end

    % Normalizar la segunda fila
    escalar = A(2, 2);
    A(2, :) = A(2, :) / escalar;
    B(2) = B(2) / escalar;

    % Eliminar elementos debajo del pivote A(2,2)
    factor = A(3, 2);
    A(3, :) = A(3, :) - factor * A(2, :);
    B(3) = B(3) - factor * B(2);

    % Eliminar elementos por encima del pivote A(2,2)
    factor = A(1, 2);
    A(1, :) = A(1, :) - factor * A(2, :);
    B(1) = B(1) - factor * B(2);

    % normalizar la tercera fila
    escalar = A(3, 3);
    A(3, :) = A(3, :) / escalar;
    B(3) = B(3) / escalar;

    % Eliminar elementos por encima del pivote A(3,3)
    for i = 1:2
        factor = A(i, 3);
        A(i, :) = A(i, :) - factor * A(3, :);
        B(i) = B(i) - factor * B(3);
    end

    disp("Matriz A después de la reducción Gauss-Jordan:");
    disp(A);
    disp("Vector B después de la reducción Gauss-Jordan:");
    disp(B);

    
    X = B;

    % Paso 5: Comprobación de la solución usando la matriz original A y el vector X
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
end

