A=[[1,2,3],[5,6,7],[8,9,10]]
X=3
R=0
for i in range(X):
        print(A[i])
print("\n")
for i in range(X):
    for j in range(X):
        if(i==j):   
           R=R+A[i][j]
print(R)
