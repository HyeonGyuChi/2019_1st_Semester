data = [ "Python", "C", "Java", "C++", "Swift", "R" ]
print(data)

def val_change(list, before, after) :
    if before in list :
        list[list.index(before)] = after
        change = True

    else :
        change = False

    return list, change


while True:

    val = input(' -> 변경하고 싶은 값: ')
    chg = input(' -> 변경 할 값: ')

    (data, flag) = val_change(data, val, chg)

    if (flag):
        print(data)
    else:
        print(' -> 자료가 일치하지 않아 수정하지 못했습니다')
        break


