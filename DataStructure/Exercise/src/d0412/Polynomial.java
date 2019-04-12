package d0412;

public class Polynomial {

	private int[] coef;
	private int max;

	public Polynomial() {
		coef = new int[100];
		max = -1;
	}

	public boolean isEmpty() { // 비어있는 배열인가?
		return coef.length == 0 ? true : false;
	}

	public int maxExp() {
		return max;
	}

	public int maxCoef() {
		return coef[max];
	}

	public void addTerm(int c, int e) { // c = 계수 e = 지수(배열인덱스)
		coef[e] += c; // 원래있던 값 + 현재 값
		if (e > max) { // 더하는 항이 현재 max값보다 크다면 max값 조정
			max = e;
		}
	}

	public void delTerm(int e) {
		coef[e] = 0;
		if (e == max) { // 지울 항과 현재항의 max값이 같다면 max값조정
			while (coef[max--] == 0) { // max값이 어떤값이 있을 때까지 줄여나가기
			}
		}
	}

	public Polynomial multiTerm(int c, int e) { // 식에 한개의 항 곱하기
		Polynomial n = new Polynomial();
		for (int i = 0; i <= max; i++) {
			n.addTerm(coef[i] * c, i + e); // 현재식에서 각각의 c값을 곱해서 지수 +e 만큼 옮겨서 저장
		}
		return n;
	}

	public Polynomial addPoly(Polynomial p) { // 식끼리 더하기
		Polynomial n = new Polynomial(); // 각각 식끼리 같은 지수끼리 더해주기
		int bigger = this.max > p.max ? this.max : p.max; // 더 큰 지수를 가진 항을 기준으로 더해주기
		for (int i = 0; i <= bigger; i++) {
			n.addTerm(this.coef[i] + p.coef[i], i);
		}
		return n;
	}

	public Polynomial multiPoly(Polynomial p) { // 식끼리 곱하기
		Polynomial n = new Polynomial(); // 현재의 식에서 하나씩 곱해줄 식의 각 항마다 곱해서 더하기
		for (int i = 0; i <= p.max; i++) {
			Polynomial t = new Polynomial(); // t 객체 계속 초기화
			t = this.multiTerm(p.coef[i], i); // 현재식에서 곱해줄 식의 각 항씩 곱하기
			//for (int j = 0; j <= t.max; j++) {
				n = n.addPoly(t); // 각 항마다 곱해준 각각의 식을 더하기}
			//}
		}
		return n;
	}

	public void print() { // (부호)계수x^지수
		for (int i = max; i >= 0; i--) {// 큰 항부터 표기
			if (coef[i] == 0) { // 계수가 없을 때
				continue;
			}

			else { // 표시할 계수가 있는경우
				if (i == 0) { // x항이 없을 때 > (부호)계수
					if (coef[i] < 0) { // 음수일때만 부호안찍어주기 > 왜? 어차피 integer값으로 앞에 -부호가 찍힐것
						System.out.print(" " + coef[i]);
					} else {
						System.out.print(" +" + coef[i]);
					}
				}

				else { // x항이 있을 때{
					if (coef[i] < 0) {
						System.out.printf(" %dx^%d", coef[i], i);
					} else {
						System.out.printf(" +%dx^%d", coef[i], i); // 양수는 그냥찍으면 안찍히니까 앞에 +추가
					}

				}
			}
		}
		System.out.println();
	}

}
