a=b=c=1

def func() :
    a=b=c=2
    print("func:", a, b, c)

print("main:", a,b,c) # 1 1 1
func() # 2 2 2
print("main:",a,b,c) # 1 1 1