package d0524;

public class linkedlist {
	listNode head;

	public linkedlist() {
		head = null;
	}

	public void printList() {
		listNode p = head;

		while (p != null) {
			if (p.exp == 0) {
				if (p.coef > 0)
					System.out.print(" +" + p.coef);
				else
					System.out.print(" " + p.coef);
			}

			else {
				if (p.coef > 0)
					System.out.print(" +" + p.coef + "x^" + p.exp);
				else
					System.out.print(" +" + p.coef + "x^" + p.exp);
			}
			p = p.link;
		}
		System.out.println();
	}

	public void addTerm(int Coef, int Exp) {
		listNode q = new listNode(Coef, Exp);
		listNode previousNode, currentNode;

		if (head == null) { // 노드가 없을 때
			head = q;
			return;
		}

		else if (head.link == null) { // 항이 하나힐때
			if (head.exp > q.exp) {
				head.link = q;
			} else if (head.exp < q.exp) {
				q.link = head;
				head = q;
			} else { // 같은 차수를 가질때
				head.coef += q.coef;
			}
		}

		else { // 항이 여러개일때 / pre 와 current 사이에 항이 들어오기 위해 이전의 노드가 q를 link하고 있어야 하므로 current기준
				// 이전항을 알아야함
			previousNode = head;
			currentNode = head.link;

			if (previousNode.exp < Exp) {
				q.link = head;
				head = q;
				return;
			} else if (previousNode.exp == Exp) {
				head.coef += q.coef;
				return;
			}
			// pre
			while (currentNode != null) {

				if (currentNode.exp == Exp) {
					currentNode.coef += q.coef;
					return;
				}

				else if (currentNode.exp < Exp) {
					previousNode.link = q;
					q.link = currentNode;
					return;
				}

				previousNode = currentNode;
				currentNode = currentNode.link;

			}		
			previousNode.link = q;
		}
		

	}

	public linkedlist addPoly(linkedlist B) {
		linkedlist C = new linkedlist();
		listNode p = head;
		listNode q = B.head;

		while (p != null && q != null) { // 두 다항식의 차수를 비교해 가며 C에 알맞게 addTerm
			if (p.exp > q.exp) {
				C.addTerm(p.coef, p.exp);
				p = p.link;
			} else if (p.exp < q.exp) {
				C.addTerm(q.coef, q.exp);
				q = q.link;
			} else {
				C.addTerm(q.coef + p.coef, q.exp);
				p = p.link;
				q = q.link;
			}
		}

		while (p != null) { // p의 노드들이 남았을 때
			C.addTerm(p.coef, p.exp);
			p = p.link;
		}

		while (q != null) { // q의 노드들이 남았을 때
			C.addTerm(q.coef, q.exp);
			q = q.link;
		}

		return C;
	}

	public linkedlist multiTerm(int coef, int Exp) {
		linkedlist x = new linkedlist();
		listNode p = head;

		while (p != null) {
			x.addTerm(p.coef * coef, p.exp + Exp);
			p = p.link;
		}
		return x;
	}

	public linkedlist multiPoly(linkedlist A) {
		linkedlist Total = new linkedlist();
		listNode p = head;

		while (p != null) {
			linkedlist temp = new linkedlist();
			listNode q = A.head;
			while (q != null) {
				temp.addTerm(q.coef * p.coef, q.exp + p.exp);
				q = q.link;
			}
			Total = Total.addPoly(temp);
			p = p.link;
		}

		return Total;
	}

}
