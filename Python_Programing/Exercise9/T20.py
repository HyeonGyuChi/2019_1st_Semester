import os
import shutil
import zipfile


def filecopy(info):
    while True :
        filename = input("존재하는 파일명을 입력하세요 : ")

        if filename in info[2] :
            copyname = input("복사할 파일명을 입력하세요 : ")
            shutil.copy(filename, copyname)
            print("복사완료")
            break

        else :
            print("파일이 존재하지 않습니다.")

def filedelete(info):
    while True :
        filename = input("삭제할 파일명을 입력하세요 : ")

        if filename in info[2]:
            os.remove(os.path.join(info[0], filename)) # os.path.join 조심! path!! // os.remove(path)
            print("파일삭제완료")
            break

        else :
            print("파일이 존재하지 않습니다")
def filezip(info):

        filename = input("zip파일명을 입력하세요 : ") + ".zip"
        newZip = zipfile.ZipFile(filename, "w")
        for file in info[2]:
            newZip.write(file)
        print("압축완료")
while True :
    try :

        # 현재 작업 디렉토리의 현황 가져오기
        print("<------- 현재 작업 디렉토리와 존재하는 파일들입니다.-------> ")
        for dirname, subdirs, filenames in os.walk(os.getcwd()):
            info = (dirname, subdirs, filenames)

        for item in info:
            print(item)

        print("------------------------------------------------------------")

        menu = int(input(" 필요한 작업을 선택하세요\n 1. 파일복사 2. 파일삭제 3. 파일압축 4. 종료 : "))
    except ValueError :
        print("메뉴를 숫자로 입력하세요")
    else :
        if menu == 4 :
            print("프로그램 종료")
            break

        elif menu == 1 :
            filecopy(info)

        elif menu == 2 :
            filedelete(info)

        elif menu == 3 :
            filezip(info)

        else :
            print("메뉴를 다시 선택해주세요")
