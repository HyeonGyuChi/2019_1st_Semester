from tkinter import *
from tkinter import messagebox
import sqlite3

window = Tk()

# tk 함수

def createTable():
    con = sqlite3.connect("classDB")
    cur = con.cursor()

    try :
        cur.execute("DROP TABLE IF EXISTS studentTable")
        cur.execute("CREATE TABLE studentTable(name char(10), stdid char(15), grade int, telNum char(15))")
    except :
        messagebox.showinfo("오류", "테이블 생성오류")
    else :
        messagebox.showinfo("성공", "테이블 생성 성공")
    finally :
        con.commit()
        con.close()

def selectAll():
    list1, list2, list3, list4 = [],[],[],[]
    con = sqlite3.connect("classDB")
    cur = con.cursor()

    sql = "SELECT * FROM studentTable"
    cur.execute(sql)

    list1.append("이름"); list1.append("---------")
    list2.append("학번"); list2.append("---------")
    list3.append("학년"); list3.append("---------")
    list4.append("전화번호"); list4.append("---------")

    while(True):
        row = cur.fetchone()
        if row == None:
            break
        list1.append(row[0])
        list2.append(row[1])
        list3.append(row[2])
        list4.append(row[3])
# 기존에 있던 정보 지우기
    listData1.delete(0, listData1.size() - 1)
    listData2.delete(0, listData2.size() - 1)
    listData3.delete(0, listData3.size() - 1)
    listData4.delete(0, listData4.size() - 1)
# 새로운정보 출력
    for item1, item2, item3, item4 in zip(list1, list2, list3, list4):
        listData1.insert(END, item1)
        listData2.insert(END, item2)
        listData3.insert(END, item3)
        listData4.insert(END, item4)


def insert():
    con = sqlite3.connect("classDB")
    cur = con.cursor()

    name, id, grade, tel = entry1.get(), entry2.get(), entry3.get(), entry4.get()

    try :
        sql = "INSERT INTO studentTable VALUES('"+name+"', '"+id+"', '"+grade+"', '"+tel+"')"
        cur.execute(sql)
    except :
        messagebox.showinfo("오류", "데이터 입력 오류")
    else:
        messagebox.showinfo("성공", "데이터 입력 성공")
    finally:
        con.commit()
        con.close()

# tk 메인
window.geometry("700x300")
window.title("GUI 데이터 입력")
# 2개의 프레임 생성
# edit프레임
edtFrame = Frame(window)
edtFrame.pack(fill=X)

label1 = Label(edtFrame, text="이름 : ")
entry1 = Entry(edtFrame, width=10)

label2 = Label(edtFrame, text="학번 : ")
entry2 = Entry(edtFrame, width=10)

label3 = Label(edtFrame, text="학년 : ")
entry3 = Entry(edtFrame, width=5)

label4 = Label(edtFrame, text="전화번호 : ")
entry4 = Entry(edtFrame, width=15)

button1 = Button(edtFrame, text="입력", command=insert)
button2 = Button(edtFrame, text="조회", command=selectAll)
button3 = Button(edtFrame, text="테이블생성", command=createTable)

label1.pack(side=LEFT, expand=True)
entry1.pack(side=LEFT, expand=True)

label2.pack(side=LEFT, expand=True)
entry2.pack(side=LEFT, expand=True)

label3.pack(side=LEFT, expand=True)
entry3.pack(side=LEFT, expand=True)

label3.pack(side=LEFT, expand=True)
entry3.pack(side=LEFT, expand=True)

label4.pack(side=LEFT, expand=True)
entry4.pack(side=LEFT, expand=True)

button1.pack(side=LEFT, expand=True)
button2.pack(side=LEFT, expand=True)
button3.pack(side=LEFT, expand=True)

# 리스트 프레임
listFrame = Frame(window)
listFrame.pack(fill = X)

listData1 = Listbox(listFrame, bg = "yellow")
listData1.pack(side = LEFT, fill=BOTH, expand = 1)

listData2 = Listbox(listFrame, bg = "yellow")
listData2.pack(side = LEFT, fill=BOTH, expand = 1)

listData3 = Listbox(listFrame, bg = "yellow")
listData3.pack(side = LEFT, fill=BOTH, expand = 1)

listData4 = Listbox(listFrame, bg = "yellow")
listData4.pack(side = LEFT, fill=BOTH, expand = 1)

window.mainloop()