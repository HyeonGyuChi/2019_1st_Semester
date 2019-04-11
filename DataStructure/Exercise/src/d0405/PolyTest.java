package d0405;

public class PolyTest {

	public static void main(String[] args) {
		Poly A = new Poly();
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
		
		

	}

}
