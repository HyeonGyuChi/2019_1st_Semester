str = input("문자열 입력 : ")

for i in str :
    if i.isdigit() :
        continue
    else :
        print(i, end="")



## 교수님 코드
str = input("문자열 입력 : ")
outStr = ''

for ch in str :
    if ch.isdigit() == False :
        outStr += ch

print('숫자를 제거한 문자열 : ' + outStr)