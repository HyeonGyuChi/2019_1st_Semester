package d0308;

public class Plus {

	public static void main(String[] args) {
		int sum = 0;
		for(int i = 1; i <= 5; i++) {  //외부+
			System.out.print("(");
			
			for(int j = 1; j <= i;  j++) {  //내부+
				sum += j;
				System.out.print(j);
				if (i != j) {
					System.out.print("+"); //마지막에만 +추가 x
				}
			}
			System.out.print(")");
			if (i != 5) { //마지막에만 +추가 x
				System.out.print("+");
			}
		}

		
		System.out.print("=");
		System.out.println(sum);
	}

}
