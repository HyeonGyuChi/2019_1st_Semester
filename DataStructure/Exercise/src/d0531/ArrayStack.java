package d0531;

public class ArrayStack implements Stack {
	private int top;
	private int stackSize;
	private int increment;

	private Object[] itemArray;

	public ArrayStack() {
		top = -1; // Top의 원소
		stackSize = 50; // 스택의 크기
		increment = 10; // 스택의 확장단위
		itemArray = new Object[stackSize];
	}

	public boolean isEmpty() {
		if (top < 0)
			return true;
		else
			return false;
	}

	public void stackFull() {
		stackSize += increment;
		Object[] tempArray = new Object[stackSize]; // 확장된 크기배열 생성

		for (int i = 0; i <= top; i++) { // 배열원소복사
			tempArray[i] = itemArray[i];
		}
		itemArray = tempArray; // 참조변수로 확장된 배열을 객체의 배열로 참조

	}

	public void printStack() {
		System.out.print("스택 정보 : ");

		for (int i = 0; i <= top; i++) {
			System.out.print(itemArray[i] + "\t");
		}
		System.out.println("");
	} // 스택의 끝

	public void push(Object x) {
		if (top >= stackSize - 1) { // full 이므로 크기 stack크기 늘리기
			stackFull();
		}
		itemArray[++top] = x; // 원소삽입
	}

	public Object pop() {
		if (top < 0) // 스택 공백처리
			return isEmpty();
		else {
			Object temp = itemArray[top--];
			return temp;
		}
	}

	public void delete() {
		if (top < 0) { // 공백일때
			System.out.println("공백스택");
		} else { // top원소 감소시켜 자동삭제
			top--;
		}
	}

	public Object peek() {
		if (isEmpty()) { // 공백일때
			return null;
		}

		else {
			return itemArray[top];
		}
	}

}
