v=[2,-1,4];
k=3;
kv=k*v;
kv
% from scratch 
kv = [0,0,0];
for i=1:3
	kv(i) =v(i)*k;
end 
for i=1:3
	printf("%d", kv(i));
end 
printf("\n");
