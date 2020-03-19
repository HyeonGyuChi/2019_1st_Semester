import sqlite3
# con, corsor 생성
con = sqlite3.connect("new_testDB")
cursor = con.cursor()

# create table > 연결자.commit()
try :
    sql = "CREATE TABLE IF NOT EXISTS productTable(num integer primary key autoincrement, pCode char(5), pName char(15), price integer, amount integer)"
    cursor.execute(sql)

except :
    print("오류 테이블 CREATE 실패")
else :
    print("성공 테이블 CREATE 성공")

# insert data
try :
    sql = "INSERT INTO productTable(pCode, pName, price, amount) VALUES('p0001', '노트북', 110, 5)"
    cursor.execute(sql)

    sql = "INSERT INTO productTable(pCode, pName, price, amount) VALUES('p0003', '마우스', 3, 22)"
    cursor.execute(sql)

    sql = "INSERT INTO productTable(pCode, pName, price, amount) VALUES('p0004', '키보드', 2, 11)"
    cursor.execute(sql)

    con.commit() # insert하면 꼭 저장! 연결자.commit() // 커서.  아님

except :
    print("오류 데이터 INSERT 실패")
else :
    print("성공 데이터 INSERT 성공")

# select > 커서.fetch~
try :

    print("num\tpCode\tpName\tprice\tamount\t")
    print("--------------------------------------------------------")

    sql = "SELECT * FROM productTable"
    cursor.execute(sql)

    while True :
        row = cursor.fetchone()  # select

        if not row :
            break
        else :
            num = row[0]
            pCode = row[1]
            pName = row[2]
            price = row[3]
            amount = row[4]
            print("%5d %5s %15s %5d %5d" %(num, pCode, pName, price, amount))
except :
    print("INSERT 오류")