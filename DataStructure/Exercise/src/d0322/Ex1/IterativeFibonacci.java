package d0322.Ex1;


public class IterativeFibonacci {

	public static void main(String[] args) {
		for (int n = 0; n <= 10; n++) {
			long m = fibonacci(n);
			System.out.println("fibonacci (" + n + ") = " + m);
		}
	}

	public static long fibonacci(int n) {
		if (n <= 1) {
			return 1;
		}

		long f0 = 1, f1 = 1, f2 = 2;

		for (int i = 1; i < n; i++) {

			f2 = f0 + f1;
			f0 = f1;
			f1 = f2;
		}
		return f2;

	}

}
