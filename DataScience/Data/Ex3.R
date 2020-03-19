# 실습3 list, dataframe 생성, 추출연습 #

# 1) 3명의 성명(name), 키(h), 몸무게(w)를 키로 하는 데이터를 벡터로 만들어 리스트를 생성

n = c('kim','min','jin')
h = c(155,180.4,178)
w = c(66.4, 70.8,76.4)

plist = list(name = n,height = h,weight = w)

# 2) 3명의 혈액형(bt)벡터를  1)리스트에 추가

plist$bt = c('A','B','AB')

# 3)두번째 키(h) 값을  169.5로 수정

plist$height[2] = 169.5
# == #
plist[[2]][2] = 169.5

# 4)앞에서 2개만 (성명, 키 성분) 추출

plist[c('name', 'height')]
# == # 
plist[1:2]

# 5)첫번째와 세번째 성분(성명,몸무게)만 추출

plist[c(1,3)]
# == #
plist[c('name', 'height')]


# 2) 5의 두 개의 데이터프레임을 생성하여 다음 조건을  처리

# (1)ID, password, name 데이터프레임 생성,  범주형이  아님

  # 1. data.frame 생성법 1

i = c('홍', '김', '박', '이', '수')
pw = c('1','2','3','4','5')
n = c('홍이', '김나', '박라', '이랑', '수지')

d1 = data.frame(ID = I(i), password = I(pw), name = I(n)) # !factor = I붙여주자

a = c(24,12,44,32,26)
m = c(100,200,130,24,302)

  # 2. matrix 만들고 rownames() 주고 data.frame으로도 가능(그러나 matrix가 모든 통일된 데이터형이라적용힘듬)

colnames = c('ID', 'age', 'mileage')
temp = cbind(i,a,m) # dataframe 끼리도 가능
colnames(temp) = colnames # matrix는 row.col names()
d2 = data.frame(temp) # dataframe의 경우 names()
d2['age'] = as.numeric(as.character(d2$age)) # numeric factor 바꿀때 주의
d2$mileage = as.numeric(as.character(d2$mileage))

table = merge(d1,d2) # merge는 데이터프레임끼리 같은 obj(행)에 한에 같은 이름을 가진 행이 있을경우 첫번째 데이터로 초기화
table = cbind(d1,d2[,-1]) #위와 같은 의미, cf. dataframe(d1,d2) 의 경우 같은이름이 있는 행이 있는 경우 새로 만듬

# (3)(2)에서 나이가 20미만만 추출

q1 = subset(table, age<20) # 원하는 조건으로 데이터 추출 subset

# (4)(2)에서 mileage 가 100~200 사이만 추출 

q2 = table[table$mileage <= 200 & table$mileage >= 100,] # [행,열] 가운데, 주의!
# Tip Dataframe의 경우 names가 있기때문에 data[조건식,c("age","height")] 열을 이렇게 접근하면 편함

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