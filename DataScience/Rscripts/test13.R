data(iris)
str(iris)

'''
iris 데이터를 이용하여 기술 통계값을 확인
(1)iris의 종별 최소값, 최대값, 평균, 중간값, 표준편차
최빈값(사용자정의함수)
(2)각 종(setosa", "versicolor","virginica") 에 대한 Petal.Length의 밀도함수
(3) 각 종(setosa", "versicolor","virginica") 에 대한 Petal.Length의  box plot
(4)setosa의 Petal.Length에 대한 1사분위, 3사분위, IRQ, lower whisker, upper whisker , 최빈값
(5)setosa의 Petal.Length에 대한 boxplot , , boxplot.status 로 outlier 확인
(6)setosa의 Petal.Length에 대한 lower whisker, upper whisker로 outlier  확인
(7)setosa의 Petal.Length에 대한 outlier , plot에서 표시
'''

# 1) iris의 종별 최소값, 최대값, 평균, 중간값, 표준편차
aggregate(iris[,c(-5)], list(iris$Species), min)
aggregate(iris[,c(-5)], list(iris$Species), max)
aggregate(iris[,c(-5)], list(iris$Species), mean)
aggregate(iris[,c(-5)], list(iris$Species), median)
aggregate(iris[,c(-5)], list(iris$Species), sd)

# 2) 각 종에 대한 Petal.Length의 밀도함수
species = split(iris, iris$Species)
oldpar=par(mfrow=c(1,3))
plot(density(species$setosa$Petal.Length))
plot(density(species$versicolor$Petal.Length))
plot(density(species$virginica$Petal.Length))
par(oldpar)

# 3) 각 종에대한 Petal.Length boxplot
with(species,
     {boxplot(setosa$Petal.Length, versicolor$Petal.Length, virginica$Petal.Length
              ,names = names(species), main = "각 종별 Petal.Length")
     })

# 4) setosa의 Petal.Length에 대한 1사분위, 3사분위, IQR,lw, uw, 최빈값
setosa = species$setosa # 편하게 작성하기 위해 setosa만 추출
q1 = quantile(setosa$Petal.Length, probs = 0.25) # 1사분위
q3 = quantile(setosa$Petal.Length, 3/4) # 3사분위
iqr = q3-q1 # IQR > 추후 이상값 계산
lw = q1 - 1.5*iqr # Lower whisper
uw = q3 + 1.5*iqr # Upper whisper
mode = table(setosa$Petal.Length)[which.max(table(setosa$Petal.Length))] # 최빈값
mode = as.numeric(names(mode)) # table > which.max로 검색된 색인가져오기

cat("<setosa$Petal.Length> \n q1 : ", q1, "\n q3 :", q3, "\n iqr :", iqr, "\n lw :", lw, "\n uw :", uw, "\n mode :", mode )

# 5) setosa의 Petal.Length.에 대한 boxplot, boxplot.stats로 outlier확인
out = boxplot.stats(setosa$Petal.Length)$out # outlier값 > 추후 y
out

outi = which(setosa$Petal.Length %in% out) # outlier값을 갖는 위치찾기  > 추후 x
outi

# 6) setosa의 Petal.Length에 대한 lw, uw로 outlier확인
outx = which(setosa$Petal.Length < lw | setosa$Petal.Length > uw)
outy = (setosa$Petal.Length)[outx]
(outy)
(outy)


# 7) outlier plot에 표시
# boxplot이용
plot(setosa$Petal.Length, main = "setosa$Petal.Lenth의 Outlier표시")
points(outi, out, pch = "V", col = c("red"))

# 직접계산이용
points(outx, outy, pch = "*", col = c("blue"))

###### 실습14
'''

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
py = read.table("physicalFitness.txt", sep = ",", header = T, skip = 3)

#1) 나이그룹별 평균키에 대한 막대그래프
# 나이 vector > factor
py$ageGroup = as.factor(py$ageGroup)
# 그룹별 평균키
age_height_mean = tapply(py$height, py$ageGroup, mean)
barplot(age_height_mean, main = "나이별 평균키", col = c(1:9))
legend("bottomright", legend = round(age_height_mean,2), pch = "■", col = c(1:9))

#2) 성별에 대한 평균몸무게 원그래프
py$sex = as.factor(py$sex)
# 성별 평균몸무게
sex_weight_mean = tapply(py$weight, py$sex, mean)
pie(sex_weight_mean, label = paste(round(sex_weight_mean, 2), "kg"), col = c("blue", "red"), main = "성별 평균몸무게")
legend("bottomleft", legend=c("남", "여"), col=c("blue","red"), pch = "■")

#3) 10대의 키와 몸무게에 대한 평균, 표준편차, 변동계수를 확인
# 10대만 추출
ag = split(py, py$ageGroup)
teens = ag$"1"
# 변동계수 확인을 위해 평균, 표준편차 구함
# 단위가 다른 두 자료집단에 대한 산포의 척도를 비교하기 위해 변동계수 확인
# 변동계수 ↑ == 산포도 ↑ == 평균을 중심으로 많이 흩어져있다. 평균을 중심으로 데이터의 퍼짐정도가 크다

teens[,c("weight", "height")]
teens_mean= apply(teens[,c("weight", "height")], 2, mean)
teens_mean

teens_sd = apply(teens[,c("weight", "height")], 2, sd)
teens_sd

teens_cv = teens_sd / teens_mean * 100 # 평균에 대한 표본편차의 비율
teens_cv # height 가 평균을 중심으로 더 모여있다.

####### 그래프 비교
oldpar = par(mfrow=c(1,2))
plot(density(teens$height), main = "height density")
abline(v = mean(teens$height))

plot(density(teens$weight), main = "weight density")
abline(v=mean(teens$weight))

par(oldpar)

plot(teens$height, teens$weight)
abline(v=mean(teens$height),h = mean(teens$weight))

#4) 10대의 키와 몸무게에 대한 산점도와 상관계수 확인
with(teens,{
  teens_cor_hw = cor(height, weight)
  plot(height, weight, main =paste("10대의 키에 대한 몸무게 산점도 // 상관계수 : ",round(teens_cor_hw, 5)))
})

#5) 전체 데이터의 키와 몸무게에 대한 산점도와 상관계수 확인
with(py,{
  py_cor_hw = cor(height, weight)
  plot(height, weight, main =paste("전체데이터의 키에 대한 몸무게 산점도 // 상관계수 : ",round(py_cor_hw, 5)))
})

#6) 전체 데이터의 몸무게와 BMI에 대한 산점도와 상관계수 확인
with(py,{
  py_cor_wb = cor(weight, BMI)
  plot(weight, BMI, main =paste("전체데이터의 몸무게에 대한 BMI 산점도 // 상관계수 : ", round(py_cor_wb, 5)))
})

#7) height weight BMI bodyFat 에 대한 산점도 행렬
pairs(py[,c(-1,-2)])
