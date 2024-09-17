A=[4,1,2,3;
   4,5,6,7;
   8,9,1,7;
   2,3,4,7];
for i=1:4;
       for j=1:4;
              printf("%d ", A(i,j));
       end
       printf("\n");
end
for i=1:4;
        for j=1:4;
               if i!=j
                   A(i,j)=0;
	       end
        end
end

for i=1:4;
        for j=1:4;
                printf("%d", A(i,j));
        end
        printf("\n");
end

