a = "{2 * { 3 + ( 4 - 5 ) * 6 + { 7 + ( 8 - 9 ) // 10 } * 2 } +3 }"
b = "{ 2 * { 3+ ( 4 – 5 ) *6 + { 7 + ( 8 - 9 ) //10 } *2 ) + 3 + ( 4 ) -5 }"
c = "(){}}}" # 맨 뒤에 }}} 가 붙은경우
d = "(){}{}{" # 맨 뒤에 다시 { 열린경우

strList = []
mark = {"{": "}", "(": ")"}

for char in a :

    if char == "{" or char == "(":
        strList.append(char)

    elif char == "}" or char == ")":
        if len(strList) == 0 : # 더이상 pop할수 없음 ex) 맨 뒤에 }}} closeMark만 있는경우
            strList.append(char) # len(strList) != 0 하기위해 strList의 크기+1 증가
            break

        openMark = strList.pop() # 가장 최근에 push한 openMark를 가져옴

        if mark.get(openMark) == char: # openMark의 짝을 mark{} 에서 찾음
            continue
        else:
            strList.append(openMark) # 짝이 틀리므로 pop한 것을 다시 push
            break

if len(strList) == 0:
    print("astr is OK")

else:
    print("astr is NOK")
