# 7. 층 수를 입력받아 *삼각형모양으로 출력

floor = int(input("삼각형의 층수 ? "))


for i in range(0, floor) : # 입력한 층수 번 반복
    for _ in range(0, (floor -1) - i) : #공백찍기 -> 줄수가 바뀔때마다 1씩 감소하여 반복 // _를 사용하여 반복변수 생략
        print(" ", end  = "")

    for _ in range(0, (2 * i) + 1) : #2의 배수 +1 씩 증가10
        print("*", end = "")
    print() #줄바꿈
