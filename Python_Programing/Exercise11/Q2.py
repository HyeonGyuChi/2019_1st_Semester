class Dog :
    name = ""
    tricks=[]
    count = 0

    def __init__(self, name):
        self.name = name # 인스턴스 변수
        self.tricks = [] # 인스턴스 변수
        Dog.count += 1 # 클래스 변수

    def add_trick(self, trick):
        self.tricks.append(trick) # 장기저장

    def __str__(self):
        return self.name + str(self.tricks)

ba = Dog('바둑이')
ba.add_trick('잠자기')

mung = Dog('멍멍이')
mung.add_trick('뒹굴기')
mung.add_trick('달리기')

print(ba)
print(mung)

print('현재까지 생성된 강아지는', Dog.count, '마리')