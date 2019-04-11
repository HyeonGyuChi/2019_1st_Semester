package d0322.Ex1;


public class IterativeBinarySearch {

	public static void main(String[] args) {
		int[] a = { 10, 20, 30, 40, 50, 60, 70, 80, 90 };
		int n = a.length - 1;
		int target_key = 30;

		int result = binarySearch(a, 0, n, target_key);
		System.out.println("target_key position :" + result);
	}

	public static int binarySearch(int[] arr, int left, int right, int key) {
		int mid;

		while (left <= right) {
			mid = (left + right) / 2;

			if (key == arr[mid]) {
				return mid;
			}

			else if (key > arr[mid]) {
				left = mid + 1;
			}

			else {
				right = mid - 1;
			}

		}

		return -1;

	}

}
