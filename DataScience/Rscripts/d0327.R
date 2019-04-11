n = c("hong", "min", "kim", "jin") # 성명
h = c(172.6, 155.7, 180.9, 170.5) # 키
a = c(20,40,19,23) # 나이

(d3 = data.frame(name = I(n), height = h, age = a))

#데이터프레임 수정

(d3[1,] = c("song", 160.5, 33)) 
d3

d3$height = c(166,177,188,178)
d3

d3[1,3] = 22
d3

edit(d3)

# 데이터프레임 요소추가
# 새로운 열 추가
w = c(55.6, 70.4, 54.6, 80.4)
d3$weight = w
d3

# 열삭제
d3$weight = NULL
d3

d1 = d3

# 행결합
(d4 = rbind(d1,d3))
# 열결합
(d5=cbind(d1,d3))
(df=data.frame(d1[,c(1,3)],d3[,c(1,2)]))
(mg=merge(d1[,c(1,3)], d3[,c(1,2)]))

(mean1 = lapply(d1[,-1], mean))
