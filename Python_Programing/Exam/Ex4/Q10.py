a = "{2 * { 3 + ( 4 - 5 ) * 6 + { 7 + ( 8 - 9 ) // 10 } * 2 } +3 }"
astr = "{ 2 * { 3+ ( 4 – 5 ) *6 + { 7 + ( 8 - 9 ) //10 } *2 ) + 3 + ( 4 ) -5 }"

temp = []
status = True

for ch in astr :
    if ch == '{' or ch == '[' or ch == '(' :
        temp.append(ch)

    elif ch == '}' or ch ==']' or ch == ')' :
        if len(temp) == 0 :
            status = False
            break

        if ch ==  '}' and temp.pop() == '{' :
            continue

        if ch == ']' and temp.pop() == '[' :
            continue

        if ch == ')' and temp.pop() == '(':
            continue

        status = False
        break

if not temp and status == True:
    print('ok')
else :
    print('nok')