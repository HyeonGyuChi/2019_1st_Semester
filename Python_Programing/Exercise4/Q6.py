str1 = input("문자 여러 개 입력 : ")
str2 = input("문자 여러 개 입력 : ")
strList = []

for char in str1 :
    strList.append(char)
    set1 = set(strList)

strList.clear() # 리스트의 내용을 모두 지움

for char in str2 :
    strList.append(char)
    set2 = set(strList)

print(str1, "종류=", str(set1))
print(str2, "종류=", str(set2))

print("두 종류에 동시에 들어 있는 문자=", (set1&set2))