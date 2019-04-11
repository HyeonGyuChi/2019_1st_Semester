# 매개변수 알고 있을 경우 : 매개변수 지정해서 함수호출
# 기능 : 사칙연산을 수행

def calc(num1, num2, act) :

    sentence = num1 + act + num2
    if act in ["+","-","*","/"] :
        print("{} = {}".format(sentence, eval(sentence)))

    else :
        print("{} = {}".format(sentence, "잘못된 연산기호입니다."))

n1 = input("정수1: ")
n2 = input("정수2: ")
calc(n1,n2, "&")
calc(n1,n2, "*")
calc(num1=n1,num2=n2,act="*")
calc(num2=n2,num1=n1,act="*")
