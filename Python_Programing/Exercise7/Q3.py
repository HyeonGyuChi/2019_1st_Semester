import turtle as t
t.shape("turtle")

t.fillcolor("blue")
t.begin_fill()
t.circle(50, steps = 4)
t.end_fill()

t.penup()

t.forward(150)
t.fillcolor("yellow")
t.begin_fill()
t.circle(50, steps = 4)
t.end_fill()
t.hideturtle()

t.exitonclick()