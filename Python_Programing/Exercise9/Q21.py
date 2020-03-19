import shutil
import os
import os.path
import zipfile

def print_info():
    for dirName, subDirList, fnames in os.walk(os.getcwd()): # os.getcwd = 현재 디렉터리 리턴
        print("현재 작업 디렉토리와 존재하는 파일입니다")
        print(fnames)

# 존재하는 파일명을 입력할 때 까지
while True :
    zip_name = input('zip 파일명을 입력하세요')
    if os.path.exists(zip_name) : # 파일 존재
        print('현재 작업 디렉토리에 이미 존재하는 파일입니다.)
        append = input('새로운 파일로 덮어쓰시겠습니까? Y/N')
        if append == 'Y'
            break
        else :
            continue
    else : # 파일 존재하지 않을 때
        print('파일이 존재하지 않습니다.')

# 존재하는 파일명을 입력받아 zip진행
print(dirName)
newZip = zipfile.ZipFile(join(zip_name, '.zip'), 'w') # .zip 파일생성

for dirName, subDirList, fnames in os.walk(os.getcwd()): # os.getcwd = 현재 디렉터리 리턴
    print(fnames)
    print("삭제를 완료하고 종료합니다")