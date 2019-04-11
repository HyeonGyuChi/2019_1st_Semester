#연습문제 iris dataset을 이용하여 다음을 처리


data(iris) # iris데이터 가져옴
str(iris) # iris 데이터 구조확인

iris$Species # Species의 데이터 확인 > Factor형으로 3개 (setosa, versicolor, virginica)

#1) Sepal.width가 평균보다 큰 것 확인
q1 = which(iris$Sepal.Width > mean(iris$Sepal.Width))
iris[q1,]

#2) Petal.Length가 3~5 범위 확인
q2 = which(iris$Sepal.Length >= 3 & iris$Sepal.Length <= 5)
iris[q2,]

#3) Petal.width가 중간값보다 작은 것 확인
q3 = which(iris$Petal.Width < median(iris$Petal.Width))
iris[q3,]

#4) Species별로 최대, 최소, 평균, 표준편차 계산
i = split(iris, iris$Species) # sepcies별로 분리 // (setosa, versicolor, virginica) 이름의 리스트 생성
# 각각 종별로 data프레임 생성

# 첫번째 방법
virginica = i$'virginica'
setosa = i$'setosa'
versicolor = i$versicolor

sapply(virginica[,-5],max) # 최소
sapply(virginica[,-5],min) # 최대
sapply(virginica[,-5],mean) # 평균
sapply(virginica[,-5],sd) # 표준편차

tapply(virginica)

# 두번째 방법 aggregate
aggregate(iris[,c(1:4)], list(Species = iris$Species), max) 
aggregate(iris[,c(1:4)], list(Species = iris$Species), min) 
aggregate(iris[,c(1:4)], list(Species = iris$Species), mean) 
aggregate(iris[,c(1:4)], list(Species = iris$Species), sd) 

#5) Sepal.width의 order 확인
order(iris$Sepal.Width)

#6) Petal.Length 로 정렬, 같으면 Petal.Width 로 정렬
order(iris$Sepal.Length, iris$Sepal.Width)

#7) Species(종)로 분리

#8) 각 종의 상위 10개 출력
head(virginica, 10)
head(setosa, 10)
head(versicolor, 10)

#9 ) 결합
iris2 = data.frame(virginica,setosa, versicolor)