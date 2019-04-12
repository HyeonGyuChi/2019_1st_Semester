#'''
#실습  #8. barplot,  boxplot, plor(scatter), matplot, par(mfrow=..) 연습
#1. 정규분포를 따르는 난수  5개를 색별로 막대 그래프 그리기
#2. iris 데이터셋의 Petal.Length의 종별 중간값에 대한   막대 그래프 그리기
#3. iris 데이터셋의 Petal.Length의 확률밀도 히스토그램과 확률밀도그래프를 그리기
#4. iris 데이터셋의 박스 플롯 그리기
#5. iris 데이터셋의 Petal.Length, Petal.Width의 박스 플롯 그리기
#6. iris 데이터셋의 setosa만 Petal.Length, Petal.Width의 박스 플롯 그리기
#7. iris 데이터셋의 종별, Sepal.Length의 박스 플롯 그리기
#8. iris 데이터셋의 Sepal.Length에 대한 Petal.Length의 플롯 그리기
#9.  iris 데이터셋의"setosa"종에 대한 Petal.Length, Petal.Width를 matrix로 만들어 plot
#10.  iris 데이터셋의 Petal.Length, Petal.Width, Sepal.Length, Sepal.Width의 density 그래프를  2행, 2열로 plot

# 1번
random = rnorm(5)

barplot(random, col = c(1,2,3,4,5), legend.text = c(random), main = '1번문제')

# 2번
data(iris)
str(iris)
Spe = split(iris, iris$Species)
setosa = Species$setosa
versicolor = Species$versicolor
virginica = Species$virginica

spmedian = tapply(iris$Petal.Length, iris$Species, median)


barplot(spmedian, col = c(1,2,3), main = "Petal.Length의 종별 중간값", legend.text = c(spmedian))


# 3번
hist(iris$Petal.Length, freq = FALSE)
lines(density(iris$Petal.Length))

# 4번
boxplot(iris)

# 5번
boxplot(iris$Petal.Length, iris$Petal.Width, main ='Petal Length와 Width', xlab = c('Petal.Length', 'Petal.Width'))

#6. iris 데이터셋의 setosa만 Petal.Length, Petal.Width의 박스 플롯 그리기
with(Species,{
  boxplot(setosa$Petal.Length, setosa$Petal.Width, main = 'Setosa의 Petal Length Width')
})

setosa = subset(iris, Species == 'setosa', c(3,4))
boxplot(setosa)

#7. iris 데이터셋의 종별, Sepal.Length의 박스 플롯 그리기
with(Species,{
  boxplot(setosa$Petal.Length, versicolor$Petal.Length, virginica$Petal.Length, main = '종별 Petal.length', names = c('Setosa', 'Versicolor', 'Virginica'))
})

#8. iris 데이터셋의 Sepal.Length에 대한 Petal.Length의 플롯 그리기
irisPL = iris$Petal.Length
irisSL = iris$Sepal.Length
with(iris,{
  plot(NULL, xlim = c(min(irisSL),max(irisSL)), ylim = c(min(irisPL), max(irisPL)), main = "IRIS", xlab = 'Sepal.Length', ylab = 'Petal.Length')
  points(Sepal.Length, Petal.Length)
  })

plot(iris$Sepal.Length, iris$Petal.Length, xlab = "Sepal.Length", ylab = "Petal.Length", main ='Iris')

#9.  iris 데이터셋의"setosa"종에 대한 Petal.Length, Petal.Width를 matrix로 만들어 plot
setoPL = Spe$setosa$Petal.Length
setoPW = Spe$setosa$Petal.Width

(setoMatrix = matrix(c(setoPL, setoPW), ncol = 2))


matplot(setoMatrix, pch = 18)


#10.  iris 데이터셋의 Petal.Length, Petal.Width, Sepal.Length, Sepal.Width의 density 그래프를  2행, 2열로 plot
oldp= par(mfrow=c(2,2))


  plot(density(iris$Petal.Length))
  plot(density(iris$Petal.Width))
  plot(density(iris$Sepal.Length))
  plot(density(iris$Sepal.Width))


par(oldp)
