# 8. 사용자로부터 정수를 입력받아 리스트에 저장하고 최대값, 최소값, 총합 출력, 0입력시 종료
import sys
base = [] #입력받은 정수를 저장할 리스트
min = sys.maxsize
max = -(sys.maxsize) -1
sum = 0 # 합
# max은 시스템에서의 max값, min은 시스템에서의 min 값으로 설정해주어야 함! sys.maxsize 를 이용해 시스템에서의 max값 을 구할 수 있다.
# max = 0 (x)
# min = 0 (x)
#max min의 기준에 따라 답이 나올수도있고 안나올수도 있다.

## 모두 list에 저장하고 리스트의 최대값 최소값 총합 구하기
while True :
    num = int(input("정수입력 : "))

    if num == 0 : # 반복종료
        break

    base.append(num) #리스트에 입력값 저장

for i in base : # 리스트탐색
    if max < i : # 최대값구하기
        max = i
    if min > i : # 최소값구하기
        min = i
    sum += i # 리스트 원소의 합

print(base)
print("최대값=%d, 최소값 =%d, 총합=%d" %(max, min, sum))