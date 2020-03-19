package d0524;
import d0524.linkedlist;

public class linkedmain {

	public static void main(String[] args) {
		linkedlist A = new linkedlist();
		linkedlist B = new linkedlist();

		A.addTerm(2, 3);
		A.addTerm(4, 2);
		A.addTerm(2, 1);
		System.out.print("다항식 A(x) = ");
		A.printList();
		System.out.println();

		B.addTerm(2, 2);
		B.addTerm(1, 1);
		B.addTerm(3, 0);
		
		System.out.print("다항식 B(x) = ");
		B.printList();
		System.out.println();
		
		linkedlist C = A.addPoly(B);
		System.out.print("다항식 C(x) = A(x) + B(x) = ");
		C.printList();
		System.out.println();
		
		linkedlist D = A.multiTerm(2, 1);
		System.out.print(" 다항식 A(x) * 2x = ");
		D.printList();
		System.out.println();
		
		linkedlist E = A.multiPoly(B);
		System.out.print("다항식 E(x) = A(x) * B(x) = ");
		E.printList();
		System.out.println();
		

	}

}
