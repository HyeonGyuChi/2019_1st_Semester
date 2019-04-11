package d0315.Ex1;

//실습2 Point 클래스 정의
class Point {
//1) 맴버변수 int x,y의 값을 가짐
	int x, y;

//2)생성자 : 매개변수 없는 생성자 생성  this()를 사용 : 초기값 0,0 / 매개변수 2개인 생성자 정의
	Point() {
		this(0, 0);
	}

	Point(int x, int y) {
		this.x = x;
		this.y = y;
	}

	public String toString() {
		String s = "(" + x + "," + y + ")";
		return s;
	}

//3)add(~) : 매개변수로 들어온 객채의 데이터를 기존 맴버변수 x,y에 값을 더하는 기능 : 인스턴스메소드 
	public void add(Point p) {
		this.x += p.x;
		this.y += p.y;
	}

//4)Point add(~,~) : 두개의 객체를 매개변수로 받아, 각 객체의 x,y값 더한 객체를 반환 : static메소드	
	public static Point add(Point p1, Point p2) {
		int x, y;
		x = p1.x + p2.x;
		y = p1.y + p2.y;
		Point newPoint = new Point(x, y);
		return newPoint;
	}

}

public class PointEx {

	public static void main(String[] args) {
		Point p1 = new Point();
		Point p2 = new Point(2, 2);
		Point p3;

		System.out.println(p1);
		System.out.println(p2);
		p1.add(p2);
		p3 = Point.add(p1, p2);
		System.out.println(p1);
		System.out.println(p3);
	}
}
