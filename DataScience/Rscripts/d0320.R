#List 값, 벡터, 행렬등을 하나의데이터집합으로 관리하는 구조
#연관배열구조 : (키,값) 형태의 데이터로도 생성가능
#list()로 생성
(x=list(1:5, c(T,F,T), "good day", matrix(1:6, ncol = 2)))

# 키. 값 형태로 생성
(y=list(name="hong", height = 179, weight = 77, score = c(100,50,80)))
y[1] #1성분 리스트 접근
y$name #name성분 접근 (인덱스나 키값으로 접근 가능)
y$age = 20 #age추가

(x=list(1:5, c(T,F,T), "googd day"))
# 리스트 요소로 접근되어 추출
x[[1]]
x[[1]][2] # 1성분요소의 2요소 추출
# 리스트의 성분 서브리스트 추출
x[1]
x[1:2] # 1,2 성분 추출

x[c(T,F,T)] #1,3 성분 추출
x[1] = list(5:9) #1성분 변경, list로 치환하여 변경
x

x[4:5] = list("happy day", c(10,20,30)) #4,5 성분에 리스트 추가
x

#list 결헙
(newlist = c(x,y))

#list를 벡터로 분리
unlist(newlist)
