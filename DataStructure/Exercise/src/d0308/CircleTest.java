package d0308;


class Point {

	public int x;
	public int y;

// Poin클래스를 선언하고 매개변수 2개를 받는 생성자 정의
	public Point(int x, int y) {
		this.x = x;
		this.y = y;
	}

	public String toString() {
		String t = "(" + x + "," + y + ")";
		return t;
	}
}

class Circle {
	public int radius = 0;
	public Point center;

//매개변수 2개를 받는 생성자 정의(멤버변수인 center, radius에 매개변수 대입)
	public Circle(Point center, int radius) {
		this.center = center;
		this.radius = radius;
	}

	public void print() {
		System.out.println("center = " + center);
		System.out.println("radius = " + radius);
	}

}

public class CircleTest {

	public static void main(String[] args) {
		Point p = new Point(25, 78);
		Circle c = new Circle(p, 10);
		c.print();
	

	}

}
