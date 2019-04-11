# gcd()
# 기능 : 두수의 최대공약수 구하기
# 유클리드 이용
""" // 재귀코드
def gcd(big, small) :

    if small == 0 :
        return big

    else :
        return gcd(small, big % small)


print(gcd(30,24))
"""

num1 = int(input("정수1 : "))
num2 = int(input("정수2 : "))

def gcd(big, small) :
    if big < small : # 작은수 큰수 바꾸어주기
        big, small = small, big
    while small != 0 :
        big, small = small, big % small

    return big

print("GCD :", gcd(num1,num2))