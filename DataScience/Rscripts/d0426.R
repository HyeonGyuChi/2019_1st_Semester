# ggPlot

install.packages("ggplot2")
library(ggplot2)
data(iris)

ggplot(data = iris,
       mapping = aes(Sepal.Length, Sepal.Width))
# data = 데이터
# mapping = aes(x = x축, y = y축변수)

ggplot(data = iris, mapping = aes(Sepal.Length, Sepal.Width)) + 
  geom_point(colour = "red", pch = 2, size = 2)

# +로 함수와 함수를 연결! 

# 종별에 따른 색상지정
ggplot(iris, aes(Sepal.Length, Sepal.Width)) + 
  geom_point(aes(colour = Species))

# 종에 따른 색상지정, Petal,Width로 크기설정
ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
  geom_point(aes(colour = Species, size = Petal.Width))

# 팔레트로 색상지정
ggplot(iris, aes(x = Petal.Width, y=Petal.Length, fill = Species)) +
  geom_point(colour = 'white', shape = 21, size = 5) + 
  scale_fill_brewer(palette = 'Reds')

# 데이터셋의 종별 박스플롯
ggplot(iris, aes(Species, Petal.Length)) + 
  geom_boxplot() +
  ggtitle("Box Plot(iris)")

# 라벨링
ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
  geom_point(colour = 'red') +
  labs(title = '제목', subtitle = '부제목', caption = '주석', x = 'x축이름', y = 'y축 이름')

# ggplot 선그리기
ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
  geom_point(aes(colour = Species)) + 
  geom_hline(yintercept = mean(iris$Sepal.Width), colour = 'black', lty = 'dashed', size = 1) +
  geom_vline(xintercept = mean(iris$Sepal.Length), colour = 'black', lty = 'dashed', size = 1)

install.packages('gapminder')
library(gapminder)

install.packages('dplyr')
library(dplyr)

data(gapminder)

gapminder %>% 
  ggplot(aes(x = lifeExp)) + geom_histogram()


gapminder %>%
  ggplot(aes(x = gdpPercap)) + geom_histogram()

gapminder %>% ggplot(aes(x=gdpPercap)) + geom_histogram() + scale_x_log10()

gapminder %>% ggplot(aes(x=gdpPercap, y = lifeExp)) + geom_point() + scale_x_log10() + geom_smooth()

gapminder %>% filter(year == 2007) %>%
  ggplot(aes(gdpPercap, lifeExp)) + 
  geom_point(aes(size = pop, col = continent)) + scale_x_log10() + ggtitle("Gapminder data for 2007") 

# 실습

gapminder %>% filter(continent == 'Asia') %>%
  ggplot(aes(gdpPercap, lifeExp)) +
  scale_x_log10() + 
  geom_point(aes(colour = country, size = pop))
