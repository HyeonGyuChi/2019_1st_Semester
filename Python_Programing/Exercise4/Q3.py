count = {'banana': 0, 'grape': 0, 'apple': 0}

while True:
    productName = input('제품명 : ')

    if productName == '':
        break

    if productName not in count:
        print("%s 는 미등록 제품입니다. " % productName)
        continue

    addQuantity = int(input('추가 수량 : '))

    count[productName] += addQuantity

for key in count:
    print("count[%s]= %d" % (key, count[key]))
