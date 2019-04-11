#사용자로부터 정수를 입력받아 양수의 합을 구해 출력(음수입력시 합x / 0입력시 반복종료)

sum = 0
num = int(input("양수입력 ( 0 입력시 종료) : "))
formula = ""
count = 0

while num != 0 :  # 0입력시 종료
    if num > 0 : # 양수처리
        count += 1
        if count != 1 : # 첫번째 항이 아닐경우 앞에 +
            formula += " + " + str(num)
        else : # 첫번째 항일경우
            formula += str(num)

        sum += num # 입력한 양수의 합

    else : # 음수처리
        print("음수입력 : 무효")

    print(formula, end = '')
    print(" = %d" % sum)  # 총합 출력

    num = int(input("양수입력 ( 0 입력시 종료) : ")) #다시입력

if count == 0 : # 바로 입력종료
    formula = "0"

print(formula, "=", sum)
print("프로그램 종료")



