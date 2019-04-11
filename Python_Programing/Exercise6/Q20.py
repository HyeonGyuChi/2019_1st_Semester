# 2진수 > 16진수
# binary > hexadecimal

h2b = { '0000':'0', '0001':'1', '0010':'2', '0011':'3',
	'0100':'4', '0101':'5', '0110':'6', '0111':'7',
	'1000':'8', '1001':'9', '1010':'a', '1011':'b',
	'1100':'c', '1101':'d', '1110':'e', '1111':'f' }

def bin2hex(bin) :
    hex = '0x'
    start = 0 # 뒤에서 4개씩 끊은 항 들의 시작
    end = 0 # 뒤에서 4개씩 끊은 항 들의 마지막 bin[start : end]
    temp = "" # 4개가 안되는 항 앞에 0을 채워주기 위한 문자열

    if bin == '' :  # 아무것도 입력하지 않았을 때
        return (False, hex)

    for ch in bin : # 2진수가 아닐때 return
        if ch != '0' and ch != '1' :
            return (False, hex)

    if len(bin) % 4 != 0 : # 4개씩 뒤에서 묶었을 때 가장 앞자리가 4개가 아닐경우 : 가장 첫항 처리
        end = len(bin) % 4 # 가장 앞자리 항의 개수는 4개를 뒤에서부터 묶고 남은 나머지 일 것

        for i in range(4-end) : # 그러므로 부족한 자리를 0으로 채워 4개의 완벽한 항을 만들어 준다
            temp += '0' # 4개의 완벽한 항이되기 위해 필요한 0의 개수만큼 0을 갖는 temp를 만든다
        hex += h2b[temp+bin[start:end]]  # 불완전한 첫항 앞쪽에 temp를 붙인 후 > 완벽해진 항 > h2b에서 찾아 변환

    for i in range(len(bin)//4) : # 4개씩 묶은 항의 개수만큼 반복 = 완벽한 4개의 항일때만 수행
        start = end # 이전까지 묶었던 항의 마지막 index
        end = start + 4 # start를 기준으로 4개씩 잘르기
        hex += h2b[bin[start:end]]

    return (True, hex)



while True:
    bin = input("2진수 입력 : ")
    (confirm, hex) = bin2hex(bin)
    if confirm:
        print(" =>", bin, ":", hex)
    else:
        print(" => 2진수가 아니어서 종료합니다")
        break

# 2진수 > 8진수
# binary > octadecimal : This algorithm is better then upper one.

o2b = { '000':'0', '001':'1', '010':'2', '011':'3',
	'100':'4', '101':'5', '110':'6', '111':'7'}


def bin2oct(bin) :
    oct = "0o"
    temp ='' # 3개씩 끊어서 가져와 dic의 키값과 매칭
    change = False # 변환성공한 경우 T

    if bin == "" : # 아무값도 안들어왔을 경우
        return(change, oct)

    for ch in bin :
        if ch != '0' and ch != '1' : # 이진수가 아닐경우
            return change, oct

    while len(bin)%3 != 0 : # 3자리로 떨어질때까지 앞에 0을 붙임
        bin = '0'+bin

    for i in range(len(bin)//3) : # 3자리로 끊어서 접근
        temp = bin[i*3:i*3+3]
        oct += o2b[temp]

    change = True
    return (change, oct)


while True :
    bin = input("2진수입력 : ")
    (confirm, oct) = bin2oct(bin)
    if confirm :
        print(" =>", bin, ":", oct)
    else :
        print("= > 2진수가 아니여서 종료")
        break