package d0308;

import java.util.Arrays;

class Person {

	int[] score = new int[3];
	double avg;
	char grade;

	public Person() {
//score를 0으로 초기화
		for (int i = 0; i < score.length; i++) {
			score[i] = 0;
		}
	}

//배열을 매개변수로 받아 score에 대입
	public Person(int[] score) {
		this.score = score;
	}

//score의 값들의 평균을 return
	public double average() {
		int sum = 0;
		for (int i : score) {
			sum += i;
		}

		avg = (double)sum / score.length;
		return avg;
	}

//배열을 매개변수로 받아 score에 대입
	public void getScore(int[] score) {
		this.score = score;
	}
//grade 학점계산
	public char grade() {
		switch ((int) avg / 10) {

		case 10:
		case 9:
			grade = 'A';
			break;

		case 8:
			grade = 'B';
			break;
		case 7:
			grade = 'C';
			break;
		case 6:
			grade = 'D';
			break;
		default:
			grade = 'F';

		}
		
		return grade;
	}
	
	public String toString() {
		return Arrays.toString(this.score);
	}
}

public class Grade {

	public static void main(String[] args) {
		int[] score = { 54, 97, 88 };
		Person person1 = new Person();
		Person person2 = new Person(score);
		
		System.out.println("첫번째 객체 : " + person1);
		System.out.println("두번째 객체 : " + person2);
		
		int[] push = {88,90,84};
		
		person1.getScore(push);
		
		System.out.println("첫번째 객체 : " + person1);
		System.out.println("두번째 객체 : " + person2);

		System.out.println("첫번째 객체 평균 : " + person1.average());
		System.out.println("두번째 객체 평균 : " + person2.average());

		System.out.println("첫번째 객체 학점 : " + person1.grade());
		System.out.println("두번째 객체 학점 : " + person2.grade());
	}

}
