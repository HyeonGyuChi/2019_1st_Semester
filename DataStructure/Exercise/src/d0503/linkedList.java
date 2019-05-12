package d0503;

public class linkedList {
	listNode head;

	public void printList() {
		listNode p = head; // 연결리스트를 순회하기 위한 p를 head로 설정
		System.out.print("("); // 먼저 "("를 출력

		while (p != null) { // 연결리스트의 데이터필드가 없을 때 까지 반복
			System.out.print(p.data); // p의 데이터 필드 출력
			p = p.link; // 다음노드로 이동

			if (p != null) {
				System.out.print(", "); // 데이터 필드가 null이 아닌경우 , 를 출력
			}
		}
		System.out.println(")"); // 다음링크로 이동하기 전 ) 출력
	}

	public void addFirstNode(String x) {
		listNode newNode = new listNode(x); // x데이터를 갖는 새로운 Node 생성
		newNode.link = head; // 가장 처음에 연결해야 하므로 생성한 head가 가르키는 노드를 newNode의 다음노드로 오게함
		head = newNode; // head가 새로운 newNode를 가르키게 함.
	}

	public listNode searchNode(String x) {
		listNode p = head;

		while (p != null) {
			if (x.equals(p.data)) {
				return p;
			}
			p = p.link;
		}

		return p; // 원소값이 x인 노드가 없을 경우 null반환

	}

	public void insertNode(String x, String y) { // x인 데이터를 가진 노드다음에 데이터가 y인 노드삽입
		listNode newNode = new listNode(y);
		listNode p = head; // x 데이터를 가진 노드를 찾기 위한 p를 head로 초기화

		if (head == null) { // 1. 공백 LinkedList인경우
			head = newNode;
			newNode.link = null;
			return;
		}
		// 2. 공백인 노드가 아닐경우, x의 데이터가 있는지 확인
		while (p != null) { // 처음부터 모든 노드를 방문
			if (x.equals(p.data)) { // 3. x인데이터를 가진 노드
				newNode.link = p.link; // x값을 가지는 노드 다음에 삽입
				p.link = newNode;
			}
			p = p.link; // 다음노드 방문
		}

	}

	public void deleteNext(String x) {
		listNode p = head;

		while (p != null) {
			if (x.equals(p.data)) {
				break;
			}
			p = p.link;
			

		}

		// listNode p = searchNode(x);// x값을 갖는 노드를 가져옴

		if (head == null) {
			System.out.print("빈 LinkedList");
		}

		else if (p == null) {
			System.out.println("listNode don't have " + x + "data");
		}

		else {
			p.link = p.link.link;
		}

	}

	public void addLastNode(String x) {
		listNode newNode = new listNode(); // 새로운 노드생성
		newNode.data = x;
		newNode.link = null;

		if (head == null) {
			head = newNode;
			return;
		}

		listNode p = head; // 연결된 link가 null인 listNode를 탐색하기 위해 head로 초기화

		while (p.link != null) {
			p = p.link;
		}

		p.link = newNode; // 연결된 link가 null인 listNode는 마지막 node이므로 생성한 newNode를 연결
	}
}
