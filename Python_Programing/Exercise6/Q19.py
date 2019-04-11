
def find_linear_max(arr):
    max, sum = [0]*2
    for num in arr:
        if num < 0:
            sum = 0
        else:
            sum += num
            max = sum if sum > max else max

    return max

## 하나씩 원소를 가져오면서 합을 구한다
## 만약 max 값보다 크다면 그 합을 max로 지정
## 하나씩 가져올때 num < 0 즉 가져온 원소값이 음수면 > 그 전까지 더한 원소보다 작아지므로
## 받아온 원소값이 음수일때 sum = 0초기화
## 하지만 만약 list에 음수만 있다면
## 가져온 원소값이 음수일경우 sum을 초기화 해주고 있으므로
## 결국 들어온의 원소가 음수일경우 sum값은 그 원소값이 될것
## sum == 즉 자신의 값을 현재max와 비교하여 지정
## 다시 다음원소를 가져올때 음수를 가져오면 sum이 다시 초기화 되어 상관없지만
## 양수를 가져올때 sum이 초기화 안됨 > 그러므로 현재의sum값이 음수일경우 초기화초건 추가
## 원소를 가져오며 sum을 더하면서 실시간으로 max를 비교하여 max를 지정하고
## sum을 초기화해줄때는 가져온 원소값이 음수일경우와 기존에 sum값이 음수일경우
def find_linear_max2(arr) :
    max = arr[0] # -sys.maxsize-1로 최소값을 초기화해출필요x > 어떤값인지 알기때문에 만약 어떤값인지 모른다면 입력할수 있는 수중 가장 작은수를 입력
    sum = 0

    for num in arr :

        if num < 0 or sum < 0:
            sum = 0

        sum += num

        if sum > max :
            max = sum

    return max

alist = [2,1,-3,1,0,-4,1,1,3,4]
alist = [-2,-1-4,-2,2,-3 ]
print(find_linear_max2(alist))



