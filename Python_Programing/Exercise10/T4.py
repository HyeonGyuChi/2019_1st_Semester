import sqlite3
from tkinter import *
from tkinter import messagebox
from tkinter.filedialog import askopenfilename
'''
# edtFrame = Frame(window)
label1 = Label(edtFrame, text="이름 : ")
entry1 = Entry(edtFrame, width=10) // entry1.get()

# listFrame = Frame(window)
listData1 = Listbox(listFrame, bg = "yellow")
// listData1.insert(END, item1), delete(0, listData1.size()-1)
'''


# tkinter
window = Tk()
window.geometry("1200x400")
window.title("GUI 데이터 입력")

con = None
cur = None

# tkinter 함수부분
def CreateTable():
    try :
        sql = "DROP TABLE IF EXISTS studentTable" # 무조건 새로운 테이블 생성
        cur.execute(sql)

        sql = "CREATE TABLE studentTable(name char(10), id char(10), grade integer, tel char(10))"
        cur.execute(sql)
    except :
        messagebox.showinfo("오류", "테이블 CREATE 실패")
    else:
        messagebox.showinfo("성공", "테이블 CREATE 성공")

def InsertData():
    try :
        name, id, grade, tel = name_Entry.get(), id_Entry.get(), grade_Entry.get(), tel_Entry.get()
        sql = "INSERT INTO studentTable VALUES('"+name+"','"+id+"',"+grade+",'"+tel+"')"
        cur.execute(sql)
        con.commit() # insert 했으므로 저장
    except :
        messagebox.showinfo("오류", "데이터 INSERT 실패")
    else :
        messagebox.showinfo("성공", "데이터 INSERT 성공")

def LookTable():
    sql = "SELECT * FROM studentTable"
    cur.execute(sql)

    # 기존 Listbox에 있는 데이터 삭제
    name_Listbox.delete(0, name_Listbox.size()-1)
    id_Listbox.delete(0, id_Listbox.size() - 1)
    grade_Listbox.delete(0, grade_Listbox.size() - 1)
    tel_Listbox.delete(0, tel_Listbox.size() - 1)

    # ListBox에 추가

    # ListBox에 Title 추가
    name_list = ["이름", "----------"]
    id_list = ["학번", "----------"]
    grade_list = ["학년", "----------"]
    tel_list = ["전화번호", "----------"]

    for title1, title2, title3, title4 in zip(name_list, id_list, grade_list, tel_list):
        name_Listbox.insert(END, title1)
        id_Listbox.insert(END, title2)
        grade_Listbox.insert(END, title3)
        tel_Listbox.insert(END, title4)

    # ListBox에 데이터 추가
    for name, id, grade, tel in cur.fetchall():
        name_Listbox.insert(END, name)
        id_Listbox.insert(END, id)
        grade_Listbox.insert(END, grade)
        tel_Listbox.insert(END, tel)

def LoadDB():
    DBname = askopenfilename(parent=window, filetypes=(("모든파일", "*.*"), ("GIF파일", "*.gif")))
    DBname_Label.configure(text=DBname.split("/")[-1])
    print(DBname)

    global con # 전역변수 꼭 설정!
    con = sqlite3.connect(DBname)

    global cur
    cur = con.cursor()


# Edit 프레임
editFrame = Frame(window)
# 구성요소
# 각 데이터 라벨
DBname_Label = Label(editFrame, text = None)
name_Label = Label(editFrame, text = "이름 : ")
id_Label = Label(editFrame, text = "학번 : ")
grade_Label = Label(editFrame, text = "학년 : ")
tel_Label = Label(editFrame, text = "전화번호 : ")

# 각 데이터 input Entry
name_Entry = Entry(editFrame)
id_Entry = Entry(editFrame)
grade_Entry = Entry(editFrame)
tel_Entry = Entry(editFrame)

# 조작버튼
insert_Btn = Button(editFrame, text="입력", command=InsertData)
look_Btn = Button(editFrame, text="조회", command=LookTable)
create_Btn = Button(editFrame, text="테이블생성", command=CreateTable)
loadDB_Btn = Button(editFrame, text="DB연결", command=LoadDB)

# 리스트 Frame
ListFrame = Frame(window)

# 구성요소
# 각 데이터를 출력하는 List
name_Listbox = Listbox(ListFrame, bg="green")
id_Listbox = Listbox(ListFrame, bg="green")
grade_Listbox = Listbox(ListFrame, bg="green")
tel_Listbox = Listbox(ListFrame, bg="green")

# 컴포넌트 배치
editFrame.pack(side=TOP, fill=X)
ListFrame.pack(side=TOP, fill=X)
# EditFrame
DBname_Label.pack(side = LEFT, fill=BOTH, expand = 1)

name_Label.pack(side = LEFT, fill=BOTH, expand = 1)
name_Entry.pack(side = LEFT, fill=BOTH, expand = 1)

id_Label.pack(side = LEFT, fill=BOTH, expand = 1)
id_Entry.pack(side = LEFT, fill=BOTH, expand = 1)

grade_Label.pack(side = LEFT, fill=BOTH, expand = 1)
grade_Entry.pack(side = LEFT, fill=BOTH, expand = 1)

tel_Label.pack(side = LEFT, fill=BOTH, expand = 1)
tel_Entry.pack(side = LEFT, fill=BOTH, expand = 1)

insert_Btn.pack(side = LEFT, fill=BOTH, expand = 1)
look_Btn.pack(side = LEFT, fill=BOTH, expand = 1)
create_Btn.pack(side = LEFT, fill=BOTH, expand = 1)
loadDB_Btn.pack(side = LEFT, fill=BOTH, expand = 1)

# 리스트 프레임
name_Listbox.pack(side = LEFT, fill=BOTH, expand = 1)
id_Listbox.pack(side = LEFT, fill=BOTH, expand = 1)
grade_Listbox.pack(side = LEFT, fill=BOTH, expand = 1)
tel_Listbox.pack(side = LEFT, fill=BOTH, expand = 1)


window.mainloop()
