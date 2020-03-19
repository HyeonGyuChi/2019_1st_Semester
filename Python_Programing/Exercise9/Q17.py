from tkinter.filedialog import  askopenfilename
import os.path

readFile = askopenfilename()
print('파일의크기', os.path.getsize(readFile)) # 파일크기 확인(바이트단위 출력)

if readFile != None :
    infile = open(readFile, 'r')
print('파일의크기', infile.seek(0,2)) # seek으로 확인 : 파일포인터를 뒤로 보내서 크기확인

