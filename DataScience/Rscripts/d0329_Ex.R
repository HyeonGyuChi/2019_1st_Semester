# Report #3. DataSet연습

# 대중문화속에 있는 슈퍼영웅들의 특징 데이터 셋
# 영웅의 신체적 특성을 나열한 정보
# superherodb에서 2017년 6월에 수집
# 우리가 좋아하는 많은 슈퍼영웅들은 어떤 특성을 지니고 있을까?

# Column속성: 이름, 성별, 눈색깔, 종족, 머리색깔, 키, 출판사, 피부색, 악당여부, 몸무게

# CSV를 헤더포함, STRING을 FACTOR형으로 만들지 않고 읽기
heroData = read.csv('./Data/heroes_information.csv', header = T, stringsAsFactors = F)

heroData$X = NULL # 쓸모없는 index열 제거
str(heroData) # heroData의 전체적인 구조확인(크기와 구조)
mode(heroData) # 데이터의 저장타입 확인
class(heroData) # 데이터의 객체타입 확인
head(heroData, 10) # 상위 10개 데이터 확인

str(heroData$Alignment) # heroData의 Alignment열 구조 확인

heroData$Gender = as.factor(heroData$Gender) # factor형으로 성별바꿔주기
heroData$Alignment = as.factor(heroData$Alignment) # factor형으로 성별바꿔주기


