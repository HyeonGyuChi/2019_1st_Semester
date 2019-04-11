package d0322.Ex1;


public class iterativeFactorial {

	public static void main(String[] args) {
		for (int i = 0; i < 10; i++) {
			System.out.println(i + "\t" + factorial(i));
		}

	}

	static long factorial(int n) {
		if (n <= 1) {
			return 1;
		}

		long fact = 1;
		for (int i = 1; i <= n; i++) {
			fact *= i;
		}
		return fact;
	}

}
