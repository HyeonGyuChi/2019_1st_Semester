# d0405_2 Data Visualization

#데이터준비
(x = runif(10)) # 0-1사이의10개난수발생
(x = as.integer(x * 10)) # 0-10사이정수값으로변경
# x를파란색점선타입으로plot, 제목설정
plot(x, main="0-10 random number plot", type="b", col="blue")

#비어있는plot에선, 점을그리고제목을설정
plot(x, ann=FALSE, type = "n") #x,y축라벨없이, no plotting.
abline(h = 5, col = "gray") #gray 색상으로y축5에선그리기
lines(x, col = "green4", lty= "dotted") # x값을그린4 색상, 점선으로그리기
points(x, bg= "limegreen", pch= 21) #x값을limegreen색으로채워진원점으로그리기
#주제목(main), x축제목(xlab) 설정
title(main = "Simple Use of Color In a Plot", xlab= "Just a Whisper of a Label",
      col.main= "blue", col.lab= "gray", cex.main= 1.2, cex.lab= 1.0, font.main= 4, font.lab= 3)
plot.new() #plot 지우기, frame()

#plot()
x = 1:5
y = seq(2,10,2)
plot(x)
plot(x,y)
plot(sin,-pi, 2*pi, ylim = c(2,-2), xlab = "x축", ylab = "y축", main = "sin(x) 그래프", sub = "소제목") #함수그래프 plot(함수,sin, cos)
curve(sin,-pi, 2*pi) #함수그래프

#사용자정의함수그래프예
f1 = function(x){
  x^2
}
plot(f1, -3,3)
curve(f1(x), -3, 3)
#표준정규분포함수
gauss.density=function(x){
  1/ sqrt(s*pi) * exp(-x^2 /2)
}
plot(gauss.density,-3, 3)


#함수인수2개이상일경우함수그래프예
f2 = function(x,y){
  2*x*y + x^2+y^2
}
curve(f2(x,4), -3,3)

y= c(1,3,2,4,8,5,7,6,9)
plot(y, main=" Simple Time Series")
plot(y, main=" Simple Time Series", ylim=c(0,10), type="l") #제목, y축범위, type 선설정
par(new = T) #그래프겹쳐그리기
z = c(6,5,8,4,2,9,3,1,7)
plot(z, ylim=c(0,10), type="b", ylab="", col="red") #type선,점선택, 색상red


y= c(1,3,2,4,8,5,7,6,9)
z = c(6,5,8,4,2,9,3,1,7)
plot(y, ylim=c(0,10), ylab="", pch=1) # 원모양의점플롯
par(new = T)
plot(z, ylim=c(0,10), ylab="", pch=15, col="blue") #파란색사각점플롯

#조건에따른모양설정
data(sleep)
plot( sleep$extra, col=ifelse(sleep$group== 1,"red","blue"))
plot( sleep$extra, pch=ifelse(sleep$extra < 0,"X","O"))

#점추가
data(iris)
with (iris , {
  plot (NULL , xlim=c(0, 5) , ylim=c(0, 10) ,
        xlab=" width ", ylab=" length ", main =" iris ", type ="n")
  points ( Sepal.Width, Sepal.Length, pch=20)
  points ( Petal.Width, Petal.Length, pch="+", col="red")
})

#[0, 2π]까지sin 그래프
x = seq (0, 2*pi , 0.1)
y = sin(x)
plot (x, y, cex=.5 , col ="red ") #점크기를작게(cex디폴트1)
lines (x, y)

# 직선을 그리는 함수
plot (cars , xlim=c(0, 25) )
abline(a=-5, b=3.5 , col ="red ") #절편-5, 기울기b인직선
abline(h= mean ( cars $ dist), lty=2, col =" blue ") #dist평균수평선
abline(v= mean ( cars $ speed ), lty=2, col =" green ") #speed평균수직선

# text : 그래프에 문자를 그리는 함수
plot (cars$dist)
text(5, 100, "cars1", cex=2) #5,100위치에크기2, 문자
#20,100위치에45도각도로빨간색문자
text(20, 100, "cars45", srt=45, col='red')
#최대값의위치에문자와빨간색큰점그리기
max = which.max(cars$dist)
text(max, cars$dist[max]-4, "carsMax", col='red')
points(max, cars$dist[max], pch=16, col='red', cex=2)

# legend : 범례 기호설명표를 표시
plot(sin, -pi, pi, xlab="x", ylab="y", lty=1)
plot(cos, -pi, pi, lty=2, add=T)
legend("bottomright", lty=1:2, c("sin", "cos"))

#x^1, x^2, x^3 그래프에범례지정예
square = function(x,y) x ^ y
curve(square(x, 1), xlim=c(-2,2), ylim=c(-4,4), ylab="x ^ y", col=1)
par(new=T) #겹쳐그리기
curve(square(x, 2), xlim=c(-2,2), ylim=c(-4,4), ylab="", col=2)
par(new=T)#겹쳐그리기
curve(square(x, 3), xlim=c(-2,2), ylim=c(-4,4), ylab="", col=3)
legend("top", lty= 1, col=1:3, c("x^1", "x^2", "x^3")) #범례

# title
data(sleep)
plot( sleep$extra, col=ifelse(sleep$group== 1, "red","blue"), xlab="")
title(main = "Main title", xlab= "Sub title", col.main = "blue", col.lab= "red" )

# axis
# Normal Distribution
#평균0, 표준편차1인정규분포를따르는임의수7개추출하여그리기
x = rnorm(7)
#축을없애고그리기
plot(1:7, x , main = "axis() examples", type = "s", ylim=c(-3, 3), axes = F, col = "red")
box() #테두리그리기
#axis() 축그리기, side : 1=below, 2=left, 3=above and 4=right
#아래축라벨을파란색으로지정
axis(side=1, col.axis= "blue")
#왼쪽축, -3~3까지4개눈금,파랑색점선굵기0.5,
axis(side=2, yaxp=c(-3,3, 4), col = "blue", lty= 2, lwd= 0.5)
#위축, 1:7 범위를A:G로표기, 금색점선굵기0.5,
axis(side=3, 1:7, LETTERS[1:7], col = "gold", lty= 2, lwd= 0.5)
#오른쪽축, 보라색굵기2 선, 축라벨색어두운보라색
axis(side=4, col = "violet", col.axis= "dark violet", lwd= 2)

# 정규분포함수그래프를파일에저장
#파일디바이스를열어서그리기
pdf(file="nd1.pdf") #pdf 디바이스열기
curve(dnorm, -4, 4, main="Normal Distribution") #그리기
dev.off() #디바이스닫기
#그래프디바이스에그려진그래프를파일디바이스로복사
curve(dnorm, -4, 4, main="Normal Distribution") #그리기
dev.copy(jpeg, "nd2.jpg") #jpg 디바이스로출력
dev.off() #디바이스닫기


