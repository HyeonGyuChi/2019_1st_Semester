#1 for와 range()함수를 이용하여 1부터 100까지의 모든 수의 합을 출력

sum = 0
for i in range(1,101) :
    sum+= i
    print(i, end = "")
    if i == 100 : #
        print(" = ", end = "")
    else :
        print(" + ", end = "")

print(sum)