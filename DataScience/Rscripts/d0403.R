data(sleep) # 내장데이터 가져오기
str(sleep) # sleep구조확

#split > 그룹화된 변수(factor)를 분리 = 데이터프레임의 factor별로 분리됨
g  = split(sleep, sleep$group) # group로 분리하여 리스트로 반환
# 즉 group은 factor이고 그 범주형별로 분리하여 리스트로 반환

str(g)
g$'1' # g는 ['1','2']이고 g에 '1'의 이름을 가진 인덱스에 접근 == group 1의 데이터프레임을 접근
names(g) = c("G1,", "G2") #리스트명 변

# 이렇게 어떤 그룹화된 데이터를 쪼개서 볼수 있는데
# 그룹화된 데이터별로 단일변수(다른 하나의 열)에 함수를 적용하고싶을때

tapply(sleep$extra, sleep$group, mean) #그룹별 초과시간의 평균

d1 = read.table("data3.txt", header = T, skip = 1)
str(d1)

tapply(d1$age, d1$btype ,mean) # 혈액형 별 평균나이

# 이번엔 다중변수(열이 여러개)에 적용해보자!
aggregate(d1[,c(3:5)], list(bytpe=d1$btype), mean) #혈액형별 키, 몸무게, 나이의 평균

# 조건검색 which
which(d1$name=="park") # 조건을 만족하는 위치 값
i1 = which(d1$btype == "B") # d1의 블러드타입이 B인 인덱스 값을 리스트로 받음
d1[i1,]  # 받은 리스트를 데이터프레임의 행부분에 적용해 혈액형이 B인 d1목록 확인

i4=which(d1$age >= 25 | d1$height >= 170) # 나이가 25세 이상이거나 키가 170 이상
d1[i4,]
maxa = which.max(d1$age) # 최대나이
d1[maxa,]

# NA처리
ad1 = c("park", NA, 177.8, 78.4, 23)
ad2 = c("jung", "B", NA, NA, 27)
d2 = rbind(d1, ad1, ad2) #NA값을 가진 2개의 행을 d1에 추가하여 d2생성

is.na(d2) # NA여부 확인
i = which(is.na(d2$btype)) #혈액형이 NA인 경우
d2[i,]

na.omit(d2) #na.omit, NA값이 있는 행 제거

# 데이터 정렬
d1$age
sort(d1$age) # 데이터를 정렬하여 반환
ageA = order(d1$age) # 데이터 오름차순 순서에 대한 인덱스 반환
d1[ageA, ]

ageHA = order(d1$age, d1$height) # 먼저 age로 오름차순 정렬 / 만약 같은 값이있다면 height기준으로 정렬
d1[ageHA, ]

# Sampling
set.seed(1) # seed를 설정해주어 앞으로 사용할 sample함수는 이 seed를 기준으로 같은 인덱스의 값을 뽑게됨
# 만약 설정을 안해주면 sample은 time(현재시간)으로 seed를 설정해주어 매번 다른데이터를 추출하게 된다.

x = 1:10 
sample(x,size=10,replace=TRUE) # 중복 O

sample(x,size=10,replace=FALSE) # 중복X , 즉 같은 값 추출 X
set.seed(1)
sample(x,size=10,replace=TRUE)
set.seed(1)
sample(x,size=10,replace=TRUE)
set.seed(1)
sample(x,size=10,replace=TRUE)
# set을 설정해주어 계속 같은 값을 뽑게됨