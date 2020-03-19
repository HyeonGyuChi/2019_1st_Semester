import shutil
import os
import os.path


for dirName, subDirList, fnames in os.walk(os.getcwd()): # os.getcwd = 현재 디렉터리 리턴
    print("현재 작업 디렉토리와 존재하는 파일입니다")
    print(fnames)

# 존재하는 파일명을 입력할 때 까지
while True :
    file_name = input('존재하는 파일명을 입력하세요')
    if os.path.exists(file_name) : # 파일 존재
        break
    else : # 파일 존재하지 않을 때
        print('파일이 존재하지 않습니다.')

# 존재하는 파일명을 입력받아 복사진행하기
copyfile = input('복사할 파일명을 입력하세요 : ')
shutil.copy(file_name, copyfile) # shutil을 이용하여 파일복사
# 만약 copy모른땐 read > write로 출력해주기

for dirName, subDirList, fnames in os.walk(os.getcwd()): # os.getcwd = 현재 디렉터리 리턴
    print(fnames)
    print("복사를 완료하고 종료합니다")



