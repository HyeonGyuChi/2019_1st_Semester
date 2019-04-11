dic = {}

while True :
    eng = input("영어 : ")

    if eng == '' :
        break

    if eng not in dic :
        print("\t-> %s 단어가 등록되어 있지 않습니다. 단어를 추가합니다" %eng)
        kor = input("한글 : ")
        dic[eng] = kor
        continue

    else :
        print("\t-> 등록단어입니다 %s : %s" %(eng, dic.get(eng)))

print(dic)

while True :
    eng = input("영어 단어를 입력하면 해석을 드립니다 : ")

    if eng in dic :
        print("\t%s %s" %(eng, dic[eng]))

    else :
        break

print("\t영어 단어가 없어 종료합니다")