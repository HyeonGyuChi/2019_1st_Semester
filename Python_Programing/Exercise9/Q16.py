from tkinter.filedialog import askopenfilename

readFile = askopenfilename() # tk window 만들기 않아도 가능!
if readFile != None : # if문으로 예외처리
    infile = open(readFile, 'r')

for line in infile :
    print(line.strip())

infile.close()