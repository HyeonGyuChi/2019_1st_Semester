import os
import operator

readfile_name = input("파일명을 입력하세요 : ")

if not os.path.exists(readfile_name) :
    print("파일명없음")
else:
    openfile = open(readfile_name, "r")
    word_dic = {}

    readlines = openfile.readlines()

    for line in readlines :
        for word in line.split() :
            if word in word_dic :
                word_dic[word] += 1
            else :
                word_dic[word] = 1

    sorted_dic = sorted(word_dic.items(), key = operator.itemgetter(1))
    print(sorted_dic)

    max_word = []
    max_count = sorted_dic[-1][1]
    i = -1
    while sorted_dic[i][1] == max_count :
        max_word.append(sorted_dic[i][0])
        i -= 1

    print(max_word, max_count)




