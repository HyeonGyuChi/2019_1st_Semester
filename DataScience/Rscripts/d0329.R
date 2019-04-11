# 파일 읽기연습
t1 = read.table("C:/Users/HyeonGyu/Desktop/DataSience/data3.txt", head = T, sep = "", stringsAsFactors = FALSE, skip = 1)
t2 = read.csv("C:/Users/HyeonGyu/Desktop/DataSience/data.csv", head = T)

# Sleep데이터 확인 (구조,상위)
data(sleep)
str(sleep)
head(sleep)

objects()
# sleep 현재 작업공간에 저장
setwd("C:/Users/HyeonGyu/Desktop/DataSience")
save(sleep, file = "sleep.Rdata")

#작업공간 삭제
rm(list=ls())

#sleep작업공간 로
load("sleep.Rdata")

#sleep 객체를 sleep.txt.로 저장 ( 파일로저장 )
write.table(sleep, "sleep.txt", quote = F)

d1 = read.table("sleep.txt", header = T)


