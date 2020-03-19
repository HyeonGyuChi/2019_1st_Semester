
#####################################
#1. 정규분포를 따르는 난수  5개를 색별로 막대 그래프 그리기
#2. iris 데이터셋의 Petal.Length의 종별 중간값에 대한   막대 그래프 그리기
#3. iris 데이터셋의 Petal.Length의 확률밀도 히스토그램과 확률밀도그래프를 그리기
#4. iris 데이터셋의 Petal.Length, Petal.Width의 박스 플롯 그리기
#5. iris 데이터셋의 종별, Sepal.Length의 박스 플롯 그리기
#6. iris 데이터셋의 Sepal.Length에 대한 Petal.Length의 플롯 그리기
#8.  iris 데이터셋의"setosa"종에 대한 Petal.Length, Petal.Width를 matrix로 만들어 plot
#9.  iris 데이터셋의 Petal.Length, Petal.Width, Sepal.Length, Sepal.Width의 density 그래프를  2행, 2열로 plot
##########################

data(iris)

#1. 정규분포를 따르는 난수  5개를 색별로 막대 그래프 그리기
(b = rnorm(5))
barplot(b, col=c(1:5), names=c(1:5))

#2. iris 데이터셋의 Petal.Length의 종별 중간값에 대한   막대 그래프 그리기
(m = tapply ( iris $ Petal.Length , iris $ Species , median ))
barplot (m , main="Median(iris$Petal.Length)", col=c(1,2,3), legend.text= c(m))


#3. iris 데이터셋의 Petal.Length의 확률밀도 히스토그램과 확률밀도그래프를 그리기
hist ( iris $ Petal.Length , freq = FALSE )
lines ( density ( iris $ Petal.Length ))

#4. iris 데이터셋의 박스 플롯 그리기
#5. iris 데이터셋의 Petal.Length, Petal.Width의 박스 플롯 그리기
#6. iris 데이터셋의 setosa만 Petal.Length, Petal.Width의 박스 플롯 그리기
boxplot (iris )

boxplot (iris$Petal.Width, iris$Petal.Length, names=c('Width', 'Length'))
title(main = "Box Plot (iris $ Petal.Width, Petal.Length)",
      xlab = "Petal ",  )

s = subset(iris, Species == 'setosa', c(Petal.Width, Petal.Length))
boxplot (s, names=c('Width', 'Length'))
title(main = "Box Plot (iris Setosa)",
      xlab = "Petal ")

#7. iris 데이터셋의 종별, Sepal.Length의 박스 플롯 그리기
g= split(iris, iris$Species)
with(g, {
  boxplot (setosa$ Sepal.Length, versicolor$ Sepal.Length, virginica$ Sepal.Length )
})
title(main = "Box Plot (iris Setosa)",
      xlab = "Petal ")

#8. iris 데이터셋의 Sepal.Length에 대한 Petal.Length의 플롯 그리기
plot(iris$Sepal.Length, iris$Petal.Length)


#9.  iris 데이터셋의"setosa"종에 대한 Petal.Length, Petal.Width를 matrix로 만들어 plot
m =matrix(c(g$setosa$Petal.Width, g$setosa$Petal.Length), ncol=2)
matplot(m, pch=c(1,2), col=c("red","blue"))


#10.  iris 데이터셋의 Petal.Length, Petal.Width, Sepal.Length, Sepal.Width의 density 그래프를  2행, 2열로 plot
oldp = par(mfrow=c(2,2)) #이전설정 저장

plot ( density ( iris $ Sepal.Length))
plot ( density ( iris $ Sepal.Width ))
plot ( density ( iris $ Petal.Length ))
plot ( density ( iris $ Petal.Width ))

par(oldp)


