# vsum()
# 매개변수 2개 이상의 정수 // 가변적으로 전달받기
# 기능 : 합계 구해서 반환

def vsum(*numList) :
    # '+'.join(numList) // 안됨 매개변수로 "str" 아니면 리스트가 "str형"만 가능, 숫자만나면 오류
    # 그러므로 list(map(str,numList)) 로 str원소를 갖는 list로 바꾸어 주어야함

    if not numList : # numList가 비어있으면 # 파이썬에서는 빈[] 는 false
        pass # 꼭 빈자리로 남기지 말고 pass로 넘기기
    else :
        print('+'.join(list(map(str,numList))), "=", sum(numList))


vsum()
vsum(2,3)
vsum(2,3,4)
vsum(2,3,4,5)
