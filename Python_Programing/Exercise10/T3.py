import sqlite3

con = sqlite3.connect("new_testDB")
cur = con.cursor()
try :
    sql = "SELECT * FROM productTable WHERE pName = '마우스'"
    cur.execute(sql)

except :
    print("SELECT 오류")

mouse_count = 0

while True :
    row = cur.fetchone()
    if not row :
        break
    num = row[0]
    pCode = row[1]
    pName = row[2]
    price = row[3]
    amount = row[4]

    mouse_count += amount
    print(num, pCode, pName, price, amount)

print("총 마우스 개수 =", mouse_count)
con.close()

