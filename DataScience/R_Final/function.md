# 사용자 정의 함수
### 1. 복합문/단일문
- 복합문
```R
add = funtion(x,y){
  z = x+y
  return(z)
}
```
- 단일문
```R
add = function(x,y) x+y
```

### 2. 오류(Error)와 경고(Warning)
- 오류 (stop)
```R
if(!is.numeric(x)) stop("not numeric!") # error메세지와 함께 stop
```

- 경고(warning)
```R
if(!is.numeric(x)){
  warning("not numeric!") # 경고메시지
  return(NA) # 멈추지않음
}
```

### 3. 다중 return
- list를 사용하여 여러값 반환
```R
y = x^2
return(list(input=x, output=y)) # 리스트에 라벨을 붙여 생성 후 반환

> mysquare3(2)
$input
[1] 2
$output
[1] 4
```

### 4. 인수생략
```R
add = funtion(x=1, y=1){
  z = x+y
  return(z)
}

> add()
[1] 2
```

### 5. 스코프
#### 전역변수
- 접근연산자 : <<-

#### 지역변수
- 접근연산자 : = <-
- {}내부에서만 사용
- 전역변수와 동일한 이름 사용시 지역변수 우선접근

## Report #5
>(1)두수(x,y)의 곱을 구하여 반환하는  mul  함수 작성
  -두수가  숫자가 아니면 경고메시지 처리 후 NA반환
  -두 인수의 초기값은 1로 설정
  -지역변수 (z)에 계산 결과를 저장하여 반환
 -반환은 x,y, z의 리스트로  처리
(2)나이를 입력하여 20대,30대,40대, 기타를 반환하는 함수 작성
 -나이가 숫자가 아니면 경고메시지, NA반환
 -나이가 1-200범위가 아니면 범위 경고메시지, NA반환
 -나이벡터를 이용하여 반복처리

 ```R
 #1)두수(x,y)의 곱을 구하여 반환하는  mul  함수 작성
mul = function(x = 1, y = 1){ # 두 인수의 초기값은 1로 설정
  if(!is.numeric(x) | !is.numeric(y)){ # 두수가  숫자가 아니면 경고메시지 처리 후 NA반환
    warning("x,y are not numeric")
    return(NA)
  }
  z = x*y # 지역변수 (z)에 계산 결과를 저장하여 반환
  return (list(x=x, y=y, z=z)) # 반환은 x,y, z의 리스트로  처리
}

result1 = mul(3,4) # Test
> result1
$`x`
[1] 3

$y
[1] 4

$z
[1] 12
 ```

 ```R
 #2) 나이를 입력하여 20대,30대,40대, 기타를 반환하는 함수 작성
ages = function(age){
  if(!is.numeric(age)){ # 나이가 숫자가 아니면 경고메시지, NA반환
    warning("숫자가 아님")
    return(NA)
  }

  if(age > 200 | age < 0){ # 나이가 1-200범위가 아니면 범위 경고메시지, NA반환
    warning("범위초과")
    return(NA)
  }

  else{
    if(age >= 20 & age < 30) return("20대")
    else if(age >= 30 & age < 40 ) return("30대")
    else if(age >= 40 & age < 50 ) return("40대")
    else return("기타")
    }
  }
}

agelist = c(32,35,210,68,44) # Test
aa = NULL
for(a in agelist){ # 나이벡터를 이용하여 반복처리
  aa = c(aa, ages(a))
}

> aa
[1] "30대" "30대" NA     "기타" "40대"  
 ```
