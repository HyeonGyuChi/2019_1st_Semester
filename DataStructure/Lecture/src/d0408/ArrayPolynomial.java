package d0408;

public class ArrayPolynomial {

	private int[] coef; // 계수
	private int max; // 최고차항

	public ArrayPolynomial() {
		coef = new int[30]; // 9차수까지 표현할수 있는 다항식
		max = -1; // 초기 생성시 -1 > max == -1 일때 아무것도 없는 항

	}

	public boolean isZeroP() { // 아무것도 없는 항 == 0
		if (max == -1)
			return true;
		else
			return false;
	}

	public int coef(int e) { // 설정한 지수의 계수를 return
		return coef[e];
	}

	public int maxExp() { // 최고차항 return
		return max;
	}

	public void addTerm(int c, int e) { // 현재 다항식에 항 추가
		if (e >= coef.length)
			throw new OverMaxException("addTerm");

		else {
			coef[e] = c;
			if (e > max) // 추가한 차수가 현재 최고차항 보다 클 경우
				max = e;
		}
	}

	public void delTerm(int e) { // 해당차수의 항 제거
		if (e >= coef.length)
			throw new OverMaxException("delTerm");

		else {
			coef[e] = 0;
			while (max >= 0 && coef[max] == 0) { // 만약 최고차항을 제거한다면 max를 조정
				max--;
			}
		}
	}

	public ArrayPolynomial sMulti(int c, int e) throws OverMaxException { // 현재항에 하나의 항 곱하기연산
		if (e >= coef.length) {
			throw new OverMaxException("Polynomical sMulti");
		}

		else {
			ArrayPolynomial r = new ArrayPolynomial();
			for (int i = 0; i <= max; i++) {
				r.addTerm(coef[i] * c, i + e);
			}
			return r;
		}
	}

	public ArrayPolynomial polyAdd(ArrayPolynomial p) { // 두 다항식을 더하기!
		ArrayPolynomial r = new ArrayPolynomial();

		int bigger = max > p.max ? max : p.max;
		for (int i = 0; i <= bigger; i++) {
			r.addTerm(coef[i] + p.coef(i), i);
		}
		return r;

	}

	public ArrayPolynomial polyMul(ArrayPolynomial p) { // 두 다항식 곱하기
		ArrayPolynomial r = new ArrayPolynomial();

		for (int i = 0; i <= p.max; i++) {
			ArrayPolynomial t = this.sMulti(p.coef[i], i);
			r = r.polyAdd(t);
		}
		return r;
	}

	public void printAll() {

		for (int i = 0; i < coef.length; i++) {
			System.out.printf("%4d", i);
		}
		System.out.println();
		for (int i = 0; i < coef.length; i++) {
			System.out.printf("%4d", coef[i]);
		}
		System.out.println();

	}

	public String toString() {
		String strPoly = "";

		for (int i = max; i >= 0; i--) {
			if (coef[i] != 0) {
				if (i == 0) {
					strPoly += "+ " + Integer.toString(coef[i]) + " ";
				} else {
					strPoly += "+ " + Integer.toString(coef[i]) + "x^" + Integer.toString(i) + " ";
				}
			}
		}
		return strPoly;

	}
}
