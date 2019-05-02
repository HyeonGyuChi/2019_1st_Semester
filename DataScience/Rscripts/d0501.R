library(ggplot2)
library(dplyr)
# 1. 데이터에 대한 설명 확인
?diamonds
?mpg

#2. str() 로 데이터구조를 파악
data(diamonds)
str(diamonds)
data(mpg)
str(mpg)
###

diamonds %>% ggplot(aes(carat, price)) + geom_point()
diamonds %>% ggplot(aes(carat, price)) + geom_point(alpha = .01)
mpg %>% ggplot(aes(cyl, hwy)) + geom_point()
mpg %>% ggplot(aes(cyl, hwy)) + geom_jitter()

pairs(iris[c(1:4)])

diamonds %>% ggplot(aes(cut)) + geom_bar()
mpg %>% ggplot(aes(class, hwy)) + geom_boxplot()
###



#3. pairs() 산점도 행렬로 변수들의 분포, 변수 사이의 관계확인
# (변수의 개수, 샘플의 개수가 너무 크면 랜덤 샘플(sample_n())로 적당한 개수 추출)
pairs(sample_n(diamonds, 100))
mpg$model = as.factor(mpg$model)
pairs(mpg[2:3])
# diamond 에서 두개의 변수가 선형적인 분포를 보이는 plot관계
# carat : x,y,z, price
diamonds %>% ggplot(aes(carat, price)) + geom_point()
diamonds %>% ggplot(aes(carat, price)) + geom_point(alpha = .02)
# >> carat에 따른 price 분포 : 다이아몬드가 무거울수록 prcie가 높아짐
diamonds %>% ggplot(aes(color)) + geom_bar()
diamonds %>% ggplot(aes(clarity, price)) + geom_boxplot()
#4. 주요 변수 분석(수량형 : 히스토그램, 범주형 : 막대그래프)
