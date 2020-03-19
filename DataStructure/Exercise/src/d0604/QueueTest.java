package d0604;

public class QueueTest {

	public static void main(String[] args) {
		ArrayQueue Q = new ArrayQueue();
/*
		Q.enqueue("A");
		Q.enqueue("B");
		Q.enqueue("C");
		Q.enqueue("D");
		Q.enqueue("E");
		Q.queuePrint();
		Q.delete();
		Q.queuePrint();
		Q.enqueue("F");
		Q.queuePrint();
		Q.delete();
		Q.queuePrint();
		System.out.println("Q.dequeue :" + Q.dequeue());
		System.out.println("Q.dequeue :" + Q.dequeue());
		System.out.println("Q.dequeue :" + Q.dequeue());
		System.out.println("Q.peek :" + Q.peek());
		Q.queuePrint();
*/
		
		Q.enqueue("A");
		Q.enqueue("B");
		Q.enqueue("C");
		Q.enqueue("D");
		Q.enqueue("E");
		Q.enqueue("F");
		Q.delete();
		Q.queuePrint();
		System.out.println("dequ : " + Q.dequeue());
	}

}
