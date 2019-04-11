splitStr = []
str = input("날짜(연/월/일) 입력 : ")

splitStr = str.split("/")


print(splitStr[0], end = "년")
print(splitStr[1], end = "월")
print(splitStr[2], end = "일")
