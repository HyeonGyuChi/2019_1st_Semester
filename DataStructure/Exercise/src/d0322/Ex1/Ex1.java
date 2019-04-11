package d0322.Ex1;


public class Ex1 {

	public static void main(String[] args) {
		int line = 4;
		for (int i = 0; i < line; i++) {
			for (int j = 1; j < line - i; j++) {
				System.out.print(" ");
			}

			for (int k = 0; k < i * 2 + 1; k++) {
				System.out.print("*");
			}

			System.out.println("");
		}

	}

}
