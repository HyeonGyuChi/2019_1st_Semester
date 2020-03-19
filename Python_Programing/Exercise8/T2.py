from tkinter import *
import random

fnameList = ["froyo.gif", "gingerbread.gif", "honeycomb.gif", "icecream.gif",
                 "jellybean.gif", "kitkat.gif", "lollipop.gif", "marshmallow.gif", "nougat.gif"]
photoList = [None]*9
btnList = [None]*9
xpos,ypos = 0,0
num = 0

window = Tk()
window.geometry("300x300")

def imageshuffle(): # suffle 시 fnameList를 바꾸어서 다시 btnList를 configure
    random.shuffle(fnameList)
    for i in range(9):
        photoList[i] = PhotoImage(file = "GIF/"+fnameList[i])
        btnList[i].configure(image = photoList[i])
        # btnList[i].image = photoList[i] ? 안해줘도 대낭?

# fnameList(파일이름)기반 > photo객체 리스트 생성 > 만들어진 객체를 매개변수로 btn객체 리스트 생성
for i in range(9) :
    photoList[i] = PhotoImage(file = "GIF/" + fnameList[i])
    btnList[i] = Button(window, image = photoList[i])

# btn 객체 리스트의 버튼들 place
for _ in range(3):
    for _ in range(3):
        btnList[num].place(x = xpos, y = ypos)
        num += 1
        xpos += 100
    xpos = 0
    ypos += 100

# shuffle 버튼
shuffle_btn = Button(window, text = "shuffle", command = imageshuffle) # command 함수 호출시 조심! ()붙이지않기 이름만쓰기
shuffle_btn.pack(side = BOTTOM)


window.mainloop()
