package d0604;

public class ArrayQueue implements Queue { // 선입선출
	private int front;
	private int rear;
	private int count; // 원소수
	private int queueSize; // 큐(배열)크기
	private int increment; // 배열의 확장단위
	private Object[] itemArray; // 큐 배열

	public ArrayQueue() {
		front = 0;
		rear = 0;
		count = 0;
		queueSize = 5; //50
		increment = 2; // 10
		itemArray = new Object[queueSize];
	}

	public boolean isEmpty() {
		return (count == 0);
	}

	public void enqueue(Object x) {
		rear = (rear + 1) % queueSize; // 0~49까지 접근가능 // 원소저장은 1부터

		if (count == queueSize-1)
			queueFull();

		itemArray[rear] = x;
		count++;
	}

	public void queueFull() { // 저장소 늘리기
		int oldSize = queueSize; // 현재배열의 크기저장
		queueSize += increment; // 새로운 배열의 크기
		Object[] tempArray = new Object[queueSize]; // 확장되 크기의 임시배열

		for (int i = 1; i <= count; i++) { // 임시배열로 원소이동 // 1부터 하면되지않ㄴ?
			tempArray[i] = itemArray[++front % oldSize];
			// tempArray[i] = i % oldSize;
		}
		itemArray = tempArray;
		front = 0;
		rear = count + 1;
	}

	public Object dequeue() {
		if (isEmpty()) // 큐가 공백
			return null;

		front = (front + 1) % queueSize;

		Object item = itemArray[front];
		count--;

		return item;

	}

	public void delete() {
		if (isEmpty())
			return;
		else {
			front = (front + 1) % queueSize;
			count--;
		}
	}

	public Object peek() {
		if (isEmpty())
			return null;
		else
			return itemArray[(front + 1) % queueSize];
	}

	public void queuePrint() {
		System.out.print("Queue 배열 :");
		for (int i = front + 1; i < queueSize; i++) {
			if (itemArray[i] == null) { // 빈공간을 만났을 때 종료
				System.out.println();
				return;
			}
			System.out.print(" " + itemArray[i]);
		}
	}

}
