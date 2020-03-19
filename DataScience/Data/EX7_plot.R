##############################
## 연습문제
#1. 정규분포 데이터 그래프
#1)50개의 정규분포를 따르는 랜덤값을 이용하여 x, y 벡터를 생성
#2)x,y를 이용하여 plot
#3)x의 평균값은 빨강, y의 평균값은 파랑으로 점선 그리기
#4)1.pdf로 저장
#############################
#pdf(file="1.pdf") #pdf 디바이스 열기
(x = rnorm(50))
(y = rnorm(50))
xmin = min(x)
xmax = max(x)
ymin = min(y)
ymax = max(y)

plot (x , y, xlim =c(xmin, xmax), ylim =range(y))
abline (v= mean (x), lty =2, col =" red " )
abline (h= mean (y), lty =2, col =" blue " )
title(main = "Normal Distribution Data Plot")

dev.copy(pdf,file="1.pdf") #pdf 디바이스 출력
dev.off()  #디바이스 닫기

####################################
#2. iris 데이터 그래프 
#1)iris$Species에 따라 분리
#2)분리된 3종류에 대한 Petal.Width, Petal.Length를  다른 색으로 채워진 포인트 그리기(points)
#3)제목, 부제목, 범례 지정
#4)2.jpg로 저장
#####################################

jpeg(file="2.jpg") #jpg 디바이스 열기

data(iris)

sp= split(iris, iris$Species)

xmin = min(iris$Petal.Width)
xmax = max(iris$Petal.Width)
ymin = min(iris$Petal.Length)
ymax = max(iris$Petal.Length)

with (sp , {
  plot (NULL , xlim =c(xmin, xmax) , ylim =c(ymin, ymax) ,
        xlab =" width ", ylab =" length ", main =" iris plot ", sub = "(Petal)", type ="n")
  points (setosa$Petal.Width , setosa$Petal.Length ,  pch=20, col="red")
  points (versicolor$Petal.Width , versicolor$Petal.Length , pch=20, col="blue")
  points (virginica$Petal.Width , virginica$Petal.Length ,  pch=20, col="green")
  legend("bottomright", lty = 1, col=c("red","blue", "green"), c("setosa", "versicolor", "virginica"), cex = 0.7)
})

dev.copy(jpeg, file="2.jpg") #jpg 디바이스 출력

dev.off()  #디바이스 닫기
