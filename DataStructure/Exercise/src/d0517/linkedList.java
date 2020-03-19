package d0517;

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

	public void deleteNext(String x) { // p.link = p.link.link 로 접근하므로 마지막항은 다르게 처리 (왜? p.link.link에서 오류 )

		listNode p = searchNode(x);

		if (head == null) { // 빈 list 일경우
			System.out.print("빈 LinkedList");
		}

		else if (p == null) { // x값이 list에 없을 때
			System.out.println("listNode don't have " + x + "data");
		} else { // list에 x값을 갖는 노드가 있을 때 > 마지막 노드 지울 때 주의 > p가 null일경우 p.link 시 오류

			p = head; // x값 전항을 찾기위해 p를 초기화
			// 첫번째 항이 삭제할 x값일 때
			if (p.data.equals(x)) {
				head = p.link;
			}
			// 두번째 항부터 x값이 존재
			else {
				// 두번째 항 부터 마지막 항까지 탐색 > 다음에 있는 데이터가 x인 p를 구함
				while (!p.link.data.equals(x)) { // 두번째 ~ 마지막 항까지 삭제 가능
					p = p.link; // p는 마지막 항이 될 수 없음
				}
				p.link = p.link.link;// 마지막 항까지 지우기위해 p는 마지막 전항까지만 접근
			}
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
//-----------------------05/17------------------------------

	public void deleteLastNode() {
		listNode previousNode, currentNode; // 이전노드, 현재노드

		if (head == null)
			return; // 연결리스트가 비어있으면 이 메소드를 빠져나감
		if (head.link == null) { // 연결리스트에 노드가 하나 존재한다면
			head = null; // 노드가 하나이므로, 연결리스트를 비운다.
			return;
		} else { // 연결리스트의 노드가 두개 이상일때
			previousNode = head; // 이전노드가 L을 가르킴
			currentNode = head.link; // 현재노드가 .link

			while (currentNode != null) { // 현재노드가 null 이 마닐때 까지
				previousNode = currentNode;
				currentNode = currentNode.link;
			}
			previousNode.link = null; // 마지막 이전 노드의 링크를 null로 만들어 노드삭제
		}

	}

	public void reverse() { // p는 p.link로 계속 순회 > p이전의 객체에게 p(나)를 link하지말고 이전의 객체(r)에게 link해!
		listNode p = head; // pointer 
		listNode q = null; // p가 다음항으로 옮겨가기 전 p를 임시저장
		listNode r = null; // p의 이전의 항을 임시저장
		while (p != null) { // r q p < 한번 loop 끝날때마다
			r = q; // r = p의 이전객체정보
			q = p; // p는 다음 포인터로 이동하기 위해 q에 임시저장
			p = p.link; // p 다음으로 이동
			q.link = r; // 임시저장한 p의 link를 p이전객체로 전환
		}
		head = q; // while문 종료시 r(tail-1) q(tail) p(null) 이므로 head를 tail인 q로 연결 
	}

	public static linkedList addList(linkedList L1, linkedList L2) {
		if (L1 == null) {
			return L2;
		} else if (L2 == null) {
			return L1;
		} else {
			listNode p = L1.head;
			linkedList newLinkedList = new linkedList(); // 깊은복사로 L1 L2를 합침
			// L1
			while (p != null) { // p가 가르키는 값이 없을 때 까지 // 만약 (p.link != null) 이면 마지막 항이 추가(add) 되지 않음
				newLinkedList.addLastNode(p.data); // string 깊은복사 new String(p.data) ?
				p = p.link; // p를 이동시켜줌
			}
			// L2
			p = L2.head;
			while (p != null) {
				newLinkedList.addLastNode(p.data);
				p = p.link;
			}

			return newLinkedList;

			/*
			 * 얕은복사시 while(p.link != null) { // L1 의 마지막 노드 찾기 p = p.link; }
			 * 
			 * p = L2.head; // L1의 마지막노드에 L2이어주기
			 */
		}

	}

}
