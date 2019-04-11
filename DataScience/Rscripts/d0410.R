# d0410_Ex2 23~30 확인
# 정규분포를 따르는 난수 10개에 대한 막대그래프
(b = rnorm(10))
barplot(b)

#iris 데이터셋의 Sepal.Width의 종별 평균에 대한 막대그래프
str(iris)
m = tapply(iris$Sepal.Width, iris$Species, mean)
barplot(m, main = "Mean(iris$Sepla.width)", col = c(1,2,3), legend.text = c(m))

# 히스토그램 : 도수분포의 상태를 막대그래프로 나타낸것
hist(iris$Sepal.Width)
hist(iris$Sepal.Width, freq = FALSE)
lines(density(iris$Sepal.Width))
plot(density(iris$Sepal.Width))

# 어떠한 분포를 보여주는 상자그림
# 자료로 부터 얻어낸 통계량인 5가지 요약수치
# 최소값, 제 1사분위(Q1) 제 2사분위(Q2) 제 3사분위(Q3) 최대값
# 사분위범위(IQR) : 3분위수 - 1분위수

boxplot(m)
x = rnorm(50)
y = rnorm(50)
z = rnorm(50)
boxplot(x,y,z)
summary(x)
summary(y)
summary(z)

plot(density(x))
plot(density(y))
plot(density(z))

# pie
x = 1:10
pie(x, radius = 1, labels = LETTERS[x], clockwise = T, main ="Pie graph(1:10)")

# 행렬데이터그리기
x= seq(-2*pi, 2*pi, 0.01)
y= matrix(c(cos(x), sin(x)), ncol = 2)
matplot(x,y, col = c("red", "black"), cex = .2, main = "sin/cos")
abline(h=0, v=0, lty =2)
          
oldp = par(mfrow=c(2,2)) # 이전설정 저장
plot(iris$Sepal.Length, iris$Sepal.Width)
x = 1:10
pie(x,radius = 1, labels = LETTERS[x], clockwise = T, main="Pie graph(1:10)")
data(sleep)
plot(sleep$group, sleep$extra)
plot(sleep$extra)
par(oldp)

plot(sleep$extra)

