try :
    while True :
        num1 = int(input('숫자 입력 : '))
        num2 = int(input('숫자 입력 :' ))
        print('',num1, '/', num2, '=', num1/num2)
except ValueError :
    print('\t문자열은 숫자로 변환할 수 없습니다.')
except ZeroDivisionError :
    print('\t0으로 나눌 수 없습니다')
except KeyboardInterrupt :
    print('\tCtrl + C를 눌렀군요')
finally:
    print('\t종료합니다.')