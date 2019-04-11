## 얕은복사

stra = ['a', 'p', 'p', 'l', 'e']
strb = stra

seta = set(stra)
setb = set(strb)

# {'a','p','l','e'}

strb.append('s')
# ['a', 'p', 'p', 'l', 'e', 's']

print('stra=', stra)
print('strb=', strb)

# ['a', 'p', 'p', 'l', 'e', 's']
# ['a', 'p', 'p', 'l', 'e', 's']

## 깊은복사 [:]

stra = ['a', 'p', 'p', 'l', 'e']
strb = stra[:]

seta = set(stra)
setb = set(strb)
# {'a','p','l','e'}

strb.append('s')
# strb = ['a', 'p', 'p', 'l', 'e', 's']

print('stra=', stra)
print('strb=', strb)

# ['a', 'p', 'p', 'l', 'e']
# ['a', 'p', 'p', 'l', 'e', 's']