package d0426;

public class PolyTest {

	public static void main(String[] args) {
		Poly A = new Poly();
		Poly B = new Poly();
		
		A.addTerm(2, 1);
		A.addTerm(1, 0);
		A.addTerm(3, 2);
		System.out.print("다항식 A(x) = ");
		A.printPoly();
		System.out.println();
		A.addTerm(-3, 1);
		System.out.print("다항식 A(x) = ");
		A.printPoly();
		System.out.println();
		
		B.addTerm(2, 2);
		B.addTerm(1, 1);
		B.addTerm(3, 0);
		System.out.print("다항식 B(x) = ");
		B.printPoly();
		System.out.println();
		
		Poly C = A.addPoly(B);
		System.out.print("다항식 C(x) = A(x) + B(x) = ");
		C.printPoly();
		System.out.println();
		
		Poly D = A.multiTerm(2,1);
		System.out.print("다항식 D(x) = A(x) * 2x+1 = ");
		D.printPoly();
		System.out.println();
		
		Poly E = A.multiPoly(B);
		System.out.println("다항식 E(x) = A(x) * B(x) = ");
		E.printPoly();
		System.out.println();

	}

}
