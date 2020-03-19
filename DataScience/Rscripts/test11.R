# '''
# 실습 #11.visualization
# 
# 
# 1.Anscombe's quartet 데이터 시각화
# 
# 2. boston 데이터 시각화 (수량형 데이터)
# (1)Boston House Prices dataset 사용
# https://www.kaggle.com/에서 검색하여  데이터 특징 설명 및 파일 다운
# (2)데이터의  구조 확인
# (3)기초통계요약 확인
# (4)모든 특징들에 대한 상관계수 확인
# (5)주택가격(medv)과 다른 특징들과의  상관계수
# (6) rm,ptratio, lstat, medv 4개 특징만 사용
# (7)4 특징들에 대한 scatter plot (산점도 행렬 : Scatterplot Matrices)
# (8)4 특징들의 분포(histogram) 확인
# '''

################# 1.Anscombe's quartet 데이터 시각화

data(anscombe)
? anscombe
# 1. Anscombe's quartet 데이터 시각화
# - 1) 평균, 표준편차, 상관계수 확인
# - 2) 각 데이터 셋에 대한 scatter plot
# - (x1-y1, x2-y2, x3-y3, x4-y4)

apply(anscombe,2, mean)
apply(anscombe,2, sd)
cor(anscombe[c(1:4)], anscombe[c(5:8)])
cor(anscombe)
with(anscombe,
     {
       cat(cor(x1,y1))
       cat(cor(x2,y2))
       cat(cor(x3,y3))
       cat(cor(x4,y4))
     })
x11()


ggplot(anscombe,aes(x1,y1)) + geom_point(col="orange",size=2)+
  geom_smooth(method=lm,se=F) + labs(title="x1 y1", subtitle=paste("cor:",cor(anscombe$x1, anscombe$y1))) # se=F 추세선 == (회귀분석) 추세를 알수 있다 == 예측을위한 선
ggplot(anscombe,aes(x2,y2)) + geom_point(col="orange",size=2)+
  geom_smooth(method=lm,se=F) + labs(title="x2 y2", subtitle=paste("cor:",cor(anscombe$x2, anscombe$y2)))
ggplot(anscombe,aes(x3,y3)) + geom_point(col="orange",size=2)+
  geom_smooth(method=lm,se=F) + labs(title="x3 y3", subtitle=paste("cor:",cor(anscombe$x3, anscombe$y3)))
ggplot(anscombe,aes(x4,y4)) + geom_point(col="orange",size=2)+
  geom_smooth(method=lm,se=F) + labs(title="x4 y4", subtitle=paste("cor:",cor(anscombe$x4, anscombe$y4)))



################### # 2. boston 데이터 시각화 (수량형 데이터)
install.packages("ggplot")
library(ggplot2)


# 1. boston 데이터 시각화
boston = read.table("boston.txt", header = T, sep="", stringsAsFactors = F)

# 2. 데이터의 구조확인
str(boston)

# 3. 기초통계요약확인
summary(boston)

# 4. 모든 특징들에 대한 상관계수 확인
cor(boston)

# 5. 주택가격(medv)과 다른 특징들과의 상관계수
(medv_cor = cor(boston, boston$medv)) # 세로로
(medv_cor = cor(boston$medv, boston[,c(-14)])) # 가로로 > 추후 barplot을 위해 가로로 뽑는 것이 유리 > medv열은 제외하고
barplot(medv_cor)

# 6. rm ptratio, lstat, medv 4개 특징만 사용
boston4 = boston[c("rm","ptratio","lstat", "medv")] # 4개 특징만 추출하여 새로운 dataframe 만들기

### medv와 상관계수가 높은 특징 확인하기
#  상관계수의 경우 절대값 1과 가까운것을 기준으로 sorting필요
sorted_medv_cor = medv_cor[order(abs(medv_cor), decreasing = "T")]
sorted_name = names(boston[,c(-14)])[(order(abs(medv_cor), decreasing = "T"))] # barplot에 표시할 이름도 sorting

barplot(sorted_medv_cor, names = sorted_name, main ="medv기준 상관계수 내림차순정렬")

# names설정필요없이 > 열 기준으로 정렬하면 됨
sorted_medv_cor = medv_cor[,order(abs(medv_cor), decreasing = "T")]

###


# 7. 4특징들에 대한 scatter plot 산점도 행렬
pairs(boston4)
### ggplot 사용하면 이런식으로~
ggplot(boston4, aes(boston$medv, boston$rm)) + 
  geom_point(aes(boston$medv, boston$rm))


# 8. 4특징들의 분포확인 histgram
### medv와 상관계수 높은 상위 4개 특징 boxplot 만들기
boxplot(boston[,order(abs(medv_cor), decreasing = "T")][1:4])
###

oldpar = par(mfrow = c(2,2))

hist(boston$rm,freq = F)
lines(density(boston$rm))

hist(boston$ptratio,freq = F)
hist(boston$lstat,freq = F)

plot(density(boston$medv))

par(oldpar)
