# 20155342 지현규
install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

data(anscombe)
str(anscombe)

# 1

anscombe %>% ggplot(aes(x = x1, y = y1)) + geom_point() + geom_smooth(method = 'lm')
anscombe %>% ggplot(aes(x2,y2)) + geom_point() + geom_line()
anscombe %>% ggplot(aes(x3,y3)) + geom_point() + geom_area()
anscombe %>% ggplot(aes(x4,y4)) + geom_point() + geom_jitter()

sapply(anscombe, mean)
sapply(anscombe, sd)

with(anscombe, {
  cor(x1, y1)
  cor(x2, y2)
  cor(x3, y3)
  cor(x4, y4)
})

pairs(anscombe)


# 2
?read.table
boston = read.table("boston.txt", header = T, sep = "", stringsAsFactors = F)
# 2) 데이터구조확인
str(boston)
# 3) 기초통계요약확인
summary(boston)
# 5) 주택 가격과 다른 특징들과의 상관계수
cor(boston$medv, boston[1:13])
# 6) rm,ptratio, lstat, medv 4개 특징만 사용
sboston = boston[, c('rm', 'ptratio', 'lstat', 'medv')]
# 7) scatter plot 확인
pairs(sboston)

# 8) 
oldp = par(mfrow = c(2,2))
hist(sboston$rm)
hist(sboston$ptratio)
hist(sboston$lstat)
hist(sboston$medv)

par(oldp)

sboston %>% ggplot(aes(x = rm)) + geom_histogram() + geom_freqpoly() + scale_x_log10()
sboston %>% ggplot(aes(x = ptratio)) + geom_histogram() + geom_freqpoly() + scale_x_log10()
sboston %>% ggplot(aes(x = lstat)) + geom_histogram() + geom_freqpoly() + scale_x_log10()
sboston %>% ggplot(aes(x = medv)) + geom_histogram() + geom_freqpoly() + scale_x_log10()
