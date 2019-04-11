# dic = {10 : 'A', 9 : 'A', 8 : 'B', 7 : 'C', 6 : 'D', 5 : 'F', 4 : 'F', 3 : 'F', 2 : 'F', 1 : 'F', 0 : 'F'}
dic = {10 : 'A', 9 : 'A', 8 : 'B', 7 : 'C', 6 : 'D', 5: 'F' }

while True :
    score = int(input("점수 : "))
    portion = score // 10 # 몫

    if score < 0 or score > 100 :
        print("\t-> 입력 가능한 점수 범위는 0~100입니다.")
        break

    if portion in range(0,6) :
        portion = 5

    if portion in dic :
        print("\t-> %d = %s" %(score, dic[portion]))