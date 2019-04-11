def max_func(*paraList) :
    print(" ".join(list(map(str,paraList))), end ="")
    return max(paraList) #max의 경우 반복자객체에서 가장 큰값을 출력 max('apple') == p

max_val = max_func(10, 20)
print(":max_val ==>", max_val)

max_val = max_func(10, 20, 30)
print(":max_val ==>", max_val)

max_val = max_func('a', 'b', 'c', 'd')
print(":max_val ==>", max_val)

max_val = max_func('apple', 'banana', 'apples', 'group')
print(":max_val ==>", max_val)