import time

now = time.localtime()
year = now.tm_year

birth = '0005223'

if birth[-1] in ['1','2'] :
    print(year - int('19'+birth[:2]))
elif birth[-1] in ['3', '4'] :
    print(year - int('20'+birth[:2]))

