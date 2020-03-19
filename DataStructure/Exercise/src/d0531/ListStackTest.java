package d0531;

public class ListStackTest {

	public static void main(String[] args) {
		ListStack L = new ListStack();
		
		System.out.println("------------ListStack------------");
		System.out.println("<Push>");

		L.push("Ki");
		L.printStack();
		L.push("Lee");
		L.printStack();
		L.push("Park");
		L.printStack();

		System.out.println("<Peek>");
		System.out.println("peek : " + L.peek());
		System.out.println("<Pop>");
		System.out.println("pop : " + L.pop());
		
		L.printStack();
	
		System.out.println("<Delete Test>");
		L.delete();
		
		System.out.println(L.peek());

	}

}
