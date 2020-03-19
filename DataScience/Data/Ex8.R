# 실습8. barplot,  boxplot, plor(scatter), matplot, par(mfrow=..) 연습

# 1. 정규분포를 따르는 난수  5개를 색별로 막대 그래프 그리기
x = rnorm(5)
barplot(x, col = c(1:5), legend.text = c(1:5), main = '5 rnorm')

# 2. iris 데이터셋의 Petal.Length의 종별 중간값에 대한   막대 그래프 그리기
spemid = aggregate(iris[,"Petal.Length"], list(iris$Species), median)
spemid = tapply(iris[,"Petal.Length"], iris$Species, median)
barplot(spemid, main = '종별 Petal.Length 중간값', col = c(1:3), legend.text = spemid)

# 3. iris 데이터셋의 Petal.Length의 확률밀도 히스토그램과 확률밀도그래프를 그리기
hist(iris$Petal.Length, freq = F)
lines(density(iris$Petal.Length))
# == plot(density(iris$Petal.Length))

# 4. iris 데이터셋의 박스 플롯 그리기
boxplot(iris, main)

# 5. iris 데이터셋의 Petal.Length, Petal.Width의 박스 플롯 그리기
## == boxplot(iris[,c('Petal.Length', 'Petal.Width')], col = c(1:2), main = 'IRIS BOX PLOT')
boxplot(iris$Petal.Length, iris$Petal.Width, names = c('Length', 'Width'))
title(main = 'IRIS BOX PLOT', xlab = 'Petal')


# 6. iris 데이터셋의 setosa만 Petal.Length, Petal.Width의 박스 플롯 그리기
## == boxplot(iris[which(iris$Species == 'setosa'), c('Petal.Length', 'Petal.Width')], main = 'Iris Setosa')
# subset사용
seto = subset(iris, Species == 'setosa')
boxplot(seto$Petal.Length, seto$Petal.Width, names = c('Length', 'Petal'))
title(main = 'Iris Setosa', xlab = 'Petal')

# 7. iris 데이터셋의 종별, Sepal.Length의 박스 플롯 그리기
sp = split(iris, iris$Species)
names(sp)
with(sp,{
  boxplot(setosa$Sepal.Length, versicolor$Sepal.Length, virginica$Sepal.Length, names = names(sp))
  title( main = 'Iris 종별 Sepal.length', xlab = 'Sepal.length')
})

# 8. iris 데이터셋의 Sepal.Length에 대한 Petal.Length의 플롯 그리기
plot(iris$Sepal.Length, iris$Petal.Length)

# 9. iris 데이터셋의"setosa"종에 대한 Petal.Length, Petal.Width를 matrix로 만들어 plot
m = matrix(c(sp$setosa$Petal.Length, sp$setosa$Petal.Width), ncol = 2)
## == 
with(sp, {
  m = cbind(setosa$Petal.Length, setosa$Petal.Width)  
})

matplot((1:50),m, col = c(1:2), pch = c('o','x'))
legend("center", c('len', 'wid'), col = c(1:2), pch = c('o','x'))


# 10.  iris 데이터셋의 Petal.Length, Petal.Width, Sepal.Length, Sepal.Width의 density 그래프를  2행, 2열로 plot
oldp = par(mfrow = c(2,2))
plot(density(iris$Petal.Length))
plot(density(iris$Petal.Width))
plot(density(iris$Sepal.Length))
plot(density(iris$Sepal.Width))
par(oldp)
