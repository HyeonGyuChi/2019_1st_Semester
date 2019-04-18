def vsum(*para) :
    btw = '+'

    s = btw.join(list(map(str,para)))
    print(s, '=', sum(para))

vsum(1,3,4,234234,3454523,23423,3)
