% from octave

printf("From octave:\n");

A = [1, -1; 2, 3]

A1 = inv(A)

I = A1 * A

B = [-1; 8]

X = A1 * B

A * X

% from scratch

determinanteA = A(1, 1) * A(2, 2) - A(1, 2) * A(2, 1); % Calculo el determinante de la matriz

X = zeros(size(A, 1), size(B, 2)); % Creo la matriz X con el numero de filas de A y numero de columnas de B
adj = [A(2, 2), A(2, 1); A(1, 2), A(1, 1)]; % Creo la matriz adjunta
adjT = zeros(2, 2); % Creo una matriz llena de zero que será la transpuesta de la matriz adjunta

for i = 1:size(adj, 1)
	for j = 1:size(adj, 2) % Ciclos for para controlar las posiciones de la matriz
		if (mod(i+j, 2) == 1) % si la suma de la posicion i y j actuales es impar
			adj(i, j) *= -1; % Se multiplica por -1 para asignar su signo correcto
		end % fin if
	end % fin for j
end %fin for i

for i = 1:size(adj, 1)
	for j = 1:size(adj, 2) % Ciclos for para controlar las posiciones de la matriz
		adjT(i, j) = adj(j, i); % Asigno los valores correspondientes a la transpuesta
	end % fin for j
end % fin for i

printf("From scratch:\n");

for i = 1:size(adjT, 1)
	for j = 1:size(adjT, 2) 
		A1(i, j) = adjT(i, j) / determinanteA; % Calculo la matriz inversa dividiendo cada valor de la transpuesta entre el determinante

		printf("%d ", A1(i, j)); % Muestro cada valor de la matriz inversa separada por un espacio
	end % fin for j

	printf("\n"); % Imprimo un salto de linea
end % fin for i

I = zeros(2, 2); % Creo la matriz identidad de 2x2

for i = 1:size(I, 1)
	for j = 1:size(I, 2) % Ciclos for para controlar la matriz identidad
		for k = 1:size(A, 2) % Ciclo for para multiplicar A * A1
			I(i, j) += A(i, k) * A1(k, j); % Le asigno a cada posicion de I la multiplicacion de A * A1
		end % fin for k
	end % fin for j
end % fin for i

printf("\nMatriz identidad:\n");

for i = 1:size(I, 1)
	for j = 1:size(I, 2) % Ciclos for para controlar la matriz Identidad
		printf("%d ", I(i, j)); % muestro cada valor de la matriz identidad separado por un espacio
	end % fin for j
	
	printf("\n"); % Imprimo un salto de linea
end % fin for i

for i = 1:size(X, 1)
	for j = 1:size(X, 2) % Ciclos para navegar las posiciones de X
		for k = 1:size(A1, 2) % Ciclo con el tamaño en común de A1 y B
			X(i, j) += A1(i, k) * B(k, j);
		end
	end
end

printf("\nValor de la matriz X:\n");

for i = 1:size(X, 1)
	for j = 1:size(X, 2) % Ciclos para navegar por X
		printf("%d ", X(i, j)); % Muestra cada posicion de X separdas por un espacio
	end
	
	printf("\n")
end

printf("\nComprobacion:\n");

comprobarB = zeros(2, 1); % Variable para comprobar que los valores de X sean correctos
for i = 1:size(comprobarB, 1)
	for j = 1:size(comprobarB, 2) % Ciclo para navegar por comprobarB
		for k = 1:size(A, 2) % Ciclo con el tamaño en comun de A y X
			comprobarB(i, j) += A(i, k) * X(k, j);
		end
	end
end

for i = 1:size(comprobarB, 1)
	for j = 1:size(comprobarB, 2)
		printf("comprobarB: %d ", comprobarB(i, j)); % Mostramos cada valor de comprobarB
		printf("\nB: %d", B(i, j)); % Mostramos cada valor de B para comprobar si son iguales
	end
	
	printf("\n")
end
