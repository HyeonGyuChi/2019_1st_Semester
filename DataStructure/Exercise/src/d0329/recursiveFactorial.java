package d0329;

public class recursiveFactorial {

	public static void main(String[] args) {
		for (int i = 0; i < 10; i++) {
			System.out.println(i + "\t" + factorial(i));
		}

	}

	public static long factorial(int i) {
		if (i == 0) {
			return 1;
		} else {
			return i * factorial(i - 1);
		}

	}

}
