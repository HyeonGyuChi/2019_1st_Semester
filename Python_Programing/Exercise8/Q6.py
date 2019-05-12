# print(dir('tkinter'))

from tkinter import *
from tkinter.filedialog import *
from tkinter import messagebox
from tkinter.filedialog import *

def  func_open() :
    # messagebox.showinfo("메뉴선택", "열기 메뉴를 선택")
    filename = askopenfilename(parent=window, filetypes=(("GIF 파일", "*.gif"), ("모든파일", "*.*")))
    nLabel.configure(text=list(filename.split("/"))[-1])
    photo = PhotoImage(file = filename)
    pLabel.configure(image = photo)
    pLabel.image = photo

def func_exit() :
    window.quit()
    window.destroy()

window = Tk()
window.geometry('400x500')
window.title("영화 감상하기")

photo = PhotoImage()
nLabel = Label(window, text = "그림을 선택해주세요")
nLabel.pack()
pLabel = Label(window, image = photo)
pLabel.pack(expand = 1, anchor = CENTER)


mainMenu = Menu(window)
window.config(menu = mainMenu)

fileMenu = Menu(mainMenu)
mainMenu.add_cascade(label = "파일", menu = fileMenu)
fileMenu.add_command(label = "열기", command = func_open)
fileMenu.add_separator()
fileMenu.add_command(label = "종료", command = func_exit)



window.mainloop()

