A = [0,1,2;
     4,5,6;
     8,9,10;];
R=0;
for i = 1:3
   for j = 1:3
      printf("%d ", A(i,j));
   end
   printf("\n");
end

for i = 1:3
   for j = 1:3
	   if i==j
           	R=R+A(i,j);
    	   end
   end
end
printf("%d" , R);
