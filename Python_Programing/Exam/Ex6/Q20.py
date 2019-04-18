h2b = { '0000':'0', '0001':'1', '0010':'2', '0011':'3',
	'0100':'4', '0101':'5', '0110':'6', '0111':'7',
	'1000':'8', '1001':'9', '1010':'a', '1011':'b',
	'1100':'c', '1101':'d', '1110':'e', '1111':'f' }

def bin2hex(bin) :
    hex = '0x'

    for ch in bin :
        if ch != '0' and ch != '1' :
            return False, hex

    bin = bin.zfill(len(bin) + (4-len(bin)%4))
    print(bin)
    for i in range(len(bin)//4) :
        temp = bin[i*4 : i*4 + 4]
        hex  += h2b[temp]

    return True, hex

a,b = bin2hex('10101010111')
print(b)
