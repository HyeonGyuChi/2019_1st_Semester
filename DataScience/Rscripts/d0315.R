#연습문제(2) == 실습 #2 배열연습
#20155342 지현규

#@@@ 1) vector 생성, 요소접근 예제확인 @@@

# 벡터생성방법
# c(목록나열) = 요소나열로 벡터생성
c(10,20,30,40,50) 
c(T,T,F,F,T)
c('a', 'b', 'c')
# 연속값으로 생성 = 시작값 : 최종값
1:5 # 1씩 증가하는 연속값
10:20
# 시작값에서 증가치 만큼 최종값으로 생성 = sep(시작 값, 최종 값, 증가치)
seq(1,5)
seq(1,10,2)
# 특정 값들이 회수만큼 반복된 형태로 생성 = rep(벡터, 회수)
# rep(백터. each = 횟수) : 벡터의 요소각각을 회수만큼반복
rep(1:3, 2) # 1-3까지 2회반복
rep(c('a','b','c'), 3)  #'a' 'b' 'c' 3회 반복
rep(1:2, each = 3) # 1:2 각각 3회 반
(a=1:5) #a백터생성 ()로 결과확인 (== 가로안에 변수를 넣으면 print됨)

#백터 생성, x에 저장
x <- c('a', 'b', 'c')
#벡터요소 접근
#단일요소 접근 : 벡터명[인덱스]
x[1]
x[3]
#특정요소 제외접근 : 벡터명[-인덱스]
x[-1]
x[-2]
# 여러 요소접근
#벡터명[벡터]
x[c(1,2)]
x[c(1,3)]
#벡터명[시작인덱스:끝인덱스]
x[1:2]
x[1] = "e"
#벡터결합
# 벡터에 값 추가 : c(벡터, 값)
(y=c(x, 'd')) 
#벡터에 벡터결합 : c(벡터, 벡터)
(z = c(x,c('d','e','f')))
#중복요소 제거 = unique(벡터)
unique(z) #e가 두개이므로 중복제거

#@@@ 2) vector 연산, 함수에 대한 예제결과 확인 @@@

#벡터산술연산
(a = 1:5)
(b = 11:15)
(a1 = a-1) # a벡터의 각 요소에서 1을 뺀 연
(sum = a+b) # a와 b벡터의 각 요소 연산
(sub = a-b)
(mul = a*b)
(div = b/a)
round(div) #div벡터의 각 요소 반올

#벡터비교연산 = 벡터의 요소수가 서로 같아야 함 -> T F로 이루어진 vector로 반환
(a>4) #a의 요소가 4보다 큰 값인가 
(eq = (a==b)) # a의 b의 요소가 같은가
(neq = (a!=b)) # a의 b의 요소가 다른
(l=(a<b)) #a의 요소가 b의 요소보다 작은
(l=(a>b)) #a의 요소가 b의 요소보다 큰가

#벡터 집합연산
(u = union(a,b)) #합집합
(intersect(u,b)) #교집합
(d=setdiff(u,b)) #차집
setequal(a,d) #같은 집합인가

#요소 k는 집합 a에 속하는가
k=3
is.element(k,a)
k %in% a  

#벡터함수
#벡터함수예
# 5명의점수
score = c(60, 100, 50, 80, 89)
length(score) # 벡터의길이
max(score) #최대값
min(score) #최소값
mean(score) #평균
sd(score) #표준편차
median(score) #중앙값
sort(score) #요소정렬
rank(score) #각요소의순위

#@@@ 4) 행렬예제확인 @@@

#행렬(Matrix)생성
#2차원 형태의 행과 열로 구성된 집합구조
# martix(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL)
# data : vector, nrow : 행개수, ncol : 열개수, byrow : 행우선, dimnames : 행렬이름
matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3)
matrix(1:9, ncol = 3)
# 값을 안넣으면 열우선생성 / byrow = T 행우선!
matrix(seq(1,9), nrow = 3,  byrow = T)

#값이 없는(NA) 3행 1열 행렬
matrix(, nrow = 3)
# 제로행렬(4x3)
matrix(0, nrow=4, ncol = 3)
#1:4값 4x3열 우선행렬, 값 반
matrix(1:4, nrow=4, ncol = 3)

#행렬의 각 요소는 '행렬이름[행인덱스, 열인덱스]로 접근
(x = matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, byrow = T))
x[1,2] # 1행 2열 요
x[1:2, 2] # 1-2행 2열 요소
x[,2] #모든행의 2열요소
x[2,] #3행 모든 열 요소
x[3, 2:3] # 3행 2-3열 요소
x[-2,] #2행을 제외한 모든 3열 요소
x[c(T,F,T), 2] # 1행, 3행에 대한 2열요소
x[c(1,3), 2] # 1행, 3행에 대한 2열요소
x[1:5] #행렬을 벡터로 변환하고 1-5번째 요소 추출

#행렬의 각 요소와 산술연산
#행렬 곱 : %*%
#행렬연산
x+5 #x요소에 5를 더한결과
x*2 #x요소에 2를 곱한결
(y=x) #x행렬로 y행렬 생
x+y #x와 y행렬 각 요소 더하기
x-y #x와 y행렬 각 요소 빼기
x*y #x와 y행렬 각 요소 곱하기
x%*%y #x와 y 행렬곱

#백터나 행렬을 결합하여 새로운 행렬생성
(rx = rbind(1:3, 4:6, c(7,8,9))) #rbind() : 행단위로 결합
(cx = cbind(1:3, 4:6, c(7,8,9))) #cbind() : 열단위로 결합

#행렬함수
(x=matrix(1:9, nrow = 3, byrow = T))
dim(x) #행렬크기
nrow(x) #행렬의 행의개수
ncol(x) #행렬의 열의 개수
t(x) #x행렬의 전치행렬
diag(x) #x행렬의 대각성분만 추출
diag(x) = 4 #x행렬의 대각성분을 4로 설정
x
diag(1,5) #대각성분 1인 단위행렬

#행렬이름(label)
#성적처리 예
rnames = c("hong", "min", "kim") #행이름 벡터
cnames = c("kor", "eng", "mat") #열이름 벡터
(score=rbind(c(100,80,90),c(50,70,80),c(90,99,96))) #점수벡터 생성
rownames(score) = rnames #행이름 설정
colnames(score) = cnames #열이름 설정
score
score["hong", "eng"] #hong행의 eng열 요소
rownames(score) = NULL # 행 이름 제거
colnames(score) = NULL # 열 이름 제거
dimnames(score) = NULL # 행열이름 모두제거

#행렬에 함수적용 : apply()
#apply(X, MARGIN, FUN, ...)
#(X : 배열, MARGIN : 1(row)/2(column) FUN:함수)
(sum = apply(score, 2, sum))
(avg = apply(score, 2, mean))
(max = apply(score, 2, max))
(min = apply(score, 2, min))

#개인별 총점 평균 최대최소
(sum = apply(score, 1, sum))
(avg = apply(score, 1, mean))
(max = apply(score, 1, max))
(min = apply(score, 1, min))

#배열(Array)은 n차원 행렬
#생성방법
# array(벡터, dim = c(행수, 열수, 면수))
# 요소접근(배열명[행인덱스, 열인덱스, 면인덱스])

#3x4 array
matrix(1:12, ncol = 4)
array(1:12, dim = c(3,4))

(x=array(1:12, dim = c(2,2,3))) #2x2x3 array
x[1,1,1] #1행 1열 1면
x[1,,] #1행의 모든 열과 면
x[,,1] #1 면의 모든 행열
