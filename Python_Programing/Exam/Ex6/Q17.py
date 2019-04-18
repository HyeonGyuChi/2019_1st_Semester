def val_change(data, val, chg) :

    if val not in data :
        return data, False

    else :
        data[data.index(val)] = chg
        return data, True


data = ['Python', 'C', 'Java','C++', 'Swift']

while True :
    val = input('뭐 변경?')
    chg = input('어떻게 변경?')

    data, flag = val_change(data, val, chg)

    if(flag) :
        print(data)
    else :
        print('선택한 값이 없어 종료할께')
        break