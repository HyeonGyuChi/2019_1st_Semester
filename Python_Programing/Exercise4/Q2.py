price ={'apple':200, 'banana':300, 'grape':500}
count={'banana':4, 'grape':2, 'apple':3}
keyindex = {'banana', 'grape', 'apple'}

sum = 0

for key in list(price.keys()) :
    sum += price.get(key) * count.get(key)

for key in keyindex :
    print("%s %d 원 %d 개" %(key, price.get(key), count.get(key)))

print(sum)