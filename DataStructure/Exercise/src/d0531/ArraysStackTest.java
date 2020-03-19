package d0531;

public class ArraysStackTest {

	public static void main(String[] args) {
		ArrayStack A = new ArrayStack();

		System.out.println("------------ArrayStack------------");
		System.out.println("<Push>");

		A.push("Kim");
		A.printStack();
		A.push("Lee");
		A.printStack();
		A.push("Park");
		A.printStack();

		System.out.println("<Pop>");
		System.out.println("pop : " + A.pop());
		System.out.println("pop : " + A.pop());
		A.printStack();

		System.out.println("<Delete Test>");
		A.delete();
		A.printStack();

		for (int i = 0; i < 50; i++) {
			A.push("Kim");}
		A.printStack();
		
	}

}
