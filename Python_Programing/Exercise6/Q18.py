data = [ [21, 7, 43, 65], [2, 8, 72, 52] ]
print(len(data))

def search_index(arr, key) :
    find = False
    index = ()

    for row in range(len(arr)) :
        for col in range(len(arr[row])) :
            if key == arr[row][col] :
                find = True
                index = row, col
                break

    return find, index


while True :
    key = input("찾을 값 : ")

    if not key.isdigit() :
        print(" 숫자아님")
        continue

    key = int(key)

    find, index = search_index(data, key)
    if find == False :
        print("찾지못함")
        break

    else :
        print("위치 : ", index)
            
