import sqlite3

con = sqlite3.connect("info.db")
cur = con.cursor()

outfile = open("infoOut.txt", "w")

# select 하기
try :
    sql = "SELECT * FROM userTable ORDER BY age"
    cur.execute(sql)
except :
    print("select 오류")

outfile.write("이름 주민번호 나이 성별\n")

while True :
    row = cur.fetchone()
    if not row :
        break
    name, id, age, sex = row[0], row[1], row[2], row[3]

    line = "{} {} {} {}\n".format(name, id, age, sex)
    print(line, end ="")
    outfile.write(line)

