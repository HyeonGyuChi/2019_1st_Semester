package d0322.Practice;

import java.util.Random;

public class TheBinsearch {

	public static void main(String[] args) {
		int arr[] = new int[100]; // 100개의 오름차순으로 정렬된 데이터를 담을 수 있는 배열
		randomFill(arr);

		UpSort(arr); // 오름차순 정렬
		System.out.println(BinSearch(arr, 1)); // 이원탐색

		for (int e : arr) { // 배열출력
			System.out.println(e);
		}

	}

	// 무작위의 데이터 배열에 채우기
	public static void randomFill(int[] arr) {
		Random r = new Random();

		for (int i = 0; i < arr.length; i++) { // 0~999 사이의 random값
			arr[i] = r.nextInt(10);
		}

	}

	// 데이터 정렬
	public static void StartSort(int arr[]) {

		for (int i = 0; i < arr.length - 1; i++) { // 총 횟수
			int minIndex = i;
			int temp;

			for (int j = i+1; j < arr.length; j++) { // 비교할 인덱스를 제외하고 접근
				if (arr[minIndex] >= arr[j]) {
					minIndex = j;
				}

				temp = arr[i];
				arr[i] = arr[minIndex];
				arr[minIndex] = temp;
			}
		}
	}

	public static int BinSearch(int arr[], int key) {
		return binSearch(arr, key, 0, arr.length);
	}

	public static int binSearch(int arr[], int key, int left, int right) {

		if (left > right) { // 찾는 값 없음
			return -1;
		}

		else {
			int mid = (left + right) / 2;

			if (key == arr[mid])
				return mid;
			else if (key < arr[mid]) {
				return binSearch(arr, key, left,mid - 1);
			} else
				return binSearch(arr, key, mid + 1, right);

		}
	}

	// 데이터 오름차순 정렬
	public static void UpSort(int arr[]) {
		// StartEndSort(arr, 0, arr.length);
		StartSort(arr);
	}

	// 최대값 = end 최소값 = start 정렬 // -> 실패 ㅠㅠ
	public static void StartEndSort(int arr[], int start, int end) {
		if (end - start <= 1) { // 더이상 정렬할 인덱스 x
			return;
		}

		else {

			int minIndex = start;
			int maxIndex = start;
			int temp;

			for (int i = start; i < end; i++) {

				if (arr[maxIndex] <= arr[i]) {

					maxIndex = i;
				}

				if (arr[minIndex] >= arr[i]) {
					minIndex = i;
				}
			}

			if (maxIndex == minIndex) { // 정렬완료
				return;
			}

			else {
				temp = arr[start];
				arr[start] = arr[minIndex];
				arr[minIndex] = temp;

				temp = arr[end - 1];
				arr[end - 1] = arr[maxIndex];
				arr[maxIndex] = temp;

				StartEndSort(arr, ++start, --end);
			}
		}
	}
}
