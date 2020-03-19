package d0604;

public interface Queue {
	public boolean isEmpty();
	public void enqueue(Object x);
	public Object dequeue();
	public void delete();
	public Object peek();
}
