#3
import sqlite3
## 변수 선언 부분 ##
con, cur = None, None
sql = ""
num=0
## 메인 코드 부분 ##
con = sqlite3.connect("testDB")  # DB가 저장된 폴더까지 지정
cur = con.cursor()
cur.execute("SELECT * FROM productTable where pName = '모니터'")
print("\nnum\t pCode\t pName\t price\t amount")
print("--------------------------------------------")
while (True) :
    row = cur.fetchone()
    if row == None :
        break;
    num += row[4]
    print("%d\t %s\t %s\t %d\t %d" % (row[0], row[1], row[2], row[3], row[4]))
print("\n총 모니터의 개수 =", num)
con.close()