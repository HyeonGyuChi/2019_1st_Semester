import os

readfile_name = input("읽을 파일 이름 : ")

if os.path.exists(readfile_name) :
    opfile = open(readfile_name, "r")
# 파이썬에서 파일을 읽는 3가지 방법
    '''
1. 한글자씩 읽기 none , "" 일때 break
    while True :
        readch = opfile.read(1)
        if readch == "":
            break
        print(readch, end="")
'''
    '''
2. 라인별로 읽기 // readfile_name.readline()
for line in opfile : 
    print(line, end = "")
'''
# 3. 통째로 읽기 readlines()
    readstr = opfile.readlines()
    for line in readstr :
        print(line.strip(), end = " ")

else :
    print("읽을 파일이 없습니다")

