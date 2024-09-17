import numpy as np 
a=[[2,0,1],
   [3,0,0],
   [5,1,1]]
b=[[0,0,0],[0,0,0],[0,0,0]]
c=2
filas=3
columnas=3
print(f"{a}"+"\n" )
for i in range(filas):
    for j in range(columnas):
        b[i][j]=a[i][j]*c 
for i in range(filas):
    print(f"{b[i]}")      
    


    
     
