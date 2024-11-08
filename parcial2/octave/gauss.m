% Inicializar matrices A y B
A = zeros(2, 2);
B = zeros(2, 1);

% Ingresar los elementos de la matriz A
for i = 1:2
    for j = 1:2
        A(i, j) = input("Ingrese lod elementos de A");
    end
end

% Ingresar los elementos del vector B
for i = 1:2
    B(i, 1) = input("Ingrese los elementos de B");
end

% Guardar la matriz original para la comprobación
A_original = A;
B_original = B;

% Paso 1: Comprobación si el sistema tiene solución
determinanteA = A(1, 1) * A(2, 2) - A(1, 2) * A(2, 1);

if determinanteA == 0
    disp("No hay solución única por el método de Gauss.");
else
    % Paso 2: Eliminar la primera variable de la segunda fila
    factor = A(2, 1) / A(1, 1);
    
    % Actualizar la segunda fila de A y B usando el factor calculado
    A(2, :) = A(2, :) - factor * A(1, :);
    B(2) = B(2) - factor * B(1);

    % Paso 3: Sustitución hacia atrás para encontrar las soluciones
    X = zeros(2, 1);
    X(2) = B(2) / A(2, 2);  % Resolver para X2
    X(1) = (B(1) - A(1, 2) * X(2)) / A(1, 1);  % Resolver para X1

    % Paso 4: Comprobación de la solución utilizando la matriz original
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


