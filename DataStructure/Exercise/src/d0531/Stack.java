package d0531;

public interface Stack {
	public boolean isEmpty(); // 스택의 공백검사
	public void printStack(); // 출력
	public void push(Object x); // 스택에 원소 x 삽입
	public Object pop(); // 스택의 Top원소 삭제반환
	public void delete(); // 스택 Top원소 삭제
	public Object peek(); // 스택의 Top원소 검색 
}
