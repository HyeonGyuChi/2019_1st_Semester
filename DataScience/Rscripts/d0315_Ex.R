#연습문제(2) == 실습 #2.배열연습
#20155342 지현규

# 3) @@@ 연습문제(2) 해결 @@@

#1) 짝수,홀수처리
  # 1-10사이의 홀수 짝수벡터 생성
(odd = seq(1,10,2))
(even = seq(2,10,2))

  # odd와 even벡터 결합
(total = c(odd, even) )

  # sorting
(stotal = sort(total))

  # stotal 벡터에서 짝수의 제외
(newEven = setdiff(stotal, even))

#2) 5명의 BMI처리
height = c(1.6,1.7,1.8,1.76,1.85)
weight = c(67,78,46,78,50)

print("몸무게")
mean(weight) #평균
sd(weight) #표준편차
max(weight) #최대
min(weight) #최소
median(weight) #중앙값

print("키")
mean(height) #평균
sd(height) #표준편차
max(height) #최대
min(height) #최소
median(height) #중앙값
(BMI = weight / (height^2)) #BMI 계산

#BMI 23 이상 == 정상
(BMI > 23)

#@@@ Report #2. 행렬연습 == 연습문제 (3) @@@

BMI = matrix(data = NA,nrow = 5, ncol = 2)
names = c("hong", "kim", "park", "jin", "han")
inform = c("height", "weight")
# 행렬의 이름 설정 (행:성명,열:키,몸무게)
rownames(BMI) = names
colnames(BMI) = inform
# 행렬에 데이터 입력
BMI[,1] = c(1.6,1.7,1.8,1.76,1.85)
BMI[,2] = c(67,78,46,78,50)

#키와 몸무게 평균,표주편차,최대,최소,중앙값 계산
(avg = apply(BMI, 2, mean))
(sd = apply(BMI, 2, sd))
(max = apply(BMI, 2, max))
(min = apply(BMI, 2, min))
(median = apply(BMI, 2, median))
