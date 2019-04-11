package d0329;

public class recursiveBinarySearch {

	public static void main(String[] args) {
		int[] a = { 10, 20, 30, 40, 50, 60, 70, 80, 90 };
		int n = a.length - 1;
		int target_key = 30;

		int result = binarySearch(a, target_key, n);
		System.out.println("target_key position : " + result);
	}

	public static int binarySearch(int[] arr, int key, int right) {
		return thebinarySearch(arr, key, 0, right);
	}

	private static int thebinarySearch(int[] arr, int key, int left, int right) {
		if (left > right) {
			return -1;
		} else {
			int mid = (left + right) / 2;
			if (key == arr[mid]) {
				return mid;
			} else if (key < arr[mid]) {
				return thebinarySearch(arr, key, left, mid - 1);
			} else
				return thebinarySearch(arr, key, mid + 1, right);
		}

	}

}
