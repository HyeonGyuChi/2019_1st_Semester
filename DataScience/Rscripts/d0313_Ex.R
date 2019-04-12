# Report #1. 데이터준비 연습
# 20155342_지현규

# 1)
# iris 데이터 셋의 특징확인
str(iris)
# iris 데이터 셋의 통계요약
summary(iris)

# 2)
# 데이터 셋 csv로 저장
write.csv(iris, "iris_new.csv")
# csv파일 읽기
irisData = read.table("iris_new.txt", head = T, sep = ",")
# 상위 6줄
head(irisData)
# 하위 6줄
tail(irisData)
#iris 속성값 확인
IrisSpecies = irisData$Species
(IrisSpecies)

# 3) 데이터 추출, 결합
# Species가 setosa만 추출
setosa = irisData[irisData$Species == "setosa",]
# 꽃받침길이가 5이하인 데이터 추출
sepal_below5 = subset(irisData,Sepal.Length <= 5)
# 폭 속성, 길이 속성만 추출
irisWidth = irisData[,c(2,4)] # 폭
irisLenth = irisData[,c(3,5)] # 길이
# 폭, 길이속성 결합
irisWL = cbind(irisWidth, irisLenth)

