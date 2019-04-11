package d0315.Ex1;
// 나눗셈 연산자 예제
public class Q1 {

	public static void main(String[] args) {
		int a = 20;
		int b = 2;
		double c = 2;
		
		System.out.println(a/b);
		System.out.println(a/c); //double값 => 자동형변환
		System.out.println(a/b == a/c);
		
		int d = 3;
		double e = 3;
		
		System.out.println(a/d);
		System.out.println(a/e);
		System.out.println(a/d == a/e);

	}

}
