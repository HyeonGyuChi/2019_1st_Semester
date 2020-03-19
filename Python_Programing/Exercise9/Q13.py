# 파일 입출력 처리
while True:
    file_name = input("입력 파일 이름 : ")
    try :
        if file_name == "" :
            break
        file_open = open(file_name, "r")

    except IOError: # 파일없을 시 예외처리
        print("파일", file_name, "이 없습니다. 다시 입력하시오.")

    else : # 파일있을 때 정상적 처리
        print("파일이 성공적으로 열렸습니다.")
        for line in file_open:
            print(line.strip())
    finally:
        file_open.close()
