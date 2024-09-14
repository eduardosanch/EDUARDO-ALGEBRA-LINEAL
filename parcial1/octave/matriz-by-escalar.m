A=[2, 0, 1;
   3, 0, 0;
   5, 1, 1];
B= [0, 0, 0;
    0, 0, 0;
    0, 0, 0];
C=2;
for i=1:3;
	for j=1:3;
		printf("%d",A(i,j));
		B(i,j)=A(i,j)*C;
	end
	fprintf("\n");
end
printf("\n");
for i=1:3;
	for j=1:3;
		fprintf("%d", B(i,j));
	end
fprintf("\n");
end
