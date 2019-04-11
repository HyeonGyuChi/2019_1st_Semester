#4 문자열을 입력받아 for 반복을 이용하여 한 글자씩 개별 문자로 출력. 역순으로도 출력

line = input("문자열 : ")

print(line)
print("개별 문자 출력 : ", end = " ")
for i in line : #문자열의 경우 그냥
    print(i, end = " ")

print("\n역순 문자 출력 : ", end = " ")
# list.reverse() -> 문자열은 reverse불가

for i in line[::-1] : #-1은 마지막인덱스 값 -(len(line))까지
    print(i, end = " ")