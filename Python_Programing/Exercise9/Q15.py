import pickle # 객체저장 모듈

target = {'Superman vs Batman': 9.8,'Ironman': 9.6}

outfile = open('save.p', 'wb') # 피클은 바이너리로 ! # .p로 저장!
print(target, '을 피클 파일에 저장')
pickle.dump(target, outfile) # 객체 파일출력
outfile.close()

infile = open('save.p', 'rb') # 피클은 바이너리로 !
print('피클 파일에 저장된 내용을 출력합니다', pickle.load(infile)) # 객체 파일입력
infile.close()