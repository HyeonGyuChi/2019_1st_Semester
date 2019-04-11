finishNum = int(input("어디까지 : "))
# 컴프리헨션 : 값이 순차적인 리스트를 한 줄로 만드는 간단한 방법
numList = [num for num in range(1,finishNum+1) if num % 5 == 0]
print(numList)