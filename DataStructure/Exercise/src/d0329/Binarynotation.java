package d0329;

public class Binarynotation {

	public static void main(String[] args) {
		bin(9);

	}

	public static void bin(int n) {
		if (n > 1) {
			bin(n/2);
		}
		System.out.print(n%2);
		 
		
			
		}
	}
// 1보다 작아질 때까지 나눠
// 그리고 그 나눈 몫의 2로 나눈 나머지를 찍어 

/*if (n > 1) {
bin(n/2);
System.out.print(n%2);
}
else {
System.out.print(n);}
*/ 
