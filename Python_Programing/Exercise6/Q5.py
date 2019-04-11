# 문자열, 회수가 매개변수인 함수 = 횟수만큼 문자열을 반복출력 = print_str()함수

# 문자열 횟수 각각 사용자로부터 입력 -> print_str() 함수호출 후 실행결과 확인

def print_str(str, count) :
    for _ in range(count) :
        print(str)

str = input("문자열 : ")
count = int(input("횟수 : "))

print_str(str, count)

