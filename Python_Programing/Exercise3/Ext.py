#Q10 교수님 답 : 과반수 찾기 알고리즘
chlist = []

while True:

    ch = input('문자입력 : ')

    if (ch == ''):
        break

    chlist.append(ch)

print('chlist=', chlist)

count = 0

candi = 0
## 서로다른 문자끼리 짝을 지어 상쇄시켰을때 0이되면 각각의 문자가 같은개수만큼 있는 것 -> 과반수x
## 만약 상쇄시켰을 때 남는문자가 있다면 : 과반수가 될 가능성 있음 -> 그 남는숫자의 개수 파악해서 과반수가 넘으면 OK
for i in range(len(chlist)):

    if count == 0:

        candi = chlist[i]

        count = 1

    elif candi == chlist[i]:

        count += 1

    else:

        count -= 1

if count == 0:

    print('과반수가 넘는 문자 없음')

else:
    print(candi)
    print(count)
    count = 0

    for i in range(len(chlist)):
## 서로 다른문자끼리 짝지어 상쇄시켜 남은 문자를 기준으로 list안에 몇개있는지 확인
        if candi == chlist[i]:
            count += 1
## 과반수가 넘는지 개수확인
    if count > len(chlist) // 2:

        print('과반수가 넘는 문자 = ', candi)
        print(count)
    else:

        print('과반수 넘는 문자 없음')
