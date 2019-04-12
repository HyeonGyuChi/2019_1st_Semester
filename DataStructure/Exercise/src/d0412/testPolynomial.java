package d0412;

public class testPolynomial {

	public static void main(String[] args) {
		Polynomial A = new Polynomial();
		Polynomial B = new Polynomial();

		A.addTerm(2, 3);
		A.addTerm(4, 2);
		A.addTerm(2, 1);
		System.out.print("다항식 A(x) = ");
		A.print();
		System.out.println();

		B.addTerm(2, 2);
		B.addTerm(1, 1);
		B.addTerm(3, 0);
		System.out.print("다항식 B(x) = ");
		B.print();
		System.out.println();

		Polynomial C = A.addPoly(B);
		System.out.print("다항식 C(x) = A(x) + B(x) = ");
		C.print();
		System.out.println();

		System.out.println("최대 지수 = x^" + C.maxExp());
		System.out.print("최대 계수 = " + C.maxCoef());
		System.out.println();
		
		Polynomial D = A.multiPoly(B);
		System.out.print("다항식 D(x) = A(x) * B(x) = ");
		D.print();
		System.out.println();
		
		Polynomial E = A.multiTerm(2, 1);
		System.out.print(" 다항식 A(x) * 2x = ");
		E.print();
		System.out.println();
	}

}
