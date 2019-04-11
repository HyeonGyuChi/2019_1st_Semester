str = '     hello   world    '

print("원래문자열:\t", str)

str = str.strip()
print("앞 뒤 양쪽 공백제거:\t", str)

str = str.replace(' ','')
print("중간 공백제거:\t", str)

str = str.rjust(20)
print("앞 공백 채워 총 20자리:\t", str)

str = str.lstrip()
print("앞쪽 부분 공백제거:\t", str)

str = str.center(20, "*")
print("앞 공백 채워 총 20자리:\t", str)


