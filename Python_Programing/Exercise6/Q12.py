# rusm()
# 기능 : 1부터 n까지의 합
# 조건 : 재귀호출방식
# 재귀는 return이 두개 왜? 하나는 맨마지막 재귀호출의 종료값, 하나는 맨처음 함수를 위한 return값(==재귀함수의 return값을 계속 전달)

def rsum(num) :
    if num == 1: # 맨마지막에 불른 함수의 종료조건
        return 1
    else :
        return num + rsum(num-1) # 맨처음에 부른 함수를 위한 return값 > 결국 rsum(num-1)은 정수값이 나옴

num = int(input("1+...+n, n? "))
print("1+...+%d = %d" %(num, rsum(num)))




