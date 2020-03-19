try :
    readfile_name = input("입력파일 이름 : ")
    writefile_name = input("출력파일 이름 : ")

    openfile = open(readfile_name, "r")
    outfile = open(writefile_name, "w")

except :
    print("파일입출력 오류")
else :

    readint = []
    for line in openfile :
        readint.append(float(line.strip()))

    outfile.write("sum = "+str(sum(readint))+"\n")
    outfile.write("mean = "+str(sum(readint)/10)+"\n")
    outfile.write("max = "+str(max(readint))+"\n")
    outfile.write("min = "+str(min(readint))+"\n")

finally :
    openfile.close()
    outfile.close()