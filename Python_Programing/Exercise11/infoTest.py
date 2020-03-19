import sqlite3

openfile = open("info.txt", "r")
lines = openfile.readlines()

# 주민등록 체크 # 성별과 나이 return
def Check_id(full_id):
    front_id, back_id = full_id.split('-')

    # 나이확인
    current = 19
    if back_id[0] == '1' or back_id[0] == '2': # 00년 출생이전
        current = 119

    age = current-int(front_id[:2]) # 현재년도에서 출생년도 감산

    # 성별확인
    if back_id[0] == '1' or back_id[0] == '3' :
        sex = '남'
    elif back_id[0] == '2' or back_id[0] == '4':
        sex = '여'

    return(age, sex)

#for line in lines : # 라인별로 데이터 가져오기
    # print(Check_id(line.strip().split(' ')[1])) # 주민등록번호


# 데이터 베이스 생성
con = sqlite3.connect("info.db")
cur = con.cursor() # 커서생성

# 데이터 베이스 user table 생성
try :
    sql = "DROP TABLE IF EXISTS userTable"
    cur.execute(sql)

    sql = "CREATE TABLE userTable(name char(10), id char(10), sex char(2), age int)"
    cur.execute(sql)

except :
    print("create 실패")

# 데이터 베이스 insert
try :
    for line in lines :
        name, id = line.strip().split()
        age, sex = Check_id(id)

        sql = "INSERT INTO userTable(name, id, sex, age) VALUES('"+name+"', '"+id+"', '"+sex+"', "+str(age)+")"
        cur.execute(sql)
        con.commit()
except :
    print("insert 실패")

# 데이터 베이스 select 확인
try :
    sql = "SELECT * FROM userTable"
    cur.execute(sql)
except :
    print("select 실패")

while True :
    row = cur.fetchone()
    if not row :
        break

    print(row)

# con.close()



