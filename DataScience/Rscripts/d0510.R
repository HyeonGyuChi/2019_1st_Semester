data(iris)
library(dplyr)
library(ggplot2)
#1) 
species_mean = aggregate(iris[,c(1:4)], list(species = iris$Species), mean) # 평균
species_max = aggregate(iris[,c(1:4)], list(species = iris$Species), max) #최대
species_min = aggregate(iris[,c(1:4)], list(species = iris$Species), min) #최소
species_median = aggregate(iris[,c(1:4)], list(species = iris$Species), median) #중간값
species_sd = aggregate(iris[,c(1:4)], list(species = iris$Species), sd) # 표준편차
species_mode = aggregate(iris[,c(1:4)], list(species = iris$Species), mode) # 최빈값

class(species_mean[c(1,4)])

#2)
iris %>%
  ggplot(aes(x=Petal.Length, color = Species)) +
  geom_density()


#3) 

iris %>%
  ggplot(aes(Species, Petal.Length)) +
  geom_boxplot() + 
  ggtitle("종별 Boxplot")
  
#4)
g = split(iris, iris$Species)
setosa = data.frame(g['setosa'])

setosa = data.frame(iris[which(iris$Species == 'setosa'),])
setosa
q1 = quantile(setosa$Petal.Length, probs = 0.25)
q3 = quantile(setosa$Petal.Length, 3/4)
irq = q3 - q1
lw = q1 - 1.5*irq
uw = q3 + 1.5*irq

#5) 
boxplot(setosa$Petal.Length, main = "Setosa의 Petal.Lenth 분포")
(out = boxplot.stats(setosa$Petal.Length)$out)
(outi = which(setosa$Petal.Length %in% out))
plot(setosa$Petal.Length)
points(outi, out, pch ='V', col = 'red')

#6)
outindex = which(setosa$Petal.Length < lw | setosa$Petal.Length > uw)
outvalue = setosa$Petal.Length[outindex]
plot(setosa$Petal.Length)
points(outindex, outvalue, pch ='V', col = 'red')

#7 5번 6번과 함께 적용
