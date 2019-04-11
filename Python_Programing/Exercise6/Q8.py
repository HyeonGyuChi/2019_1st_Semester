# div_qr()
# 두 정수 매개변수
# 기능 : 몫과 나머지를 동시에 반환

# 조건 : 함수내부에서 튜플방식으로 반환시 return(몫,나머지)형식반환
# 함수 호출하여 결과 반환 받을 때는 (몫,나머지) = div_qr()로 작성

def div_qr(num1, num2) :
    mok = num1 // num2
    na = num1 % num2

    return mok, na

num1 = int(input("정수 1 : "))
num2 = int(input("정수 2 : "))

mok , na = div_qr(num1, num2)

print("몫: %d, 나머지: %d" %(mok, na))