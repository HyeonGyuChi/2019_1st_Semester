def rsum(num) :
    if num == 1 :
        return 1
    return num + rsum(num-1)

print(rsum(8))