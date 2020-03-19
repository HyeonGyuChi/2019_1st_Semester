import random

print(random.random()) # 0~1미만의 숫자중 무작위

print(random.randrange(1,7)) # 1~7미만의 난수생성(정수)
print(random.choice([1,2,3,4,5])) #[]에서 랜덤으로 하나만 choice

list = []
for _ in range(100000) : # 10회
    list.append(random.randrange(1,100))# 1~101미만의 난수생성(정수)
    # list.append(random.randint(1,100))
print(list)