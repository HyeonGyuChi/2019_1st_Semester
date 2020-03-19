실습 #6. 데이터 처리 dataProc_2 연습문제

#replace
d3 = read.table('data3.txt', header = T, sep = '', stringsAsFactors = F, skip = 1)
d3$btype = as.factor(d2$btype)

ad2 = c("jung", "B", NA, 89, 27)
d2 = rbind(d3, ad2)
replace(d2$name, which(d2$name=="hong"), "hong2")
replace(d2, which(is.na(d2)), 0) # ? 왜 안대지 colomn오류남 ㅠ

# 1. dplyer를 이용한 데이터 처리예제 확인
library(dplyr)
# 파이프사용: x %>% f(x)
iris %>% head #head(iris)
iris %>% head(10)

#행정렬
arrange(iris, -Sepal.Length) #Sepal.Length 역순정렬
iris %>% arrange(Sepal.Length, Sepal.Width) #Sepal.Length 가같다면Sepal.Width순으로정렬

#select : 열(속성) 선택
select (iris,Sepal.Length,Sepal.Width )
iris %>% select(Sepal.Length,Sepal.Width ) 
# == #
iris[,c('Sepal.Length', 'Sepal.Width')]

#filter : 조건에따른데이터선택
d1 = filter(iris, Species == 'setosa')
# == #
d1 = iris[which(iris$Species == 'setosa'), ]


#mutate : 속성값을변환하거나새로운속성설정
iris %>%
  mutate(SepalRatio = Sepal.Width/Sepal.Length,
         PetalRatio = Petal.Width/Petal.Length)

#sample_n, sample_frac : 랜덤샘플링
sample_n(iris, 10)
sample_frac(iris, 0.01) # 0.01% 즉, 150개중 1.5개 이므로 > 2개추출(반올림)

#distinct : 고유행검색
distinct(select(iris, Sepal.Width))

#group_by : 데이터를그룹으로나눈후연산적용,
#group_by + summarize
iris %>%
  group_by(Species) %>%
  summarize(median(Sepal.Width, Sepal.Length),
            median(Petal.Width, Petal.Length))

# 2.iris  dataset을 이용하여 dplyer 라이브러리로 다음을 처리

# (1) Species 별로  최대, 최소, 평균, 표준편차  계산
# group_by(), summarize_all() 이용

iris %>%
  group_by(Species) %>%
    summarise_all(max)

iris %>%
  group_by(Species) %>%
    summarise_all(min)

# (2) Petal.Length 로 정렬,  같으면 Petal.Width 로 정렬
iris %>%
  arrange(Petal.Length, Petal.Width)
# == #
iris[order(iris$Petal.Length, iris$Petal.Width),]
