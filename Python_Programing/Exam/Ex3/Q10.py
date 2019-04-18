lit = []

while True :
    ch = input('입력 : ')
    if ch == '' :
        break

    lit.append(ch)

base = ''
cnt = 0

for i in range(len(lit)) :
    if cnt == 0 :
        base = lit[i]
        cnt = 1

    elif base == lit[i] :
        cnt+=1

    else :
        cnt-=1

if cnt == 0 :
    print('없음')

else :
    cnt = 0
    for i in range(len(lit)) :
        if base == lit[i] :
            cnt += 1

    if cnt > len(lit)/2 :
        print(base)

    else :
        print('없음')

