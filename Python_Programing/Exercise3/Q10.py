# 10. 사용자로부터 문자를 입력받아 리스트에 저장 후, 과반 수가 넘는 문자를 출력하는 프로그램, 단, 입력받은 문자없으면 반복종료

chlist = [] # 사용자로 부터 입력받은 char 저장할 리스트
base = 0 # 비교하기 위한 기준 char
baseCnt = 0 # 리스트내의 base기준
overHalf = "" # 과반수 이상인 char
halfCnt = 0 # chlist의 반(과반수가 넘는기준)

# 사용자로부터 문자를 입력받아 리스트 저장
while True :
    inChar = input("문자입력 : ")
    if inChar == "" : # 입력이 없을 때 종료
        break
    # 입력시 chlist에 저장
    chlist.append(inChar)

print("chlist =", chlist) #chlist출력

# 과반수가 넘는 문자 출력
chlist.sort() # 먼저 sorting
halfCnt = len(chlist)/2 # 과반수가 넘는 기준

print(chlist) #chlist출력

for i in range(0, len(chlist)) :
    if baseCnt == 0 : # 처음 for문 시작할 때
        base = chlist[i] # base를 첫 번째 인덱스의 데이터로 초기화
        baseCnt = 1 # 1개

    elif base == chlist[i] : # base와 다음인덱스 데이터와 비교
        baseCnt += 1 # 서로 같으면 개수증가

    else : # 서로 다르면 base 초기화
        base = chlist[i]
        baseCnt = 1

    if baseCnt >= halfCnt : # chlist 원소개수의 절반이 넘을 시
        overHalf = base # for문을 나가고 그 문자로 저장
        break

# 과반수가 넘는 문자가 있는기 여부 확인 후 출력
if overHalf == "" :
    print("과반수가 넘는문자 없음")
else :
    print("과반수가 넘는문자 : " , overHalf)

