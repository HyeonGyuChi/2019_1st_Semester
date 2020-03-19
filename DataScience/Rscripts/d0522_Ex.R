# 05/22 연습문제 # Report 5_20155342 지현규
# 1 두수의 곱을 구하는 mul 함수

mul = function(x=1, y=1){ # 초기값 1로 설정
  if(!is.numeric(x) | !is.numeric(y)){ # 두수가 숫자가 아닐경우
    warning("Parameter are not numeric")
    return(NA)
  }
  z = x*y # 지역변수에 계산결과 저장하여 반환
  return(list(x=x, y=y, z=z)) # x,y,z 리스트로 처리
}

(mul(2,3))


# 2 20대 30대 40대 기타를 반환하는 함수
checkAge = function(age){
  if(!is.numeric(age)){ # 나이가 숫자가 아니면 경고메시지
    warning("Patameter is not Numeric")
    return (NA)
  }
  
  if(age< 1& age >200){ # 입력 나이는1-200 범위
    warning("Check age's Boudary : 1~200")
    return (NA)
  }
  
  if(age >= 20 & age < 30) # 20대
    return('20s')
  else if(age >= 30 & age < 40) # 30대
    return('30s')
  else if(age >= 40 & age < 50) # 40대
    return('40s')
  else
    return('etc')
}

ages = c(14,23,30,45,58,66,80,300) # 나이벡터를 이용하여 반복처리
checklist = NULL
# 만약 나이벡터에 'str'을 준다면 벡터의 모든원소타입이 str변하므로
# 서로 다른타입 변수를 저장할 수 있는 list이용
# agelist = list(14,23,30,45,'str')

for(age in ages){
  check = checkAge(age)
  checklist = c(checklist,check) 
}

agetable = data.frame(ages, checklist)
names(agetable) = c("age", "check")
(agetable)

checkAge("str")      # 원소타입 str인경우
