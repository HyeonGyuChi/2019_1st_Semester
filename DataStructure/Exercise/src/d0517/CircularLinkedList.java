//원형리스트 구현

package d0517;

public class CircularLinkedList {

	listNode head;
	listNode tail;

	public void printList() {
		listNode p;
		System.out.print("(");
		p = tail.link;

		if (head != null) {
			do {
				System.out.print(p.data + " ");
				p = p.link;
			} while (p != tail.link);
			System.out.println(")");
		}
	}

	public void addFirst(String x) {
		listNode p = new listNode();
		p.data = x;

		if (tail == null) { // 노드가 없을 때 == 빈 리스트일때
			p.link = p; // 자기자신 link
			tail = p;
			head = p;
		} else {
			p.link = head; // == tail.link
			tail.link = p; // tail은 변동없음
			head = p; // head 변동

		}
	}

	public void addLast(String x) {
		listNode p = new listNode(x);
		p.data = x;

		if (head == null) { // 빈 리스트일 때
			addFirst(x);
		} else {
			p.link = tail.link; // == head
			tail.link = p;
			tail = p; // tail 변동
		}
	}

	public void insert(String x, String y) { // x뒤에 y삽입
		if (tail == null) { // 빈 리스트
			addFirst(y);
			return;
		} // 노드가 한개이상
		listNode p = new listNode(); // x를 찾을 노드
		listNode q = new listNode();
		q.data = y; // 삽입할 노드

		p = head;
		do {
			if (p.data.equals(x)) { // tail.data다음에 insert 할경우 
				if (p == tail) { // p가 tail일 경우 tail다음에 insert할 경우 insert 후 tail이동
					q.link = p.link;
					p.link = q;
					tail = q;
				} else {
					q.link = p.link;
					p.link = q;
				}
				break;
			}
			p = p.link;
		} while (p != head);

	}

	public void deleteNext(String x) {
		if (tail == null) // 빈 리스트
			return;
		listNode p = new listNode();
		p = head;
		while(!p.data.equals(x) && p != tail) {
			p = p.link;
		}
		
		if(p == tail){ // head를 삭제될 염려 x
			System.out.println("삭제할 값이  없음");
			return;
		}
		
		if(p.link == tail) { //삭제하는 타겟이 tail 일 경우
			p.link = p.link.link;
			tail = p; // 삭제 후 tail 을 변경
			return;
		}
		
		p.link = p.link.link; 
	}
	
/*( 만약 x값을 지우고 싶다면)
	public void deleteNext(String x) {
		if (tail == null) // 빈 리스트
			return;
		listNode p = new listNode();

		p = head;
		// 노드가 한개일때
		if (head == tail) {
			if (p.data.equals(x)) {
				head = null;
				tail = null;
			}
			return; // 삭제하면 바로 종료
		}

		// 노드가 두개 이상일 때
		do {
			if (p.link.data.equals(x)) {
				if (p.link == tail) { // 지우려고 하는 값이 tail
					p.link = p.link.link;
					tail = p;
				} else if (p.link == head) { // 지우려고 하는 값이 head
					p.link = p.link.link;
					head = p.link;
				} else {
					p.link = p.link.link;
				}
				return; // 삭제하면 바로종료
			}
			p = p.link;
		} while (p != head); // head~tail까지 모두 p가 되어 link를 탐색
		// 상단에서 x를 찾아 지웠을 경우 return 으로 끝나므로 while문의 종료는 곧 x값의 부재
		System.out.println("지우려는" + x + "값이 리스트에 없습니다.");
	}
*/

	public static void main(String[] args) {
		CircularLinkedList L1 = new CircularLinkedList();

		L1.addFirst("y");
		L1.addFirst("l");
		L1.addFirst("l");

		System.out.println("-------------addFirst-------------");
		L1.addFirst("H");
		L1.printList();
		System.out.println(L1.head.data +" " + L1.tail.data);
		System.out.println(L1.tail.link == L1.head);

		System.out.println("-------------addLast-------------");
		L1.addLast("m");
		L1.printList();
		System.out.println(L1.head.data +" " + L1.tail.data);
		System.out.println(L1.tail.link == L1.head);
		
		System.out.println("-------------Insert-------------");
		L1.insert("H", "a");
		L1.insert("m", "!");
		L1.printList();
		System.out.println(L1.head.data +" " + L1.tail.data);
		System.out.println(L1.tail.link == L1.head);
		
		
		System.out.println("-------------Delete-------------");
		L1.deleteNext("a");
		L1.printList();
		System.out.println(L1.head.data +" " + L1.tail.data);
		System.out.println(L1.tail.link == L1.head);
	}
}