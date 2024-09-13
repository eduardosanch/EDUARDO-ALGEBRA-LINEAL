import numpy as np
#vector * escalar 
v= np.array([2,-1,4])
k=3
kv=k*v
print(kv)
#con ciclo 
kv=np.array([0,0,0])
for i in range(len(v)):
    kv[i]=v[i]*k
for item in kv:
    print(item)
