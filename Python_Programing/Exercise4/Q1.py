dic = {1: 'one', 2: 'two', 3: 'three'}

print("dic의 크기= %d" % len(dic))
print(dic.keys())
print(dic.values())
for key in list(dic.keys()):
    print("dic[%s]= %s" % (key,  dic[key]))
