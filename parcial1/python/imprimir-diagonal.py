A=[[1,2,3,4],[5,6,7,6],[8,9,10,11],[12,13,14,15]]
X=4
for i in range(X):
        print(A[i])
print("\n")
for i in range(X):
    for j in range(X):
        if(i==j):
            print(A[i][j])
