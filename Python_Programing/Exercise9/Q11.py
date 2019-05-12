import os.path # 파일경로에 존재여부 확인
import operator # dict의 key별 value별로 sort하기 위해
# split('') : 구분자가 spacebar : \n를 count
# split() : 구분자가 sapcebar, \t, \n 공백문자 : \n를 count x


filename = "flower.txt" # input("")
word_count = {}
max_word = []

if not os.path.exists(filename) :
    print("파일없음")

else :
    opfile = open(filename, "r")
    content = opfile.read() # 내용 모두 읽어 str로 저장
    for word in content.split() : # 공백은 모두 잘라 list원소화
        if word in word_count :
            word_count[word] += 1
        else :
            word_count[word] = 1

    '''    
    for line in opfile :
        for word in line.strip().split() :
            if word in word_count :
                word_count[word] += 1

            else :
                word_count[word] = 1
    '''

    # key별로 오름차순 정렬
    sorted_value = sorted(word_count.items(), key = operator.itemgetter(1))
    print(sorted_value) # dict원소 확인

    # 오름차순으로 정렬된 dict에서 마지막 원소부터 max값 비교
    i = -1
    while sorted_value[i][1] == sorted_value[-1][1] : # 가장 마지막에 있는 원소의 value == max값
        max_word.append(sorted_value[i][0]) # 2개 이상의 max가 존재할 수 있으므로 list로 append
        i -= -1

    print('최대 등장 단어 = ', max_word, sorted_value[-1][1], '회 입니다.')

    opfile.close()