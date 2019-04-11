package d0315.Ex1;
//String데이터형 예제
public class Q5 {

	public static void main(String[] args) {
		String name1 = new String("자료구조");
		String name2 = new String("자료구조");
		String name3 = "자료구조";
		String name4 = "자료구조";
		
		//참조값 비교
		System.out.println("name1, name2 > " + (name1 == name2));
		System.out.println("name3, name4 > " + (name3 == name4)); //문자리터럴 영역에 의해 자바가 자동으로 같은 참조값을 가짐
		System.out.println("name1, name2 equals> " + name1.equals(name2));
		
		name2 = name1;
		System.out.println("name1, name2 > " + (name1==name2));
	}

}
