A=[[1,2,3,4,7],[5,6,7,6,2],[8,9,8,1,3],[2,3,4,5,6],[1,2,3,4,5]]
X=5
for i in range(X):
        print(A[i])
print("\n")


for i in range(X):
    for j in range(X):
        if(i>j):
            A[i][j]=0
            
            
for i in range(X):
        print(A[i])
print("\n")