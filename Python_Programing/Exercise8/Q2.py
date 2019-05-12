from tkinter import *
import random

# 이미지 이름
frameList = ["froyo.gif", "gingerbread.gif", "honeycomb.gif", "icecream.gif",
                 "jellybean.gif", "kitkat.gif", "lollipop.gif", "marshmallow.gif", "nougat.gif"]
labelList = [None] * 9
photoList = [None] * 9
xPos, yPos = 0,0
num = 0
'''
x = ['a', 'b', 'c', 'd']
random.shuffle(x)
print(x)
'''

window = Tk() # 윈도우 tk 객체생성
window.geometry("210x240")

def imageSuffle() :
    i, k = 0, 0
    xPos, yPos = 0, 0
    num = 0
    random.shuffle(frameList)


    for i in range(9) :
        photoList[i] = PhotoImage(file = "gif/"+frameList[i])
        labelList[i] = Label(window, image = photoList[i])

    for i in range(3) :
        for k in range(3) :
            labelList[num].place(x = xPos, y = yPos) # place를 사용하여 상대좌표에 넣어줌
            num += 1
            xPos += 70
        xPos = 0
        yPos += 70

suffleBtn = Button(window, text = "SUFFLE", command = imageSuffle)
suffleBtn.pack(side = BOTTOM)
imageSuffle()

window.mainloop()

