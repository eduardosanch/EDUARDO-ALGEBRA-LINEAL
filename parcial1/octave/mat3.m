A=[0 1 2;
   3 4 5;
   6 7 8;]
 columnas=3;
 filas = 3;
for  i=1:filas;
	for j=1:columnas;
		fprintf("%d", A(i,j));
	end 
fprintf("\n");
end 

