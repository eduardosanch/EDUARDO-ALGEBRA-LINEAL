A = zeros(2, 2);
B = zeros(2, 1);

for i = 1:2
    for j = 1:2
        A(i, j) = input("Ingrese los elemento de A: ");
    end
end

for i = 1:2
    B(i, 1) = input("Ingrese los elemento de B: ");
end
A_original = A;
B_original = B;

% Paso 1: Comprobamos si el determinante de A es distinto de cero (el sistema tiene solución)
determinanteA = det(A);
if determinanteA == 0
    disp("No hay solución única por el método de Gauss-Jordan.");
else
    % Paso 2: Método Gauss-Jordan

    % Normalizar la primera fila para que sea 1
    escalar = A(1, 1);
    A(1, :) = A(1, :) / escalar;
    B(1) = B(1) / escalar;

    % Eliminar el valor debajo dela columna 1
    factor = A(2, 1);
    A(2, :) = A(2, :) - factor * A(1, :);
    B(2) = B(2) - factor * B(1);

    % Ahora normalizamos la segunda fila para que el pivote sea 1
    escalar = A(2, 2);
    A(2, :) = A(2, :) / escalar;  % Dividimos la fila 2 por el pivote en A(2,2)
    B(2) = B(2) / escalar;        % Actualizamos el valor de B en la misma forma

    % Eliminamos el valor por encima del pivote
    factor = A(1, 2);
    A(1, :) = A(1, :) - factor * A(2, :);  % Restamos la fila 2 multiplicada por el factor
    B(1) = B(1) - factor * B(2);           % Actualizamos B de la misma manera


    disp("Matriz A después de la reducción Gauss-Jordan:");
    disp(A);
    disp("Vector B después de la reducción Gauss-Jordan:");
    disp(B);

    X = B;

    %comprobacion
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



