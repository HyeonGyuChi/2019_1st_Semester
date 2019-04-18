data = [[21,7,43,65], [2,8,72,52]]


while True :
    find = False
    num =  input('찾을 값? ')

    if not num.isdigit() :
        print('숫자아님')
        continue

    for i in range(len(data)) :
        if int(num) in data[i] :
            print('찾음 : ', i, data[i].index((int(num))))
            find = True
            break

    if not find :
        print('못 찾음')
        break