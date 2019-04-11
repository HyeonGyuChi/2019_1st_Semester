def myRange(start, end, hop = 1) :
    retVal = start
    while retVal <= end :
        print('\na_retVal=', retVal)
        yield retVal
        # retrun retVal 라면 함수가 종료되지만, yield를 사용함으로서 종료될때 까지 기다려준다.

        print('b_retVal=', retVal)
        retVal += hop
        print('c_retVal=', retVal)

sum = 0

for i in myRange(1,5,2) :
    print('i=', i)

    sum += i
    print('sum=', sum)