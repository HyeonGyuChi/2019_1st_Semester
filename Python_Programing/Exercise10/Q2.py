import sqlite3

## 변수 선언 부분 ##
con, cur = None, None
## 메인 코드 부분 ##
con = sqlite3.connect("testDB")  # DB가 저장된 폴더까지 지정
cur = con.cursor()
try:
    sql = "DROP TABLE IF EXISTS productTable"
    cur.execute(sql)

    sql = "CREATE TABLE productTable (num integer primary key autoincrement, pCode char(5), pName char(15), price integer, amount integer)"
    cur.execute(sql)
except:
    print('오류', '테이블 CREATE 오류가 발생함')
else:
    print('성공', '테이블 CREATE 성공')
    con.commit()


while(True) :
    data1 = input("pCode : ")
    if data1 == "":
        break
    data2 = input("pName : ")
    data3 = input("price : ")
    data4 = input("pName : ")
    try :
        sql = "INSERT INTO productTable (pCode, pName, price, amount) VALUES('"+ data1 +"', '"+data2+"','"+data3+"','"+data4+"')"
        cur.execute(sql)
    except:
        print('오류', '데이터 INSERT 오류가 발생함')
    else :
        print('성공', '데이터 INSERT 성공')

con.commit()

cur.execute("SELECT* FROM productTable order by pCode")

print("\nnum\t pCode\t pName\t price\t amount")
print("--------------------------------------------")
while (True):
    row = cur.fetchone()
    if row == None:
        break;
    print("%d\t %s\t %s\t %d\t %d" % (row[0], row[1], row[2], row[3], row[4]))
con.close()
