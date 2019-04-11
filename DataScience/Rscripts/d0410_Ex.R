# 정규분포 난수 50개 x,y에 각각 생성
x = rnorm(50)
y = rnorm(50)

# x,y,를 각각 축의 limit값을 max와 mim값으로 지정하여 point 타입으로 그리기
plot(x,y, main = "Normal Distridution Data Plot", ylim = range(y), xlim = c(min(x), max(x)),type = "p") 
abline(v=mean(x), lty = 2, col = "red") # x의 평균 vertical로 그리기
abline(h=mean(y), lty = 2, col = "blue") # y의 평균 horizon으로 그리기

dev.copy(pdf, "1.pdf")
dev.off()
 

# 2
data(iris)
str(iris)
Species = split(iris, iris$Species)

#setosa = Species$setosa
#versicolor = Species$versicolor
#virginica = Species$virginica

lengthRange = c(min(iris$Petal.Length), max(iris$Petal.Length))
widthRange = c(min(iris$Petal.Width), max(iris$Petal.Width))

Species["setosa"]

plot(NULL, main ="iris plot", xlab ="width", ylab = "length", xlim = lengthRange, ylim = WidthRange)
points(Species$setosa$Petal.Width, Species$setosa$Petal.Length, col = 'red')


with(Species,{
  plot(NULL, main ="iris plot", xlab ="width", ylab = "length", xlim = widthRange, ylim = lengthRange, sub = "(Petal)")
  points(setosa$Petal.Width, setosa$Petal.Length, pch = 20, col = "red")
  points(versicolor$Petal.Width, versicolor$Petal.Length, pch = 20, col = "blue")
  points(virginica$Petal.Width, virginica$Petal.Length, pch = 20, col = "yellow")
  })

legend("bottomright", lty=1, col=c("red","green", "yellow"), c("setosa","versicolor", "virginica"))

dev.copy(jpeg, "2.jpg")
dev.off()
