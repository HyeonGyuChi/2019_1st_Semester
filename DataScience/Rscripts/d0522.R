# 함수의 정의
add1 = function(x){
  cat("x=", x)
  return (x+1)
}

x = 10
x1 = add1(x)
cat("f1(",x,")=",x1)

# 복합문/단일문
add = function(x,y){
  z=x+y
  return(z)
}

z=add(100,200)
cat("100+200=", z)

add2 = function(x,y) x + y
cat("100+200=", z)

# 오류의 핸들링 > stop = 오류경고 주고 종료 / 경고 = 오류만 경고
mysquare1 = function(x)
{
  if(!is.numeric(x)) stop("not numeric!")
  return(x^2)
}

mysquare2=function(x)
{
  if(!is.numeric(x))
  {
    warning("not numeric!")
    return(NA)
  }
  return(x^2)
}

# 여러개의 return 값은 리스트를 사용하여 반환
mysquare3=function(x)
{
  if(!is.numeric(x))
  {
    warning("not numeric!")
    return(NA)
  }
  y = x^2
  return(list(input=x,output=y)) # return값 두개일경우 리스트이용
}

(mysquare3(2))

# 인수생략
add = function(x=1,y=1){
  z = x + y
  return(z)
  }

(add(10,20))
(add(10))
(add())

# 스코프
# 전역변수, 지역변수 이름동일 : 지역변수 접근 우선
# 변수사용시 기호에 따라 사용변수 변경
# = <- (지역변수) <<= (전역변수)

x = 10
myfun = function(y){
  x1 = x+y # 지역변수 x1
  x=x+y # 지역변수 x
  x<<-(x+y) # 전역변수 x
  cat("x1=", x1, "x=", x) # x이름 동일 > 지역변수 우선접근
  return(x)
}

x2 = myfun(100)
cat("x1=",x1) # 지역변수 접근불가
cat("x=",x)
cat("x2=",x2)

# 학점처리예제
grade=function(m){
  if(!is.numeric(m)){
    warning("숫자입력오류")
    return(NA)
  }
  if(m<0|m>100){
    warning("점수범위(0-100)입력오류")
    return(NA)
  }
  if(m>=90)
    return("A")
  else if(m>=80)
    return("B")
  else if(m>=70)
    return("C")
  else if(m>=60)
    return("D")
  else
    return("F")
}

grade(100)
grade(-70)
grade('8')

# 점수벡터로 학점벡터생성 > 두벡터로 데이터프레임 생성
mlist = c(100,-97,88,65,74,30)
glist=NULL
for(m in mlist){
  g=grade(m)
  glist=c(glist,g)
}
score = data.frame(mlist,glist)
names(score) = c("score", "grade")
score

