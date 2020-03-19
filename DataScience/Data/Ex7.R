# 실습7. 시각화 연습
# 문제1) 정규분포 데이터 그래프

# 1)50개의 정규분포를 따르는 랜덤값을 이용하여 x, y 벡터를 생성
x = rnorm(50)
y = rnorm(50)

# 2)x, y의 최대,최소로 그래프 범위 설정
xr = c(min(x), max(x))
yr = c(min(y), max(y))

# 3)x,y를 이용하여 plot
plot(x,y, main = 'Normal Distribution Data Plot', xlab = 'x', ylab = 'y', xlim = xr, ylim = yr)

# 4)x의 평균값은 빨강, y의 평균값은 파랑으로 점선 그리기
abline(v = mean(x), lty = 2, col= 'red')
abline(h = mean(y), lty = 2, col = 'blue')

# 5)1.pdf로 저장
dev.copy(pdf, '1.pdf')
dev.off()

# 문제2) iris 데이터 그래프 
# points() 이용, 종류별 색이 다른 채워진 작은 원으로 그리기

# 1)iris$Species에 따라 분리
spe = split(iris, iris$Species)
names(spe)


# 2)iris$Petal.Width, iris$Petal.Length의 최대,최소로 그래프 범위 설정
xr = c(min(iris$Petal.Width), max(iris$Petal.Width))
yr = c(min(iris$Petal.Length), max(iris$Petal.Length))

# 3)분리된 3종류에 대한 Petal.Width와 Petal.Length 그래프 그리기
plot(NULL, xlim = xr, ylim = yr, xlab = '', ylab ='')

# 4)제목, 부제목, 범례 지정
title(main = 'iris plot', sub = '(Petal)', xlab = 'width', ylab = 'length', col.main = 'blue', col.lab = 'red')
color = c('red','blue','green')

with(spe,{
  points(setosa$Petal.Width, setosa$Petal.Length, col = color[1], pch = '●')
  points(versicolor$Petal.Width, versicolor$Petal.Length, col = color[2] , pch = 16)
  points(virginica$Petal.Width, virginica$Petal.Length, col = color[3] , pch = 16)
})

legend("bottomright", lty = 1, col = color, names(spe))

# 5) 2.jpg로 저장
dev.copy(jpeg, '2.jpeg')
dev.off()
