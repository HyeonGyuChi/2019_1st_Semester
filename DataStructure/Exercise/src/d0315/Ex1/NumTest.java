package d0315.Ex1;

//과제 pro_value() pro_ref1() pro_ref2()의 값과 어떻게 실행되는지 word로 작성하여 제출
/*alt + 방향키 = 이동
ctrl + shtft + / = 주석처리  /*
ctrl + / = 주석처리 //
ctrl + alt +위아래 = 줄복사
*/
class Num {

	public int number; //Num의 인스턴스 변수

	Num(int number){
		this.number = number; //매개변수 1개를 입력받아 인스턴스 변수를number를 초기화하는 생성자
	}
	
}

public class NumTest{
	
	static void value(int b) {//2. 매개변수인 b를 a의 값인 1로 초기화
		b=2; //3. b를 2로 초기화
	}
	
	public static void pro_value() {
		int a = 1; 
		value(a); //1. value()의 매개변수로 a의 값인 1 전달 = call by value
		System.out.println("pro_value , " + a); //4. a는 b는 다른변수이므로 b의 값 변동이 a의 값에 영향을 주지 않는다. (a=1)
	}
	
	
	
	static void ref1(Num b) { //3. b를 a가 참조하는 객체의 주소값으로 초기화(같은 객체를 참조)
 		b = new Num(2); // 4. Num(2)라는 새로운 객체생성하여 b로 참조 : b는 더이상 a와 같은 객체를 참조하지 않고 새로운 객체를 참조하게 된다.
	}
	
	public static void pro_ref1() {
		Num a = new Num(1); //1. Num(1) 객체생성 후 a로 객체참조
		ref1(a); //2. ref1()의 매개변수로 a가 참조하는 객체의 주소값 전달 = call by reference
		System.out.println("a :" + a.hashCode());
		System.out.println("pro_ref1 , " + a.number); //5. a와 b는 서로다른 객체를 참조하므로 a객체의 number = 1
	}
	
	
	
	static void ref2(Num b) { //3. b를 a가 참조하는 객체의 주소값으로 초기화(같은 객체를 참조)
		b.number = 2; //4. a와 b는 같은 객체를 참조 -> 객체의 인스턴스 변수인 number를 2로 초기화
	}
	
	public static void pro_ref2() {
		Num a = new Num(1); //1. Num(1) 객체생성 후 a로 객체참조
		ref2(a); //2. ref1()의 매개변수로 a가 참조하는 객체의 주소값 전달 = call by reference
		System.out.println("pro_ref2, " + a.number); //5. b와 a는 서로 같은 객체를 참조하므로 2가 출력된다.
	}
	
	public static void main(String[] args) {
		
		pro_value(); //call by value
		pro_ref1(); //call by reference
		pro_ref2(); //call by reference

	}

}
