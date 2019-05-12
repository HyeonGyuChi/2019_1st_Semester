from tkinter import *
from tkinter import messagebox
from tkinter.filedialog import *

window = Tk()

def func_open() :
    messagebox.showinfo("메뉴선택", "열기 메뉴를 선택함")

def func_exit() :
    window.quit()
    window.destroy()

mainMenu = Menu(window)
window.config(menu = mainMenu)

fileMenu = Menu(mainMenu)
mainMenu.add_cascade(label = '파일', menu = fileMenu)
fileMenu.add_command(label = "열기")
fileMenu.add_separator()
fileMenu.add_command(label = "종료")

window.geometry("210x240")

window.mainloop()