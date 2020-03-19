from tkinter import *
from tkinter.filedialog import *

window = Tk()
window.geometry("400x400")
window.title("영화 감상하기")

def openfile():
    filename = askopenfilename(parent = window, filetypes = (("모든파일","*.*"),("GIF파일", "*.gif")))
    photo = PhotoImage(file = filename)
    nLabel.configure(text = filename.split('/')[-1]) # 파일이름
    fLabel.configure(image = photo)
    fLabel.image = photo # button일경우 안해줘도 됨 / Label일경우 해주기!

# 메뉴생성
mainMenu = Menu(window)
window.config(menu = mainMenu)

fileMenu = Menu(mainMenu)
mainMenu.add_cascade(label = "파일", menu = fileMenu)
fileMenu.add_command(label ="파일열기", command = openfile)
fileMenu.add_command(label = "프로그램 종료", command = quit)

# 그림을 보여줄 label 영역 작업
fLabel = Label(window, image = None)
nLabel = Label(window, text = None)

nLabel.pack(side = TOP)
fLabel.pack(expand = 1, anchor = CENTER)

window.mainloop()