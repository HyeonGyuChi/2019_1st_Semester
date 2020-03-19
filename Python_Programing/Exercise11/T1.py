class Person:
    name = ''

    def __init__(self, name):
        self.name = name

    def getName(self):
        return self.name

class Employee(Person):
    number = ''

    def __init__(self, name, number):
        super().__init__(name)
        self.number = number

    def __str__(self):
        str = self.name +': '+self.number
        return str

class Boss(Person):
    title = ''

    def __init__(self, name, title):
        super().__init__(name)
        self.title = title

    def __str__(self):
        str = self.name +': '+self.title
        return str


employee_1 = Employee("최민호", "12345")
employee_2 = Employee("김영희", "54321")
boss = Boss("김철수", "CEO")

print(employee_1)
print(employee_2)
print(boss)