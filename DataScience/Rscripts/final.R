#1 boston 데이터 시각화 <시각화 부터 이상치 체크 회귀분석을 통한 값 예측까지>

boston = read.table("boston.txt", sep="", header =T, stringsAsFactors=F)
# 데이터 구조확인
str(boston)

summary(boston)

cor(boston)

# medv기준 전체 특징 상관도
medv_cor = cor(boston$medv, boston)

# 상관도 내림차순 정렬
sort_index = order(abs(medv_cor), decreasing = T) # 정렬한 index
sort_cor = medv_cor[,sort_index] # medv 기준 전체특징 상관도 내림차순 정렬(정렬시 행별로 하기[,<여기에>])
barplot(sort_cor, main="medv기준 전체 특징 상관도") # 시각적 확인

# 상관도가 높은 특징 4개 확인
sort_cor[1:4] # 1은 = medv // 없이 뽑고 싶으면 [2:5]
# 상관도가 높은 기준으로 boston데이터프레임 정렬
sort_boston = boston[,sort_index]

# 높은특징 4개의 데이터 분포확인
boxplot(sort_boston[1:4], main="medv기준 상관도가 높은 4가지 특징들의 데이터분포")

# 높은특징 4개의 scatter plot 확인
pairs(sort_boston[1:4])


# medv와 rm을 살펴보자!

# rm = 주거지당 방개수 / medv = 주거지 가격
ggplot(boston, aes(x=boston$medv, y=boston$rm)) +
  geom_point(col='red', size=2) +
    geom_smooth(method=lm) +
      labs(title="BOSTON | rm per medv", x = "medv", y ="rm", subtitle=paste("주거지 가격 별 방 개수 | 상관도 (cor) : ", round(cor(boston$medv, boston$rm),3)))



boxplot(sort_boston$rm, main="RM데이터의 분포")
# 이상치 체크

# boxplot을 이용한 체크
outvalue = boxplot.stats(sort_boston$rm)$out # rm의 outlier 값
outindex = which(sort_boston$rm %in% outvalue) # outlier가 있는 값의 index
plot(boston$rm, xlab="index", ylab="rm", main="RM의 평명분포도")
points(outindex, outvalue, col="red", pch="v") # outlier 체크

# Q1~Q3 25% 75% 사이 
Q1 = quantile(boston$rm, 0.25) # 1사분위
Q3 = quantile(boston$rm, 3/4) # 3사분위
iqr = Q3-Q1
abline(h=Q1, col="blue") 
abline(h=Q3, col="blue")

# < lw ~ uw > 체크 // orange라인이 넘어간 부분이 outlier
lw = Q1-iqr*1.5
uw = Q3+iqr*1.5
abline(h=lw, col="orange")
abline(h=uw, col="orange")


# 회귀분석
plot(boston$rm, boston$medv, main="방개수 별 주택가격 | 회귀분석하기")
fit1 = lm(medv~rm, boston) # medv(결과) rm(원인) : 방개수에 따라 가격을 예측

# 회귀모델확인
summary(fit1) 
coef(fit1)
# y(가격) = -9.102109*x(방개수) - 34.670621
# 평균잔차 = 6.616

# 회귀선 그리기
abline(fit1, col="blue")
title(sub = "y(가격) = -9.102109*x(방개수) - 34.670621")

# 예측 (방이 10개일때 가격은?) 56.35047
predict(fit1, newdata = data.frame(rm=10), interval = "confidence") # 신뢰구간 함께표시

# 추가 회귀분석
# cor이 높은 3개만 모델링
fit2 = lm(medv~lstat+rm+ptratio, data = boston)
summary(fit2)
coef(fit2)
# y(medv) = -0.5718057*x(lstat) + 4.5154209(rm) + -0.9307226(ptratio)
# 표준잔차 : 5.229

# 가중치 그래프
barplot(fit2$coefficients)

#예측 16.89..
predict(fit2, newdata = data.frame(lstat=5.21, rm=4, ptratio=18), interval="confidence")

