package d0329;

public class resursivePalindrome {

	public static void main(String[] args) {
		String x = "level";
		String y = "abbccbba";
		String z = "abccda";

		System.out.println(ispalindrome(x));
		System.out.println(ispalindrome(y));
		System.out.println(ispalindrome(z));

	}

	public static boolean ispalindrome(String s) {
		return thepalindrome(s, 0, s.length() - 1);
	}

	private static boolean thepalindrome(String s, int left, int right) {
		if (left > right) {
			return true;
		}

		if (s.charAt(left) == s.charAt(right)) {
			return thepalindrome(s, left + 1, right - 1);
		}

		return false;
	}

	private static boolean thepalindrome2(String s, int left, int right) {

		if (left <= right) {
			if (s.charAt(left) == s.charAt(right)) {
				return thepalindrome(s, left + 1, right - 1);
			}

			return false;
		}
		return true;
	}

}
