import sqlite3

con = sqlite3.connect("new_testDB")
cur = con.cursor()

# insert
while True :
    pCode = input("pCode : ")
    if pCode == '' : break
    pName = input("pName : ")
    price = input("price : ") # int(input("price : ")) // intcasting 필요없음 > sql문에 ++로 연결되므로 무조건 str로 > sql에서 ''없으면 int
    amount = input("amount : ")

    try :
        sql = "INSERT INTO productTable(pCode, pName, price, amount) VALUES('"+pCode+"','"+pName+"',"+price+","+amount+")"
        cur.execute(sql)
        con.commit() # insert 해줄때마다 저장
    except :
        print("데이터 INSERT 실패")
    else :
        print("데이터 INSERT 성공")

# select
try :
    sql = "SELECT * FROM productTable"
    cur.execute(sql)

    rows = cur.fetchall()

    for row in rows :
        print(row)

except :
    print("조회 실패")

con.close()