class Rectangle:

    w,h,x,y = [0]*4

    def __init__(self, w, h, x=0, y=0):
        self.w = w
        self.h = h
        self.x = x
        self.y = y

    def clacArea(self):
        return self.w * self.h

    def __str__(self):
        str = "x={}, y={}, width={}, height={}".format(self.x, self.y, self.w, self.h)
        return str


box1 = Rectangle(100,100,0,0)
box2 = Rectangle(200,200,10,10)

print("box1 area :", box1)
print("box2 area :", box2)
print("box1 :", box1.clacArea())
print("box2 :", box2.clacArea())