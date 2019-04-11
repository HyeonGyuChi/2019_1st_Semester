package d0315.Ex2;

//데이터 오름차순 내림차순 정렬 >> 이름과 점수를 갖는 student객체를 정렬해보기(객체배열에 저장하여 sorting해보기)
public class StudentEx {

	public static void main(String[] args) {
		int score[] = { 20, 54, 6, 25, 4, 3, 1, 0, 20, 11 };

		int temp = 0;
		int maxIndex = 0;
		// 배열에서 가장 큰 데이터의 인덱스 찾기
		for (int i = 0; i < score.length - 1; i++) {
			maxIndex = i;

			for (int j = maxIndex; j < score.length; j++) {
				if (score[maxIndex] < score[j]) {
					maxIndex = j;

				}
			}

			temp = score[i];
			score[i] = score[maxIndex];
			score[maxIndex] = temp;

		}
		// max가 가르키는 인덱스의 데이터값과 현재인덱스위치의 값을 바꿈

		// score출력
		for (int i = 0; i < score.length; i++) {
			System.out.print(score[i] + " ");
		}

	}

}
