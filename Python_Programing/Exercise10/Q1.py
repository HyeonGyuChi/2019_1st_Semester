import sqlite3
con = sqlite3.connect("testDB") # Connect DB만들기

cur = con.cursor() # 연결된 DB에 쿼리문을 주고받을 통로(커서) 생성

# table 생성
try:
    sql = "DROP TABLE IF EXISTS productTable"
    cur.execute(sql)

    sql = "CREATE TABLE productTable(num integer primary key autoincrement, pCode char(5), pName char(15), price integer, amount integer)"
    cur.execute(sql)
except :
    print('오류', '테이블 CREATE 오류')
else :
    print('성공', '테이블 CREATE 성공')

con.commit() # 변경사항 저장

try :
    # table에 저장
    cur.execute("INSERT INTO productTable(pCode, pName, price, amount) VALUES('p001', '노트북', 110, 5)")
    cur.execute("INSERT INTO productTable(pCode, pName, price, amount) VALUES('p003', '모니터', 3, 22)")
    cur.execute("INSERT INTO productTable(pCode, pName, price, amount) VALUES('p004', '모니터', 2, 11)")
except :
    print('오류', '데이블 INSERT 오류')
else :
    print('성공', '데이블 INSERT 성공')


# 출력
print("num       pCode       pName       price       amout")
print("---------------------------------------------------")

cur.execute("SELECT * FROM productTable") # 꼭 불러와야 한다.

while(True): # 모든 데이터 출력
    row = cur.fetchone() # 한개 열 데이터 가져오기

    if row == None :
        break

    data1,data2,data3,data4,data5 = row[0],row[1],row[2],row[3],row[4]
    print("%5d %12s %12s %12d %5d" %(data1,data2,data3,data4,data5))


cur.execute("SELECT * FROM productTable")
cur.execute("SELECT * FROM productTable WHERE pName='모니터'")
print(cur.fetchall())
con.close()
