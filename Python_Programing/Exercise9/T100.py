import operator
import zipfile
import os
import sqlite3

opfile = open("flower.txt", "r")

lines = opfile.readlines()

word_count = {}

for line in lines :
    for word in line.strip().split() :
        if word in word_count :
            word_count[word] += 1
        else :
            word_count[word] = 1

sort_dic = sorted(word_count.items(), key=operator.itemgetter(1), reverse=1)
print(sort_dic)

max_word = []
for i in range(len(sort_dic)):
    if sort_dic[0][1] == sort_dic[i][1] :
        max_word.append(sort_dic[i][0])
    else :
        break

outfile = open("flowerout.txt", "w")
for word, count in sort_dic :
    outstr = "{} {}\n".format(word,count)
    outfile.write(outstr)

outstr = "최빈단어 :"
for max in max_word :
    outstr += ' ' + max

outfile.write(outstr)

for dirname, subdirs, files in os.walk(os.getcwd()) :
    dirname, subdirs, files = dirname, subdirs, files

txtfiles = []
for file in files :
    if file.endswith(".txt") :
        txtfiles.append(file)

newZip = zipfile.ZipFile("newzip.zip", "w")

for txtfile in txtfiles :
    newZip.write(txtfile)

opfile.close()
outfile.close()

con = sqlite3.connect("flower.db")
cur = con.cursor()

try :
    sql = "DROP TABLE IF EXISTS wordTable"
    cur.execute(sql)

    sql = "CREATE TABLE wordTable(word char(10), count int)"
    cur.execute(sql)
except :
    print("create 오류")
else :
    print("create 성공")

# INSERT
try :
    opfile = open("flowerout.txt", "r")
    lines = opfile.readlines()
    for line in lines[:-1] :
        word, count = line.strip().split()
        sql = "INSERT INTO wordTable(word, count) VALUES('"+word+"',"+count+")"
        cur.execute(sql)

    con.commit()

except :
    print("실패")

sql = "SELECT word FROM wordTable WHERE count < 3"
cur.execute(sql)

while True :
    row =cur.fetchone()

    if not row :
        break
    print(row)

