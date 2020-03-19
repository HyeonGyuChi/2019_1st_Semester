import turtle
import random

class Shape:

    def __init__(self, x, y):
        self.t = turtle.Turtle('turtle') # 거북이 생성
        self.cx = x
        self.cy = y

    def setPen(self):
        r = 8 # int(random.randrange(0, 256))
        g = 155 # int(random.randrange(0, 256))
        b = 200# int(random.randrange(0, 256))

        self.t.pencolor((r, g, b))

        pSize = random.randrange(0, 5)
        self.t.pensize(pSize)

    def drawShape(self):
        pass

class Rectangle(Shape):
    width, height = [0] * 2

    def __init__(self, x,y):
        Shape.__init__(self,x,y)
        self.width = random.randrange(20,100)
        self.height = random.randrange(20,100)

    def drawShape(self):
        self.setPen()
        upright_y, upleft_y, downright_x, downleft_x = [0]*4
        # cx,cy를 중심으로 height width를 적용한 사각형을 그리기위해필요한 꼭지점 왼쪽 아래 x,y 오른쪽아래 x, 왼쪽 위 y
        upleft_y = self.cy + self.height/2
        downleft_y = self.cy - self.height/2
        downright_x = self.cx + self.width/2
        downleft_x = self.cx - self.width/2
        self.t.penup()  # 펜들어서
        self.t.goto(downleft_x, downleft_y) # 왼쪽 아래 꼭지점을 기준으로
        self.t.pendown() # 그리기
        self.t.goto(downright_x, downleft_y) # 오른쪽 아래 꼭지점
        self.t.goto(downright_x, upright_y) # 오른쪽 위쪽 꼭지점
        self.t.goto(downleft_x, upleft_y) # 오른쪽 왼쪽 꼭지점
        self.t.goto(downleft_x, downleft_y) # 다시 돌아오기

## 함수 선언 부분 ##
def screenLeftClick(x, y):
    rect = Rectangle(x, y)
    rect.drawShape()


## 메인 코드 부분 ##
turtle.title('거북이로 객체지향 사각형 그리기')
turtle.onscreenclick(screenLeftClick, 1)
turtle.done()