'''
monthly에는 월별 판매 실적이 다음과 같이 저장되어 있습니다.
각 아이템에 대한 월 별 판매 실적이 오르락내리락 하며 변화 하고 있을 때, 그 변화 과정에서 고점을 찍은 달 만을 구하고자 합니다.
메인 루틴이 다음과 같이 주어졌을 때, 프로그램 수행 예처럼 실행 되도록 calc_peak() 함수를 구현하세요.
(단, 마지막인 12월과 첫 1월은 연속된 과정이라 생각합니다.)
'''


def calc_peak(**dic):
    result = {}

    for key, value in dic.items() :
        maxMonth = []

        for i in range(len(value)) :
            pre = value[i - 1]
            now = value[i]

            if i == len(value) - 1 :
                next = value[0]
            else :
                next = value[i + 1]

            if pre < now and now > next: # 꼭지점의 특징 : 현재값이 이전값과 다음값보다 클때
                maxMonth.append(i+1)

        result[key] = maxMonth

    return result

monthly = { 'adidas' : [10,22,33,21,11,0,0,6,8,11,15,0],
'nike' : [11,22,11,22,11,0,0,0,0,0,0,0],
'descente' : [55,22,11,44,11,0,0,0,10,0,9,6],
'asics' : [4,9,11,22,33,44,55,66,42,33,6,5]}

print(*monthly) # dictionary의 키값 출력(참고)
print(*monthly.values()) # dictionary의 value값 출력(참고)

peak = calc_peak(**monthly) # dictionary로 인자를 줄때 key = value / **붙이기!
for item in peak.keys():
    print(item, peak.get(item), '월')