

madeBeasu = lambda end : list(range(5,end+1,5)) # 컴프리핸션 == [num for num in range(1, end+1) if num % 5 == 0]
# 람다함수를 사용함으로서 우항은 더이상 변수x 함수명! range에서 end+1 주의!!
# lambda 매개변수 : return 값


endNum = int(input("입력 받은 수 까지의 5의 배수를 만듭니다, 어디까지 : "))
numList = madeBeasu(endNum)
print(numList)
addNum = int(input("위 리스트의 모든 원소에 더할 값은 : "))
print(list(map(lambda num : num+addNum, numList)))

