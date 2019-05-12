import os.path

filename = "data.txt"

if not os.path.exists(filename) :
    print("파일없음")

else :

    opfile = open(filename, "r")
    for line in opfile : # opfile객체를 for문으로 돌릴경우 readline()으로 실행
        for split_content in line.strip().split(",") : # 앞뒤 공백 없이 str만 정제하여 ',' 기준으로 list원소화
            print(split_content)