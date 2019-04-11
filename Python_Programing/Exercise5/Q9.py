alist, ralist = [], []
str = ''

while(True) :
    str = input("문자열입력 : ")

    if str == '' :
        break

    alist.append(str)

    print('alist=', alist)
    print('ralist=', ralist)
    print("\n역순")

    while len(alist) :
        ralist.append(alist.pop())


    print('alist=', alist)
    print('ralist=', ralist)