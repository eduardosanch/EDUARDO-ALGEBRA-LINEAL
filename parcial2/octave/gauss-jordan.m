
disp('Introduce los valores de la matriz (3 columnas y 2 filas):');

% Crear la matriz aumentada A|b
Ab = zeros(2, 3);
for i = 1:2
    for j = 1:3
        Ab(i, j) = input(['Introduce el valor de Ab[', num2str(i), ',', num2str(j), ']: ']);
    end
end

% transfrmación hacia la matriz identidad
for i = 1:2
    if Ab(i,i) != 1
        factor = Ab(i,i);
        Ab(i,:) = Ab(i,:) / factor;
    end
    
    for j = 1:2
        if j != i
            factor = Ab(j,i);
            Ab(j,:) = Ab(j,:) - factor * Ab(i,:); % Restamos filas para hacer cero los elementos
        end
    end
end

x = Ab(:,3);  % La última columna es el vector de soluciones

disp('La solución es:');
disp(x);


