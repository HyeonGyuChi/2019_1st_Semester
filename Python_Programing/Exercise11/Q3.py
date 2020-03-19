class Person:
    name =""

    def __init__(self, name):
        self.name = name

    def getName(self):
        return self.name

class Employee(Person):
    number = 0

    def __init__(self, name, number):
        self.name = name
        self.number = number

    def __str__(self):
        return self.name + ':' + self.number

class Boss(Person):

    title = ""

    def __init__(self, name, title):
        self.name = name
        self.title = title

    def __str__(self):
        return self.name + ':' + self.title

employee_1 = Employee("최민호", "12345")
employee_2 = Employee("김영희", "54321")
boss = Boss("김철수", "CEO")

print(employee_1)
print(employee_2)
print(boss)

