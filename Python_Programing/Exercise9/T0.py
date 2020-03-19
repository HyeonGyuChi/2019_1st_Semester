import os
import sqlite3
import operator

for dirname, subdirs, files in os.walk(os.getcwd()):
    dirname, files, subdirs = dirname, files, subdirs

txtfiles = []
for file in files :
    if file.endswith('.txt') :
        txtfiles.append(file)

print("현재 .txt file 목록입니다")
print(txtfiles)

con = sqlite3.connect("test.db")
cur = con.cursor()

# tabel 생성
try :
    sql = "DROP TABLE IF EXISTS txtinfoTable"
    cur.execute(sql)

    sql = "CREATE TABLE txtinfoTable(name char(20), size int)"
    cur.execute(sql)
except :
    print("create 오류")


def returnSize(openfile) :
    return openfile.seek(0,2)

openfiles = [] # open파일객체들의 list
for t in txtfiles :
    file = open(t, "r")
    openfiles.append(file)

# table data insert

try :
    for i in range(len(openfiles)) :
        name, size = txtfiles[i], str(openfiles[i].seek(0,2))
        sql = "INSERT INTO txtinfoTable(name, size) VALUES('"+name+"',"+size+")"
        cur.execute(sql)

    con.commit()
except :
    print("INSERT 오류")


# table select
try :
    sql = "SELECT * FROM txtinfoTable"
    cur.execute(sql)

    for line in cur.fetchall():
        print(line)
except :
    print("select오류")

print("-----------")
# db > 파일 입출력
try :
    sql = "SELECT * FROM txtinfoTable WHERE size >=60"
    cur.execute(sql)

except :
    print("select 오류")

outfile = open("outfile.txt", "w")

for line in cur.fetchall():
    name, size = line[0], line[1]
    outstr = "{} {}\n".format(name, size)
    outfile.write(str(outstr))

