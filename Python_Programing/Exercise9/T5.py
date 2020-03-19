import random

savefile_name = input("실수를 저장할 파일 이름 : ")
try :
    savefile = open(savefile_name, 'w')

except :
    print("파일오류")

else :

    for _ in range(10):
        savefile.write(str(round(random.random()*100,2))+'\n')

    print("실수 10개를 %s에 저장했습니다" % savefile_name)

finally:
    savefile.close()