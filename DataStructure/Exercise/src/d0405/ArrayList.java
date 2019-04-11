package d0405;

public class ArrayList {

	public static void main(String[] args) {
		List l = new List();
		System.out.println(l.isEmpty());
		l.append('a');
		l.append('b');
		l.append('c');
		l.append('d');
		System.out.println(l.length());
		System.out.println(l.isEmpty());
		l.print();
		System.out.println(l.retrieve(1));
		l.insert('x', 1);
		l.print();
		l.insert('y', 3);
		System.out.println(l.retrieve(1));
		l.print();
		l.delete(1);
		l.print();
		l.replace('z', 2);
		l.print();
		l.delete(2);
		l.print();
		
		
	}

}
