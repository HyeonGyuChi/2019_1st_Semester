# 실습 #3_2) 과제 2

# 1 ID, password, name은 범주형이 아님
ID = c("h","m","p", "j", "c")
password = c("1h", "2m", "3p", "4j", "5c")
name = c("hong","min","park", "ju", "chi")
(t1 = data.frame(ID = I(ID), password = I(password), name = I(name)))

#2. ID age mileage 데이터프레임 생성
age = c(20,24,32,24,17)
mile = c(200,150,165,64,34)
(t2 = data.frame(ID = I(ID), age = age, mile = mile))

#3. 1 2결합
(mt = merge(t1,t2))

#4. 나이와 마일리지의 평균
sapply(mt[,c(4,5)],mean)

#5. 혈액형과 성별추가
mt$blood = factor(c('A', 'B', 'B', 'AB', 'O')) #순서없는 범주형으로 추가
mt$sex = factor(c("male", "male", "female", "male", "female")) #순서없는 범주형으로 추가

#6. 여성의 마일리지의 합 확인
femaleMile = subset(mt, sex == "female", c(mile)) #데이터프레임에서 여자만 추출
femaleSum = sum(femaleMile) # 추출한 데이터 sum
# sapply(mt[mt$sex == "female", 5], sum)
apply(femaleMile, 2, sum)

(sapply(subset(mt, sex == "female", c(mile), sum)) #데이터프레임에서 여자만 추출

#7. 30대의 평균 마일리지 확인
sapply(mt[mt$age >= 30 & mt$age < 40, 5], mean)

#8. 혈액형 A,B의 평균나이확인
sapply(mt[mt$blood =='A' | mt$blood == 'B', 5], mean)
