import time

now = time.localtime()

print(now.tm_year)
print(now.tm_mon)

str = input("주민등록번호 년월일 : ")

# 주민등록 처리할때 : 앞6자리 - ? 까지 받아야 됨
# 980416 일때 ? 1,2
# 001230 일때 ? 3,4

age = now.tm_year - (int(str[0:2])+1900)+1

if str[6] == '3' or str[6] == '4' : # 꼭 7번째 자리를 확인하여 00 생 이상이면 100을 빼주자!
    age -= 100

print(age)