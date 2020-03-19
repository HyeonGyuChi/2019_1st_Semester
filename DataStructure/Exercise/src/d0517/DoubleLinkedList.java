// 이중연결 리스트 구현

package d0517;

class DoubleListNode {
	String data;
	DoubleListNode rlink;
	DoubleListNode llink;
}

public class DoubleLinkedList {
	DoubleListNode head;
	DoubleListNode tail;
	int count;
	
	public DoubleLinkedList() { //생성자
		head = null;
		tail = null;
		count = 0;
	}
	
	public void printList() {
		DoubleListNode p;
		System.out.print("(");
		p = head;
		
		while(p != null) {
			System.out.print(p.data);
			p = p.rlink;
			
			if (p != null) {
				System.out.print(", ");
			}
		}
		System.out.println(")");
	}
	
	public boolean isEmpty() {
		return (count == 0);
	}
	
	public void insertFirst(String x) {
		DoubleListNode newNode = new DoubleListNode();
		newNode.data = x;
		
		if (isEmpty()) { // 빈 리스트
			head = newNode;
			tail = newNode;
		}
		else {
			newNode.rlink = head;
			head.llink = newNode;
			head = newNode;
		}
		
		count++;
	}
	
	public void insertLast(String x) {
		DoubleListNode newNode = new DoubleListNode();
		newNode.data = x;
		
		if(isEmpty()) { // 빈 리스트
			head = newNode;
			tail = newNode;
		}
		
		else {
			newNode.llink = tail;
			tail.rlink = newNode;
			tail = newNode;
		}
	
		count++;
	}
	
	public void deleteFirst() {
		if(isEmpty()) {
			return;
		}
		
		else {
			head = head.rlink;
			head.llink = null;
		}
		count--;
	}
	
	public void deleteLast() {
		if(isEmpty()) {
			return;
		}
		
		else {
			tail = tail.llink;
			tail.rlink = null;
		}
		count--;
	}
	
	public String peekindex(int n) {
		
		int index = 1; // head의 인덱스 == 1
		DoubleListNode p = head;
		
		while(n <= count) {
			if(index == n) {
				return p.data;
			}
			index += 1;
			p = p.rlink;
		}
		
		return "값이 없습니다.";
	}
	
	public void reverseprint() {
		DoubleListNode p;
		System.out.print("(");
		p = tail;
		
		while(p != null) {
			System.out.print(p.data);
			p = p.llink;
			
			if(p != null)
				System.out.print(", ");
		}
		System.out.println(")");
	}
	
	public static void main(String[] args) {
		DoubleLinkedList D1 = new DoubleLinkedList();
		
		D1.insertFirst("F");
		D1.insertFirst("O");
		D1.printList();
		System.out.println();
		
		System.out.println("-------insertLast-------");
		D1.insertLast("T");
		D1.printList();
		System.out.println();
		
		System.out.println("-------insertFirst-------");
		D1.insertFirst("S");
		D1.printList();
		System.out.println();
		
		System.out.println("-------reverseprint-------");
		D1.reverseprint();
		System.out.println();
		
		System.out.println("-------PeekData-------");
		System.out.println((D1.peekindex(3)));
		
		System.out.println("-------deleteFirst-------");
		D1.deleteFirst();
		D1.printList();
		System.out.println();
		
		System.out.println("-------deleteLast-------");
		D1.deleteLast();
		D1.printList();
		System.out.println();
	}
	
}





