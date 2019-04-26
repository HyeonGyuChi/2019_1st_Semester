# KeyBoard 처리

import turtle as t

t.shape("turtle")

def draw_line(d) :
    if d == 'Up' :
        t.setheading(90)

    if d == 'Down' :
        t.setheading(270)

    if d == 'Left':
        t.setheading(180)

    if d == 'Right':
        t.setheading(0)

    t.forward(50)

def key_Up() :
    print('Up')
    draw_line('Up')

def key_Down() :
    print('Down')
    draw_line('Down')

def key_Left() :
    print('Left')
    draw_line('Left')

def key_Right() :
    print('Right')
    draw_line('Right')

# t.hideturtle()

t.setup(500, 500)
s = t.Screen()

s.onkey(key_Up, 'Up')
s.onkey(key_Down, 'Down')
s.onkey(key_Left, 'Left')
s.onkey(key_Right, 'Right')

s.listen()

t.mainloop()