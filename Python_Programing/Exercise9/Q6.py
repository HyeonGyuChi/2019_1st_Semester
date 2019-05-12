import os.path

filename = "numbers.txt"

if os.path.exists(filename) :
    opfile = open(filename, "r")

    for line in opfile : # strip으로 str만 정제
        print(line.strip(), end = " ")

    opfile.close()

else :
    print('파일이 없습니다')