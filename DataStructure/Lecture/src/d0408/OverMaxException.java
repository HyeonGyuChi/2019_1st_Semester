package d0408;

public class OverMaxException extends RuntimeException {
	public OverMaxException() {
		super();
	}

	public OverMaxException(String msg) {
		super("접근할 수 있는 최고차항을 넘었습니다." + msg);
	}
}
