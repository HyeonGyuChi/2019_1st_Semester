try :
    file_name = input('파일이름 : ')
    file_open = open(file_name, 'r')

except IOError : # 입출력예외 처리
    print('파일이 없습니다.')

else:
    count = 0
    search_str = input('검색문자열 : ')

    for line in file_open :
        count += line.count(search_str)

    print('%s의 개수 = %d' % (search_str,count))