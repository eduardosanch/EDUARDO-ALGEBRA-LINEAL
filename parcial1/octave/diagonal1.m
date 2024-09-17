A = [0,1,2,3;
     4,5,6,7;
     8,9,10,11;
     12,13,14,15];
for i = 1:4
   for j = 1:4
      printf("%d ", A(i,j));
   end
   printf("\n");
end
for i = 1:4
   for j = 1:4
       if i == j
           printf("%d ", A(i,j));
       end
   end
   printf("\n");
end

