
disp('Introduce los valores de la matriz (3 columnas y 2 filas):');

Ab = zeros(2, 3);
for i = 1:2
    for j = 1:3
        Ab(i, j) = input(['Introduce el valor de Ab[', num2str(i), ',', num2str(j), ']: ']);
    end
end

% Paso 1: Eliminación de Gauss
for i = 1:2
    if Ab(i,i) != 1
        factor = Ab(i,i);
        Ab(i,:) = Ab(i,:) / factor; 
    end
    
    for j = i+1:2
        factor = Ab(j,i);
        Ab(j,:) = Ab(j,:) - factor * Ab(i,:);
    end
end

% Paso 2: Sustitución hacia atrás
x = zeros(2, 1);
x(2) = Ab(2,3) / Ab(2,2);  % Resolver la última variable

x(1) = (Ab(1,3) - Ab(1,2) * x(2)) / Ab(1,1);  % Resolver la primera variable

% Mostrar la solución
disp('La solución es:');
disp(x);

