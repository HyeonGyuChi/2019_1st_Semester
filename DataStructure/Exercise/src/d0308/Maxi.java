package d0308;

public class Maxi {

	public static void main(String[] args) {
		int[] num = { 92, 55, 93, 75, 41, 91, 33, 48 };

		int max = 0;
		int min = 100;

		for (int i = 0 ; i < num.length; i++) {

			max = num[i] > max ? num[i] : max;
			min = num[i] < min ? num[i] : min;

		}

		System.out.println("ÃÖ´ñ°ª : " + max);
		System.out.println("ÃÖ´ñ°ª : " + min);

	}

}
