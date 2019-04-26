package d0426;
//다항식 표현
public class Term {
	int coef; //계수
	int exp; //지수
	
	public Term() {
		coef = 0; //계수를 0으로 초기화
		exp = 0; //지수를 0으로 초기화
	}
	
	public Term(int c, int e) {
		coef = c; //계수를 입력받은 매개변수를 초기화
		exp = e; // 지수를 입력받은 매개변수로 초기화
	}
	
	public int getCoef() {
		return coef; //현재계수반환
	}

	public int getExp() {
		return exp; //현재지수반환
	}
	
	public void setCoef(int f) {
		coef = f; //현재계수를 매개변수 값으로 변경
	}
	
	
	public void setExp(int e) {
		exp = e; //현재지수를 매개변수 값으로 변경
	}
	
	public String toString() {
		return "Exp : " + getExp() + " Cof : "+ getCoef(); 
	}
	
	
	
	
	
}
