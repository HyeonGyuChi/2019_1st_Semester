import os.path

filename = "numbers.txt"

if os.path.exists(filename) :
    opfile = open(filename, "r")

    numlist = list(map(float, opfile.read().split()))

    print("합계 = ", round(sum(numlist),2))
    print("평균 = ", round(sum(numlist)/len(numlist), 2))
    print("최대 = ", max(numlist))
    print("최소 = ", min(numlist))


else :
    print('파일이 없습니다')