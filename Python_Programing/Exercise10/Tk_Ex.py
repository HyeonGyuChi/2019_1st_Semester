import sqlite3
from tkinter import *
from tkinter import messagebox

# 입력 함수

# 조회 함수

# 테이블 생성 함수

# DB 불러오기
#con = sqlite3.connect("classDB")

# 불러온 db에 커서연결
#cur = con.cursor()

# excute로 DB내 table생성 >

# tkinter 함수


window = Tk()

# 함수선언부

def myfunc():
    if chk.get() == 1:
        messagebox.showinfo("확인", "체크박스 눌렀네?")
    else:
        messagebox.showinfo("확인", "체크박스 꺼졌다")

def myfunc2():
    if var.get() == 1 :
        label1.configure(text="파이썬")
    elif var.get() == 2:
        label1.configure(text="이거실행")

def enterlabel(event):
    label3.configure(text="마우스가 위에 올라왔다!")

def where(event):
    label1.configure(text="마우스위치 "+str(event.x)+", "+str(event.y)+"")

# 메인코드

window.title('GUI 테이터입력')
window.geometry("600x400")

window.bind("<Enter>", where)

label1 = Label(window, text="HELLO")
label2 = Label(window, text="안녕하세요 레이블입니다.", font = ("궁서체,40"), fg="blue")
label3 = Label(window, text="궁서체라능", font=("맑은고딕", 15), bg="yellow", width=20,height=5, fg ="red")

label1.pack()
label2.pack()
label3.pack(fill = X, padx = 20, pady = 40)
label3.bind("<Button>", enterlabel)

button1 = Button(window, text="파이썬 종료", command = quit)
button1.pack()

chk = IntVar()
cb1 = Checkbutton(window, text ="클릭해봐", variable=chk, command=myfunc)
cb1.pack()

var = IntVar()
rb1 = Radiobutton(window, text ="파이썬", variable=var, value=1, command=myfunc2)
rb2 = Radiobutton(window, text = "자바", variable=var, value=2, command=myfunc2)

rb1.pack(side = BOTTOM, fill=X)
rb2.pack(side = BOTTOM, fill=X)


window.mainloop()

