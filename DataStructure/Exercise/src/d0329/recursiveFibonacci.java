package d0329;

public class recursiveFibonacci {

	public static void main(String[] args) {
		for (int i = 0; i < 13; i++) {
			System.out.println(i + "\t" + fibonacci(i));
		}
	}

	public static long fibonacci(int n) {
		if(n<1)
			return 0;
		else if(n<3)
			return 1;
		else {
			return fibonacci(n-2) + fibonacci(n-1);
		}
		
		
	}

}
