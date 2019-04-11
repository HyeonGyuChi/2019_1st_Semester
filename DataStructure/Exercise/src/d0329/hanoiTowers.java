package d0329;

public class hanoiTowers {

	public static void main(String[] args) {
		int numTowers = 3;

		hanoi(numTowers, 'A', 'C', 'B'); // 원반 3개를 A에서 C로 옮기는데 
	}

	public static void hanoi(int n, char x, char y, char z) { //x = 시작 / y = 도착 / z = 임시
		if (n == 1) // 옮길 개수가 하나밖에 없다면 바로 시작에서 도착으로 옮기기 == 제일 밑에 있는 원반
			System.out.println("disk 1 : " + x + "--->" + y);
		else { // 옮길 개수가 두개 이상일 때(n-1개)
			hanoi(n - 1, x, z, y); // 옮길개수의 n-1개룰 시작에서 임시에 옮긴다.
			System.out.println("disk " + n + " : " + x + "--->" + y); // 그리고  시작에 남은 1개를 도착으로 옮긴다.
			hanoi(n - 1, z, y, x); // 옮긴 n-1개를 임시에서 도착으로 옮긴다.
		}
	}

}
