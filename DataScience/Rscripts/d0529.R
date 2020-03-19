library(ggplot2)
# 20155342 지현규 

# 단순선형

# 데이터읽기
pf=read.table('./physicalFitness.txt', skip=3,header=T,sep=',')

#상관계수 확인
cor(pf)
cor(pf$height, pf$weight)

#scatter plot으로 확인
ggplot(pf, aes(x=height,y=weight)) + geom_point() +geom_smooth(method="lm") 
# geom_smooth(method="lm") 으로 선형회귀 선 그리기

# Simple Linear Regression
# model fitting
#lm(y(결과)~x(원인), 데이터)
fit1 = lm(weight~height, data=pf) #키에 대한 몸무게 예측

# 분석
summary(fit1)

'''
# <결과분석>
x=height, y=weight
y=-84.93572+ 0.90280*x (+ 8.364)
Residual standard error(e) = 8.364 (잔차의 표준오차)
'''

# 회귀선 그리기
plot(pf$height, pf$weight)
abline(fit1)

#예측
coef(fit1)
predict(fit1, newdata=data.frame(height=182.8), interval="confidence")
'''
# <예측 결과>
weight = 80.09584
신뢰구간(confidence interval) : 79.58~80.60
'''

# 다중선형
fit2 = lm(weight~height+BMI, data = pf)
summary(fit2)

'''
# <결과분석>
x1 = height x2 = BMI y = weight
y = -1.317e+02 + 7.903e-01*x1 + 2.788e+00+x2 (+ 0.9167)// 오차
'''

coef(fit2)
barplot(fit2$coefficients) # w의 값이 높을수록 영향력이 더 크다는 것
# "어떠한입력값이 더 영향력이 좋다" 알고싶을때 bar차트로 한눈에 확인가능함
predict(fit2, newdata=data.frame(height=182.8, BMI = 26), interval="confidence")

# 보스톤 주택가격
boston = read.table('./boston.txt', header = T)

# 단순선형회귀 모델링 // x = lstat (저소득 주민비율) y = medv (주택가격)

# 상관계수 확인
cor(boston$lstat, boston$medv) # -0.73으로 굉장히 높음

# scatter로 확인
ggplot(boston, aes(x=lstat, y=medv)) + geom_point() + geom_smooth(method="lm")

# 상관관계 높으므로 모델링
fit3 = lm(medv~lstat, data=boston)

# 모델확인
summary(fit3)
'''
<결과확인>
x=lstat, y=medv
y=34.55384 + -0.95005x (+ 0.5441)
'''

# 회귀선 그리기
plot(boston$lstat, boston$medv)
abline(fit3)

# 예측 lstat=20의 결과예측
coef(fit3)
predict(fit3, newdata=data.frame(lstat=20), interval="confidence") # 15.55285

# 다중선형회귀 y=medv x = 나머지 모든 특징

# 상관관계 확인 및 scatter확인
cor(boston)
pairs(boston)

# 모델링
fit4 = lm(medv~crim+zn+indus+chas+nox+rm+age+dis+rad+tax+ptratio+black+lstat, data=boston)

# 모델링확인
summary(fit4)
'''
<결과확인>
lm(formula = medv ~ crim + zn + indus + chas + nox + rm + age + 
    dis + rad + tax + ptratio + black + lstat, data = boston)
Residual standard error: 4.745
'''

# w가 높은 것을 체크하기위해 barplt 으로 체크
coef(fit4)
barplot(fit4$coefficients)

#-----------------------------#
# 높은것 4개만 확인
boston_w = coef(fit4)
top4 = boston_w[order(abs(boston_w), decreasing=TRUE)][2:5]
(top4)

# w가 높은 4개를 이용하여 모델링
fit5 = lm(medv~nox+rm+chas+dis, data=boston)

# 모델링확인
summary(fit5)
'''
<결과확인>
lm(formula = medv ~ nox + rm + chas + dis, data = boston)
Residual standard error: 6.098
>> w가 높은상위 4개를 이용한 모델링의 오차가 6.098로 더 크므로 
전체 특징을 이용한 모델을 이용한다면 더 정확한 예측이 가능하다.

하지만 다중변수들이 추가될수록 연산과정이 복잡해지므로 
최소한의 변수들로 최상의 모델을 찾기 위해
둘 사이의 오차가 크지 않다면 더 적은 변수를 사용한 모델을 사용하는 것이 유리하다.
'''