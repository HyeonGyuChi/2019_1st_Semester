import random

n = int(input('몇장 ?'))

for _ in range(n) :
    num = list(range(1,46))
    lotto = sorted(random.sample(num, 7))
    bonus = lotto.pop()
    print(lotto, 'bounus = ', bonus)

l = [2,3,1]
r = sorted(l)
print(r)