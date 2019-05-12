install.packages("ggplot2")
install.packages("dplyr")

# 1) Heart.csv파일열기
library(ggplot2)
library(dplyr)
# 깨진 age 수
heart = read.csv('heart.csv', header = T)
header = names(heart)
header[1] = 'age'
names(heart) = header

# 2) 나이분포 확인
heart$sex = as.factor(heart$sex)
heart$cp = as.factor(heart$cp)
heart$fbs = as.factor(heart$fbs)
heart$restecg = as.factor(heart$restecg)
heart$exang = as.factor(heart$exang)
heart$slope = as.factor(heart$slope)
heart$ca = as.factor(heart$ca)
heart$thal = as.factor(heart$thal)
heart$target = as.factor(heart$target)
heart %>% ggplot(aes(age)) + geom_histogram()

# 3) 데이터타입들 상하위 5개 데이터확
str(heart)
head(heart, 5)
tail(heart, 5)

# 4) Unnamed : 0 열 삭제(원본에서 삭제)

# 5) AHD 변경, No = 0, Yes = 1
replace(heart$target, which(heart$target == "0"), "No")
replace(heart$target, which(heart$target == "1"), "Yes")

# 6) 통계요약
summary(heart)

# 7) 누락된 값 있는 행삭제
na.omit(heart)
# 8) 나이의histgram 확인
 
# 9 성별에 대한 pie plot(백분율로 표시) table() : 데이터의 빈도를보ㅂ여줌
heart$sex = as.factor(heart$sex)
sex = table(heart$sex) # 빈도
sexden = prop.table(sex) # 백분률

pie(sexden, radius = 1, labels = c('Female', 'Male'), clockwise = T, main = '성별에 대한 pie plot', col = c('red','blue'))
legend("top", pch = '■', col = c('red', 'blue'), legend = sexden)

# 10) ChestPain에 대한 카운트 bar chart
heart$cp = as.factor(heart$cp)
chestpain = table(heart$cp)

heart %>% ggplot(aes(heart$cp)) + geom_bar() + labs(title = "ChestPain에 대한 Count", x = "ChestPain")

# 11) 나이와 최대심박수, 나이와 혈압과의 관계확인
cor(heart$age, heart$thalach) # 나이와 최대심박수
cor(heart$age, heart$trestbps) # 나이와 혈압
heart %>% ggplot(aes(age, thalach)) + geom_point()
heart %>% ggplot(aes(age, trestbps)) + geom_point()

# 12) 심장병과 상관관계가 높은 속성중 4개만 선택하여 관계분석
# 상관관계가 높다 == [1] 과 가깝다 (cortarget) -1 ~ 1
# 1과 가까운 cor값을 구하기위해 abs를 구해 내림차순 정렬 >  order(abs(cortarget), decreasing = T)
# order를 사용하여 인덱스를 구했으므로 데이터프레임을 위 기준으로 heart 데이터프레임을 정렬 heart[ordercor]
# 정렬한 데이터프레임의 2~5행추출 == top4 / 1부터 구하지 않는이유? 1은 target이므로
# top4의 데이터프레임을 pairs로 그린다.

(cortarget = cor(heart$target, heart))

(ordercor = order(abs(cortarget), decreasing = T))
(heart[ordercor])
(heart[ordercor])

(top4 = heart[ordercor][2:5]) 

pairs(top4, title = '심장병과 상관간계가 높은 속성 Top4') # 심장병 x = 0 심장병 o = 1
str(top4) 
# exang : (운동유발협심증 1=yes; 0=no)
# cp : (흉통유형 0= 전형적인 협심증, 1=비정형, 3=비협심증 4=무증상)
# oldpeak : (st우울증)
# thalach : (maxinum heart rate)
 
# 13) 4개특징의 분포확인(boxplot)
# 4개의 분포데이터의 ylim이 다르기 때문에 데이터가 큰 값을 기준으로 boxplot이 ylim이 결정
# exang cp 의 경우 범주형을 위한 데이터이기이때문에 boxplot값 의미 x
###############
# 데이터프레임의 3가지 열접근방법
class(top4$'thalach') # integer
class(top4[,c(4)]) # integer
class(top4[,c('thalach')]) # integer
class(top4['thalach']) # data frame
class(top4[4]) # data frame
###############

hist(top4[,4])
boxplot(top4[4])
boxplot(top4)
top4 %>% ggplot(aes(heart$target, top4[,3], group = heart$target)) + geom_boxplot() + labs(title = "심장병 유무별 우울증지수 분포")
top4 %>% ggplot(aes(heart$target, top4[,4], group = heart$target)) + geom_boxplot() + labs(title = "심장병 유무별 최대심박수 분포", x = '심장병 유무', y = '최대심박수')

# 14) tartget(AHD)을 기준 최대 최소 평균 표준편차 계산
?summarize_all
(top4[c(3,4)] %>% 
  group_by(heart$target) %>%
  summarise_all(list(max = max, min = min, mean = mean, sd = sd)))


