package Chap_2;

public class ListStack implements Stack {
	private ListNode top;

	public boolean isEmpty() {
		if (top == null)
			return true;
		else
			return false;
	}

	public void printStack() { // 스택출력
		ListNode p; // 연결리스트를 순회하기 위한 p
		System.out.print("스택정보 : ");
		p = top; // p가 연결 리스트의 첫 노드인 top을 가리키도록한다.

		while (p != null) {
			System.out.print(p.data);
			p = p.link;

			if (p != null)
				System.out.print("\t");
		}
		System.out.println();
	}

	public void push(int x) {
		ListNode newNode = new ListNode();
		newNode.data = x;
		newNode.link = top; // 최신노드(5) -> 4 -> 3 -> 2 -> 1(가장 처음에 만든 노드)
		top = newNode;
	}

	public int pop() {
		if (isEmpty()) {
			return 0;
		} else {
			ListNode item = top; // 현재 top원소 저장
			top = top.link; // top을 다음노드로 변경
			return item.data; // temp반환
		}
	}

	public void delete() {
		if (isEmpty()) {
			return;
		} else {
			top = top.link; // 공백이 아니면 top을 다음노드로 변경
		}
	}

	public int peek() {
		if (isEmpty()) {
			return 0;
		} else {
			return top.data; // top노드의 데이터 반환
		}
	}
}
