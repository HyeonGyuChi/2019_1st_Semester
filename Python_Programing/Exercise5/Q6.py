numCnt,lowerCnt,upperCnt,hanCnt,etcCnt = [0]*5

str = input("문자열을 입력하세요 : ")

for ch in str :
    if ch.isalpha() : #대문자 소문자 한글 기타
        if (ch >= '가' and ch <= '힣') : # 한글이 lower로 들어가기 때문에 함수사용시 alpha 한글순 체크
            hanCnt += 1
        elif ch.isupper() : #대문자 //만약 함수를 사용하지않고 'a'~'z' 사용하면 한글체크 먼저 할 필요없음
            upperCnt += 1
        else : #소문자
            lowerCnt += 1

    elif ch.isdigit() :
        numCnt += 1

    else :
        etcCnt += 1

print("대문자 : %d, 소문자 : %d, 숫자 : %d, 한글 : %d, 기타 : %d" % (numCnt, lowerCnt, upperCnt, hanCnt, etcCnt))