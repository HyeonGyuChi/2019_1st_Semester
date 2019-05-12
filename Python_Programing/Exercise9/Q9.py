import os.path

filename = "data.csv"
target_filename = "data.txt"

if not os.path.exists(filename) :
    print("파일없음")

else :
    opfile = open(filename, "r")
    outfile = open(target_filename, "w")

    content = opfile.read().strip() # 파일의 txt를 전체읽어 strip처리 > 마지막 \n제거

    ''' for var in content.split(',') :
         print(var)
    '''

    print(content, end = "")
    outfile.write(content) # str통째로 출력

    ''' for line in opfile :
        print(line.strip())
        outfile.write(line) '''

    opfile.close()
    outfile.close()
