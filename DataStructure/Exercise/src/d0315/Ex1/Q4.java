package d0315.Ex1;
//참조 데이터형 예제 call by reference
import java.util.Arrays;

public class Q4 {

	public static void main(String[] args) {
		int[] a= {1,2,3,4,5};
		int[] b; //주소값 동일x
		b = a; //주소값 동일
		
		System.out.println(Arrays.toString(a));
		System.out.println(Arrays.toString(b));
		
		b[1]++;
		
		System.out.println(Arrays.toString(a));
		System.out.println(Arrays.toString(b));
		System.out.println(a==b);

	}

}
