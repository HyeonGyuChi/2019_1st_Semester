''' # 20155342_지현규
5/17 실습과제
physicalfitness.txt을 이용하여 다음을 해결하여 제출하세요
(1) 나이그룹별 평균키에 대한 막대그래프

(2) 성별에 대한 평균몸무게 원그래프

(3)10대의 키와 몸무게에 대한 평균, 표준편차, 변동계수를 확인

(4)10대의  키와 몸무게에 대한  산점도(scater plot)와 상관계수 확인

(산점도 주제목에 상관계수 표시)

(5)전체 데이터의  키와 몸무게에 대한  산점도와 상관계수 확인

(산점도 주제목에 상관계수 표시)

(6)전체 데이터의  몸무게와 BMI에 대한  산점도와 상관계수 확인

(산점도 주제목에 상관계수 표시)

(7)height weight BMI bodyFat에 대한  산점도 행렬 그리기
'''

ph = read.table(file = 'physicalFitness.txt', header = T, sep = ",", skip = 3)
# cor(ph[1], ph[,])
head(ph)
# (1) 나이그룹별 평균키에 대한 막대그래프
age_height_mean = tapply(ph$height, ph$ageGroup, mean)
barplot(age_height_mean, legend.text = age_height_mean, col = c(1:7), names = c('10대', '20대', '30대', '40대', '50대','60대', '70대', '80대', '90대'))
title(main = "나이그룹별 평균키")

# (2) 성별에 대한 평균몸무게 원그래프
ph$sex = as.factor(ph$sex)
(sex_weight_mean = tapply(ph$weight, ph$sex, mean))
pie(sex_weight_mean, col = c("blue", "red"), labels = c('남','여'))
legend('right', legend = sex_weight_mean, col = c("blue", "red"), pch = "★")


#(3)10대의 키와 몸무게에 대한 평균, 표준편차, 변동계수를 확인 
teen = ph[which(ph$ageGroup == 1),] # 10대만 추출
m = sapply(teen[c('height', 'weight')], mean) # 10대의 키와 몸무게에 대한 평균
sd = sapply(teen[c('height', 'weight')], sd) # 표준편차
(cv = sd/m * 100) # 변동계수 : 평균을 중심으로 한 상대적인 산포의 척도
# 값이 클수록 산포도가 큼

# (4)10대의  키와 몸무게에 대한  산점도(scater plot)와 상관계수 확인
# (산점도 주제목에 상관계수 표시)

plot(teen$height, teen$weight, main = '10대에서의 키와 몸무게 산점도', xlab = '키', ylab = '몸무게')
title(sub = cor(teen$height, teen$weight))
# plot(teen$weight, main = '10대의 몸무게', xlab = '인원', ylab = '몸무게')
# plot(teen$height, main = '10대의 키', xlab = '인원', ylab = '키')
cor(teen$height, teen$weight) # 10대 키에 대한 몸무게 상관계수

# (5)전체 데이터의키 와 몸무게에 대한  산점도와 상관계수 확인
cor(ph$height, ph$weight) # 전체 키에 대한 몸무게 상관계수
plot(ph$height, ph$weight, main = '전체데이터', xlab = '키', ylab = '몸무게')
title(sub = sprintf("correlation : %.2f", cor(ph$height, ph$weight)))

# (6)전체 데이터의  몸무게와 BMI에 대한  산점도와 상관계수 확인
plot(ph$weight, ph$BMI, main = '전체데이터에 대한 몸무게 BMI의 산점도', xlab = '몸무게', ylab = 'BMI')
cor(ph$weight, ph$BMI)
title(sub = sprintf("correlation : %.2f", cor(ph$weight, ph$BMI)))

# (7)height weight BMI bodyFat에 대한  산점도 행렬 그리기
pairs((ph[c(3:6)]))