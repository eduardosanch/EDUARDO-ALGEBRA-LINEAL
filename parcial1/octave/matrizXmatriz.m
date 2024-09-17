A=[1,1;
   1,1];
B=[1,1;
   1,1];
C=[0,0;
   0,0];
 
for i=1:2;
	for j=1:2;
		C(i,j)=A(i,j)+B(i,j);
		fprintf("%d", C(i,j));

	end 
	printf("\n");
end 



