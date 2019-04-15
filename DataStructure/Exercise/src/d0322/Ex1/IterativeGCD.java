package d0322.Ex1;

public class IterativeGCD {

	public static void main(String[] args) {
		int a = 20;
		int b = 4;
		System.out.println("최대공약수 : " + gcd(a, b));
	}

	static int gcd(int a, int b) {
		int temp;

		//if (a > b) { // 입력시 (a<=b)에 따라 실행되므로 처리
			/*
			 * temp = a; a = b; b = temp; }
			 * 
			 * while (true) { int r = b % a;
			 * 
			 * b = a; a = r;
			 * 
			 * if (r == 0) { break; }
			 * 
			 * }
			 * 
			 * return b;
			 * 
			 */

			while (a % b != 0) {
				int r = a % b;
				a = b;
				b = r;
			}

			return b;
		}
	}

