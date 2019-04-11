# welcome() 함수실행
# 매개변수 : 이름
# 매개변수 : 이름 환영메시지
# 기능 : "환영합니다. 홍길동 님(매개변수)"을 출력
# 매개변수 두개 받을 경우 "반갑습니다. 홍길동 님"을 출력

def welcome(name, message = '환영합니다.') :
    print(message, name, "님")

welcome("홍길동")
welcome(message="반갑습니다.", name = "홍길동")
