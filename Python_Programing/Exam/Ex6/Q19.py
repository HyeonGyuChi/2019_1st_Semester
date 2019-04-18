alist = [2, 1, -3, 1, -4, 1, 1, 3, -5, 4]

sum = 0
max = alist[0]

for num in alist :
    if num < 0 and sum > 0:
        print(sum)
        sum = 0
    else : 
        print(sum)

    sum += num

    if sum > max :
        max = sum

print(max)