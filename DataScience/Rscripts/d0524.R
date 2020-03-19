# 20155342 지현규
?sleep
data(sleep)
'''
Data which show the effect of two soporific drugs (increase in hours of sleep compared to control) on 10 patients.
[, 1]	 extra	 numeric	 increase in hours of sleep <수면증감정도>
[, 2]	 group	 factor	 drug given <약의 종류>
[, 3]	 ID	 factor	 patient ID <환자ID>
10명의 환자에 대해 두가지 종류의 약을 먹고 수명증감정도를 데이터화
'''
str(sleep)
with(sleep,
     t.test(extra[group==1], extra[group ==2], paired = TRUE), conflevel=0.95)

sleep$extra[sleep$group==1] # 그룹 1의 수면시간 데이터
sleep$extra[sleep$group==2] # 그룹 2의 수면시간 데이터

'''
우리는 데이터를 통해 다양한 분석을 할 수 있고 그것을 통해 어떤 명제세 세울 수있다.
그 명제에 대한 참/거짓 여부를 검증하는것을 "가설검정"이라한다.

즉, 정의한 통계값에 대한 다양한 가설이 주어진 데이터에 의해 얼마나 지지되는지를 평가하ㅎ기위해
2가지 가설을 세우는데,
# 대립가설 = 우리가 증명하고자 명제
# 귀무가설 = 대립가설에 반대됨 즉, 부정하려는명제
이다.

여기서 우리는 만약 귀무가설이 기각된다면
대립가설은 True 일 것이라는 사실을 알 수있다.

R에서는 t.test()를 이용해 가설검정을 하는데, 표본의 개수에 따라 2가지 종류로 나눌 있 다.
# one sample t-test : 단일표본의 모평균 가설점겅
# two sample t-test : 서로 독립인 두 표본에서 평균비교 가설검정

t.test의 분석한 결과를 해석하기 위해
p-value 값이 0 = 귀무가설 / !0 = 대립가설이다.
하지만 p-value <= 유의수준 이라면
귀무가설을 기각하므로 대립가설이 채택되게 된다. 즉,우리가 증명하려는 것이 같다 라는 의미이다.

만약 p-value>유의수준이라면 귀무가설의 기각 실패로 통계적으로 유의하지 않다는 의미이다.

'''

'''
연습문제의 결과를 보자면 

귀무가설 = 그룹1과 그룹2의 수면제가 수면시간 증가에 효과가 없다.
대립가설 = 그룹1과 그룹2의 수면제가 수면시간 증가에 효과가 있다.

Paired t-test

data:  extra[group == 1] and extra[group == 2]

t = -4.0621, df = 9, p-value = 0.002833 
# 0.002833(p-value) < 0.05(유의수준 : 0.05) => 귀무가설 기각
귀무가설이 기각되었으므로 대립가설을 채택하여
# 그룹1 그룹2의 수면시간 증가에 효과 있다
alternative hypothesis: true difference in means is not equal to 0

95 percent confidence interval:
-2.4598858 -0.7001142
sample estimates:
mean of the differences 
-1.58 
# 신뢰구간 -2.45.. ~ 0.7001.. 사이에 있다면 신뢰할 수 있다.

'''
summary(sleep$extra)
sd(sleep$extra)


# 귀무가설 : group1의 수면제가 수면시간 증가에 효과가 없다.
# 대립가설 : group1의 수면제가 수면시간 증가에 효과가 있다.

with(sleep,
     t.test(extra[group==1], paired = FALSE, conflevel=0.95))
'''
	One Sample t-test

data:  extra[group == 1]
t = 1.3257, df = 9, p-value = 0.2176 # p-value > 0.05 이므로 귀무가설 기각 불가, 즉 유의차이가 없다
alternative hypothesis: true mean is not equal to 0
# p값이 0이아니므로 대립가설 but p-value > 0.05 이므로 귀무가설 기각이 불가
95 percent confidence interval:
-0.5297804  2.0297804
sample estimates:
mean of x 
0.75 
'''

with(sleep,
     t.test(extra[group==2], paired = FALSE, conflevel=0.95))
'''
	One Sample t-test

data:  extra[group == 2]
t = 3.6799, df = 9, p-value = 0.005076 # p-value < 0.05 == 귀무가설 기각
alternative hypothesis: true mean is not equal to 0
# 대립가설인 group2의 수면제는 수면시간 변동에 효과가 있다
95 percent confidence interval:
0.8976775 3.7623225
sample estimates:
mean of x 
2.33 

'''

sd(sleep$extra[sleep$group==1])
sd(sleep$extra[sleep$group==2])