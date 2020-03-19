# DataFrame 연습문제 #


i = c('홍', '김', '박', '이', '수')
pw = c('1','2','3','4','5')
n = c('홍이', '김나', '박라', '이랑', '수지')


d1 = data.frame(ID = I(i), password = I(pw), name = I(n))

a = c(24,12,44,32,26)
m = c(100,200,130,24,302)

colnames = c('ID', 'age', 'mileage')
temp = cbind(i,a,m)
colnames(temp) = colnames

d2 = data.frame(temp)
d2['age'] = as.numeric(as.character(d2$age))
d2$mileage = as.numeric(as.character(d2$mileage))

table = merge(d1,d2)
table = cbind(d1,d2[,-1])

q1 = subset(table, age<20)
q2 = table[table$mileage <= 200 & table$mileage >= 100,]

ammean = sapply(table[,c(4,5)], mean)
b = c('A','A','O','AB','B')
table$bloodtype = b
s = c('m','m','f','m','f')
table$sex = s

table$sex = as.factor(table$sex)
table$bloodtype = as.factor(table$bloodtype)
str(table)


table[table$sex == 'f',]
sapply(table[table$sex == 'f',c('age', 'mileage')], mean)
sapply(table[table$age >= 30 & table$age < 40, c('mileage')], sum)
sum(table[table$sex == 'f',c('mileage')])


# DataSet 연습문제 #

data(iris)
str(iris)

attach(iris)
detach(iris)

setwd('C:/Users/HyeonGyu/Desktop/2019_1/DataScience/Data')

eros = read.csv ('heroes_information.csv', header = T, sep = ',', stringsAsFactors = F, nrows = 200)
str(heros)
names(heros)
heros$X = NULL
str(heros)

head(heros, 10)
heros$Publisher = as.factor(heros$Publisher)
heros$Gender = as.factor(heros$Gender)
row.names(heros)
na.omit(heros)
heros[heros$Gender == 'Male',c('Race')]

write.table(heros, "herosFix.txt", sep = " ", quote = F, append = 'F')

# 실습 5 dataProc 연습문제 #

# iris  dataset을 이용하여 다음을 처리
data(iris)
# (1)Sepal.width가  평균보다 큰 것 확인
Q1 = subset(iris, iris$Sepal.Width > mean(iris$Sepal.Width)) # subset 사용
Q1 = iris[iris$Sepal.Width > mean(iris$Sepal.Width),] # [,] 사용
Q1 = iris[which(iris$Sepal.Width> mean(iris$Sepal.Width)), ] # which사용

# (2)Petal.Length가   3~5범위  확인
Q2 = which(iris$Petal.Length >= 3 & iris$Petal.Length <= 5)
iris[Q2,] # which로 사용시 인덱스 return 주의!

# (3)Petal.width가  중간값보다 작은 것 확인 > 위와같이 하자! 만약 각 행의 median을 구하고싶다면
Q3 = sapply(iris[,-5], median)

# (4) Species 별로  최대, 최소, 평균, 표준편차  계산

  # 1. aggregate() 사용
Q4 = aggregate(iris[,-5], list(iris$Species), max)
Q4 = aggregate(iris[,-5], list(iris$Species), min)
Q4 = aggregate(iris[,-5], list(iris$Species), mean)
Q4 = aggregate(iris[,-5], list(iris$Species), sd)

  # 2. Species별로 Petal 관한 부분의 최대값을 계산하고싶다!
Q4 = aggregate(iris[,c('Petal.Width', 'Petal.Length')],list(iris$Species),max)
  
  # 3. Petal.Width만 구하고싶다면(단일변수)
Q4 = tapply(iris$Petal.Width, iris$Species, max)

# (5) Sepal.width 의  order 확인 

Q5 = order(iris$Sepal.Width)
iris[Q5,]

# (6) Petal.Length 로 정렬,  같으면 Petal.Width 로 정렬
Q6 = iris[order(iris$Petal.Length, iris$Petal.Width), ]

# (7) Species(종)로 분리
Q7 = split(iris, iris$Species) # 틀린문법주의 > split(iris$Species)
# Q7 > List of 3 각 원소들의 리스트 이름이 factor의 이름

# (8) Species(종) 별로 10개씩  추출   (상위 10개)
names(Q7) # [1] "setosa"     "versicolor" "virginica"

Q8_1 = head(Q7$setosa, 10)
Q8_2 = head(Q7$versicolor, 10)
Q8_3 = head(Q7$virginica, 10)

# with 사용시 주의 with(데이터명, {조건}) / 중간에 ,꼭 넣기!
with(Q7,{
  head(setosa)
  head(versicolor)
  head(virginica)
})

# (9)(8)에서 추출된 것을  iris2로 결합
Q9 = rbind(Q8_1, Q8_2, Q8_3)
Q9
