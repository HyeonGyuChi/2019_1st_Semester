# Click Event 처리

import turtle as t
import random

t.shape("turtle")

color = ['red', 'blue', 'yellow']

def draw_reg(x,y) :
    t.penup()
    t.goto(x,y)
    t.pendown()

    select = random.choice(color)
    t.fillcolor(select)
    t.begin_fill()
    t.circle(20, steps=4)
    t.end_fill()


t.hideturtle()
t.speed(0)

t.setup(500,500)
s = t.Screen()
s.onclick(draw_reg, 1)
s.listen()

t.mainloop()