import turtle as t

t.shape("turtle")

n = int(input('n각형의 도형을 그립니다.'))
t.circle(100)
t.circle(100, steps = n)

t.exitonclick()