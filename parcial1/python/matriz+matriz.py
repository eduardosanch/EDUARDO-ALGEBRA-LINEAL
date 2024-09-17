A=[[1,1],[1,1]]
B=[[1,1],[1,1]]
C=[[0,0],[0,0]]
X=2
for i in range(X):
    for j in range(X):
        C[i][j]=A[i][j]+B[i][j]
for i in range(len(C)):
    print(f"{C[i]}")
