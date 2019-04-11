#6. time 모듈을 import한 후, for문을 이용하여 1부터 5까지의 각 숫자를 2초 간격으로 출력

import time # 시간(time)모듈
# 현재시간 : print(time.strftime("%y/%m/%d %H:%M:%S"))

#range(1,5) == [1,2,3,4,5]
# list, dictionary, set, string, tuple, bytes가 iterable한 타입 : range 또한 ok

for i in range(1,6) :
    print(i, end = " // ")
    print("출력시간 : " + time.strftime("%y/%m/%d %H:%M:%S")) #현재시간
    time.sleep(2) #2초간 현재 스레드 정지


# 파이썬에서 권장하지 않는 for패턴
# s = [1, 3, 5]
# for i in range(len(s)):
#   print(s[i])

# 파이썬에서 권장하는 for패턴
# for i in s :
#   print(i)