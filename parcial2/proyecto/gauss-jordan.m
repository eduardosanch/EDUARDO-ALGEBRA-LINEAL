A = zeros(3, 3);
B = zeros(3, 1);

% Entrada de los elementos de la matriz A
for i = 1:3
    for j = 1:3
        A(i, j) = input("Ingrese los elementos de A: ");
    end
end

% Entrada de los elementos del vector B
for i = 1:3
    B(i, 1) = input("Ingrese los elementos de B: ");
end

A_original = A;
B_original = B;

% Paso 1: Comprobamos si el determinante de A es distinto de cero
determinanteA = det(A);
if determinanteA == 0
    disp("No hay solución única por el método de Gauss-Jordan.");
else
    % Paso 2: Método Gauss-Jordan

    % Iteramos para cada fila
    for k = 1:3
        % Verificamos si el pivote es cero o muy pequeño
        if abs(A(k, k)) < 1e-10
            % Buscamos una fila para intercambiar
            for i = k+1:3
                if abs(A(i, k)) > abs(A(k, k))
                    % Intercambiamos filas
                    temp_row = A(k, :);
                    A(k, :) = A(i, :);
                    A(i, :) = temp_row;

                    % Intercambiamos también en B
                    temp_val = B(k);
                    B(k) = B(i);
                    B(i) = temp_val;
                    break;
                end
            end
        end

        % Normalizamos la fila k para que el pivote sea 1
        escalar = A(k, k);
        A(k, :) = A(k, :) / escalar;
        B(k) = B(k) / escalar;

        % Eliminamos los valores en las otras filas de la columna k
        for i = 1:3
            if i ~= k
                factor = A(i, k);
                A(i, :) = A(i, :) - factor * A(k, :);
                B(i) = B(i) - factor * B(k);
            end
        end
    end

    % Mostrar resultados
    disp("Matriz A después de la reducción Gauss-Jordan:");
    disp(A);
    disp("Vector B después de la reducción Gauss-Jordan:");
    disp(B);

    % Aquí el vector X es igual al vector B transformado
    X = B;

    % Comprobación
    comprobarB = A_original * X;

    disp("Matriz A original:");
    disp(A_original);
    disp("Vector B original:");
    disp(B_original);
    disp("Solución X:");
    disp(X);
    disp("Comprobación A_original * X:");
    disp(comprobarB);
end


