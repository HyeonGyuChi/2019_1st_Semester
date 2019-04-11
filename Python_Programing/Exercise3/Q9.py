# 9. 로또번호 생성기 로또 번호는 1~45까지의 중복되지 않는 6개 당첨 번호, 1개 보너스 번호로 구성
import random
# random.random [0, 1) 사이의 부동소수 == random.uniform(a,b)
# random.randint(a,b) a와 b사이의 랜덤정수
# random.choice(sep) 인수로 받음 sep(시퀸스자료형)에서 하나를 선택
# random.sample(population, k) random.choice와 비슷 k개만큼 뽑아내기

# a와 b사이의 랜덤정수 이용
ticketNum = int(input("몇 장 드릴까요 ? "))
## 교수님 답
for i in range(ticketNum) :
    lotto = sorted(random.sample(range(1,46),7)) #sample로 서로다른 7개의 숫자뽑기
    print('<', i+1, "> 당첨", lotto[:6], '+보너스',lotto[6])
## 교수님 답

# 1~45 번호 리스트 생성
for i in range(0, ticketNum) : # 티켓 개수만큼 반복

# list와 range를 사용하여 1씩증가하는 원소를 갖는 리스트 생성 1~45
    numList = list(range(1,46))

# 당첨 번호 // numList에서 랜덤으로 6번 pop
    goalNum = [] # 당첨번호 = pop한 번호를 담을 리스트
    for _ in range(0,6) :
        popNum = random.choice(numList) # numList의 랜덤원소를
        numList.remove(popNum) # pop 하고 원소지움
        goalNum.append(popNum) # pop 한 정수를 당첨리스트에 추가

# 보너스 번호
    bonusNum = random.choice(numList) # numList에서 랜덤으로 pop
    numList.remove(bonusNum) # pop 하고 원소지움

    print("<%d> " % (i + 1), end = " ")  # index 출력
    print("당첨 : ", goalNum, end = " + ")
    print("보너스 %d" % bonusNum)




