import sys

age_s = ['25','25', '35', '24', '65', '85', '29', '30', '22', '45']
age_i = list(map(int, age_s)) # map : 문자열 리스트를 int형 리스트로 바꾸어줌

age = map(int, age_s)
print(set(age))


print("합 : ", sum(age_i))
print("최대 : ", max(age_i))
print("최소 : ", min(age_i))
'''
for ch in age_s :
    intCh = (int ch)

    sum += intCh

    if(intCh <= max) :
        min = intCh
    if(intCh >= min) :
        max = intCh


print(sum)
print(min)
print(max)'''
