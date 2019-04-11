a = b = c = 1

def func1() :
    a = b = c = 2

def func2() :
    a = b = c = 3

print(a,b,c) # main : 1 1 1
func1() # 각자의 지역변수로 a b c = 2
print(a,b,c) # 1 1 1 # 전역변수에는 영향 x
func2() # 각자의 지역변수로 a b c = 3
print(a,b,c)  # 1 1 1