#5. 문자열을 입력 받은 후
# while반복을 이용하여 한 문자를 입력받아
# 해당 문자가 앞서 입력한 문자열 내에 있으면 "Python에 존재함" 출력 없으면 존재하지않음 출력
# 빈 문자열 입력 무한반복 종료

#입력
string = input("문자열 : ") # 문자열 입력

#처리
while True :
    character = input("문자 : ")

    if character == "0" : # 0입력시 반복문문종료
        print("종료합니다")
        break

    else :
        if character in string : ##list안의 원소들이 있으면 True <-> not in  = 없을 때 True
            print("문자 %s가 문자열 %s에 존재함" %(character, string))

        else : # == character not in string
            print("문자 %s가 문자열 %s에 존재하지 않음" %(character, string))

