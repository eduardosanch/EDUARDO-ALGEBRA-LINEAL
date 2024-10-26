A = zeros(3, 3);
B = zeros(3, 1);

for i = 1:size(A, 1)
	for j = 1:size(A, 2)
		A(i, j) = input("");
	end
end

for i = 1:size(B, 1)
	for j = 1:size(B, 2)
		B(i, j) = input("");
	end
end

% Paso 1: Calcular determinante

determinanteA = (A(1, 1) * A(2, 2) * A(3, 3) + A(2, 1) * A(3, 2) * A(1, 3) + A(3, 1) * A(1, 2) * A(2, 3)) - (A(1, 3) * A(2, 2) * A(3, 1) + A(2, 3) * A(3, 2) * A(1, 1) + A(3, 3) * A(1, 2) * A(2, 1));

% Paso 2: Calcular adjunta

adj = [A(2, 2) * A(3, 3) - A(2, 3) * A(3, 2),A(2, 1) * A(3, 3) - A(2, 3) * A(3, 1), A(2, 1) * A(3, 2) - A(2, 2) * A(3, 1); A(1, 2) * A(3, 3) - A(1, 3) * A(3, 2), A(1, 1) * A(3, 3) - A(1, 3) * A(3, 1), A(1, 1) * A(3, 2) - A(1, 2) * A(3, 1); A(1, 2) * A(2, 3) - A(1, 3) * A(2, 2), A(1, 1) * A(2, 3) - A(1, 3) * A(2, 1), A(1, 1) * A(2, 2) - A(1, 2) * A(2, 1)];

% Paso 3: Calcular signos

for i = 1:size(adj, 1)
	for j = 1:size(adj, 2)
		if(mod(i+j, 2))
			adj(i, j) *= -1;
		end
	end
end

% Paso 4: Calcular transpuesta

for i = 1:size(adj, 1)
	for j = 1:size(adj, 2)
		adjT(i, j) = adj(j, i);
	end
end

% Paso 5: Calcular matriz inversa

for i = 1:size(adjT, 1)
	for j = 1:size(adjT, 2)
		A1(i, j) = adjT(i, j) / determinanteA;
	end
end

% Paso 6: Comprobar, A * A1 = I

I = zeros(3, 3);

for i = 1:size(A, 2)
	for j = 1:size(A1, 1)
		for k = 1:size(A, 1)
			I(i, j) += A(i, k) * A1(k, j);
		end
	end
end

% Paso 7: X = A-1 * B

X = zeros(size(A1, 1), size(B, 2));

for i = 1:size(X, 1)
	for j = 1:size(X, 2)
		for k = 1:size(A1, 2)
			X(i, j) += A1(i, k) * B(k, j);
		end
	end
end

% Paso 8: Comprobacion

comprobarB = zeros(3, 1);

for i = 1:size(B, 1)
	for j = 1:size(B, 2)
		for k = 1:size(A, 2)
			comprobarB(i, j) += A(i, k) * X(k, j);
		end
	end
end

A
B

adj
adjT
A1
I

X
comprobarB
