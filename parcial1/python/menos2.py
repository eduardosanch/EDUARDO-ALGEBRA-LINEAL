A=[[1,2,3,4],[5,6,7,6],[8,9,8,1],[2,3,4,5]]
X=4
for i in range(X):
        print(A[i])
print("\n")


for i in range(X):
    for j in range(X):
        if((i!=j)):
            A[i][j]=0
        else:
            A[i][j]=-2
            
            
for i in range(X):
        print(A[i])
print("\n")