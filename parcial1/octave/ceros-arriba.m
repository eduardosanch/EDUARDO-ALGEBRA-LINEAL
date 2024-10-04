A=[4,1,2,3,6;
   4,5,6,7,1;
   8,9,1,7,8;
   2,3,4,7,5;
   5,7,8,9,1];
for i=1:5;
       for j=1:5;
              printf("%d ", A(i,j));
       end
       printf("\n");
end
for i=1:5;
        for j=1:5;
               if i<j
                   A(i,j)=0;
               end
        end
end

for i=1:5;
        for j=1:5;
                printf("%d", A(i,j));
        end
        printf("\n");
end
v



