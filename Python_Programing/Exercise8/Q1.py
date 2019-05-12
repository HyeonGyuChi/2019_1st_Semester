'''
기본 윈도우창 구성
import!
Tk객체생성 window
입력확인을 위해 mainloop!
'''

from tkinter import *

window = Tk()
window.title("냥이름 ^^") # 윈도우 창 이름
window.geometry("400x200") # 윈도우 크기 지정
window.resizable(width = False, height=False) # 사이즈조정 불가

photo1 = PhotoImage(file = "gif/cat.gif")
photo2 = PhotoImage(file = "gif/cat2.gif")

label1 = Label(window, image = photo1)
label2 = Label(window, image = photo2)

label1.pack(side = LEFT)
label2.pack()

window.mainloop()

