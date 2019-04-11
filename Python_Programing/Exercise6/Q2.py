a = b = c = 1

def func() :
    global a,b,c # 함수내에서 전역변수 a,b,c를 사용
    a = b = c = 2 # 전역변수를 2로 초기화
    print("func : ", a, b, c)

print("main():", a,b,c) # 1 1 1
func() # 2 2 2
print("main():", a,b,c) # 2 2 2