print("----- 13 ----- ")
num1, num2 = int(input("첫번째 정수 : ")), int(input("두번째 정수: "))
print("%d / %d = %f, 몫 : %d 나머지 : %d" % (num1, num2, num1 / num2, num1 // num2, num1 % num2))
print("----- 14 ----- ")
sec = int(input("초 : "))
print("%d 초 = %d분 %d초" % (sec, sec // 60, sec % 60))
print("----- 15 ----- ")
print(0xFF00 & 0x00FF)
print(0xFF00 | 0x00FF)  ## a = (pow(2, 15)-1) + pow(2, 15) // unsigned 최대값
print(0xFF00 ^ 0x00FF)
print("----- 16 ----- ")
## and or not 예제m,
on = True
off = False

tv = (on and off)
print('tv = ', tv)

radio = (on or off)
print('radio = ', radio)

phone = not on
print('phone = ', phone)
