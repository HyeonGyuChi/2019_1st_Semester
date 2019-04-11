# #0405
# dplyer를 이용하여 테이터 처리

library(dplyr)
# 파이프 사용 : x %>% f(x)

iris %>% head
iris %>% head(10)

# 행정렬(-내림차순) 오름차순은-빼주기
arrange(iris, -Sepal.Length)
iris %>% arrange(Sepal.Length, Sepal.Width) # 첫번째로 Sepal.lenth로 오름차순 정렬 > 똑같은 경우 > Sepal.Width로 오름차순정렬

# select : 열(속성) 선택
select(iris, Sepal.Length, Sepal.Width)
iris %>% select(Sepal.Length, Sepal.Width)

#filter : 조건에 따른 데이터 선택
d1 = filter(iris, Species == 'setosa')
iris %>% filter(Species == 'setosa')

#mutate : 속성값을 반환하거나 새로운 속성설정
iris %>%
  mutate(SepalRatio = Sepal.Width/Sepal.Length,
         PetalRatio = Petal.Width/Petal.Length)

#sample_n, sample_frac : 랜덤샘플링
sample_n(iris,10)
sample_frac(iris,0.01) # 

#distinct : 고유행 검색
distinct(select(iris, Sepal.Width))

#group_by : 데이터를 그룹으로 나눈 후 연산 적용,
# group_by + summarized 
iris %>%
  group_by(Species) %>%
  summarize(median(Sepal.Width),
            median(Petal.Width))

iris %>% # summurize_all은 모든 열값에 대한 median값 summurize가능
  group_by(Species) %>%
    summarize_all(median)

# 실습6. 데이터처리 연습문제 4번 6번dplyr로 적용해서해보기 
# 4)
iris %>%
  group_by(Species) %>%
  summarise_all(max)

iris %>%
  group_by(Species) %>%
  summarise_all(min)

iris %>%
  group_by(Species) %>%
  summarise_all(sd)

iris %>%
  group_by(Species) %>%
  summarise_all(mean)

# 6) Petal.Length로 정렬, 같으면 Peral.Width로 정렬
iris %>%
  arrange(Petal.Length, Petal.Width)
