package d0329;

public class recursiveGCD {

	public static void main(String[] args) {
		int a = 48;
		int b = 84;
		System.out.println("최대공약수 : " + gcd(a, b));

	}

	public static int gcd(int a, int b) {
		if (a == 0) {
			return b;
		}
		return gcd((b % a), a);
	}

}
