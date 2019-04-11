package d0408;

public class ArrayPolynomialTest {

	public static void main(String[] args) {
		ArrayPolynomial p = new ArrayPolynomial();
		ArrayPolynomial s = new ArrayPolynomial();
		
		System.out.println("p");
		p.addTerm(4, 4); //4x^4
		p.addTerm(2, 3);
		p.addTerm(6, 0);
		p.addTerm(8, 5);
		p.addTerm(4, 10);
		p.delTerm(6);
		p.printAll();
		System.out.println(p);
		System.out.println("p최고차항 : " + p.maxExp());
		
		System.out.println("------------------------");
		
		System.out.println("s");
		s.addTerm(5, 2);
		s.addTerm(9, 4);
		s.addTerm(4, 1);
		s.printAll();
		System.out.println(s);
		System.out.println("s최고차항 : " + s.maxExp());
		
		System.out.println("------------------------");		
		
		System.out.println("r = p*(3x^2)" );
		ArrayPolynomial r = p.sMulti(3, 2);
		r.printAll();
		System.out.println(r);
		System.out.println("r최고차항 : " + r.maxExp());
		
		System.out.println("------------------------");
		
		System.out.println("ps = p+s");
		ArrayPolynomial ps = p.polyAdd(s);
		ps.printAll();
		System.out.println(ps);
		System.out.println("ps최고차항 : " + ps.maxExp());
		
		System.out.println("------------------------");
		
		System.out.println("rs = r*s");
		ArrayPolynomial rs = r.polyMul(s);
		rs.printAll();
		System.out.println(rs);
		System.out.println("rs최고차항 : " + rs.maxExp());
	}

}
