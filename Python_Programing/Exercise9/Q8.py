import os.path

filename = "test.txt"
word_count = {}

if not os.path.exists(filename):
    print('파일없음')

else:
    opfile = open(filename, "r") # 파일열기

    for line in opfile : # 라인별로 읽기
        for ch in line.strip():
            if ch.isalpha() : # 알파벳만 정제
                if ch in word_count : # 정제된 데이터를 dict 구조를 이용해 count
                    word_count[ch] += 1
                else :
                    word_count[ch] = 1
    
    opfile.close() # 파일닫기
    print(word_count)
    