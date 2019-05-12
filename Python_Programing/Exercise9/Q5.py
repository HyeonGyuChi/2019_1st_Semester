import random
import os.path

filename = "numbers.txt"

if os.path.exists(filename) :
    print("동일명의 파일이 존재합니다.")
else :
    outfile = open(filename, "w")

    for _ in range(10) :
        num = round(random.uniform(0, 100),2) # 실수 난수 생성 및 반올림하여 소수 둘째 자리만 표시
        outfile.write(str(num) + '\n')

    outfile.close()