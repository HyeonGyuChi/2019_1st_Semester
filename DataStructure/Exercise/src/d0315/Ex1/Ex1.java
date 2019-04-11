package d0315.Ex1;

//실습 1 a와 b에 int형으로 32와 4를 저장하고
//sum substrace multiply divide의 메소드를 정의해서 return 받아 출력
public class Ex1 {

	public static void main(String[] args) {
		int a = 32;
		int b = 4;

		System.out.println(sum(a,b));
		System.out.println(substract(a, b));
		System.out.println(multiply(a, b));
		System.out.println(divide(a,b));
		
	}
	
	public static int sum(int a, int b) {
		return a+b;
	}
	

	public static int substract(int a, int b) {
		return a-b;
	}
	

	public static int multiply(int a, int b) {
		return a*b;
	}
	

	public  static double divide(int a, int b) {
		return a/b;
	}
	

}
