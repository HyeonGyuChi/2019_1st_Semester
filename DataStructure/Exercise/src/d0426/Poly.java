package d0426;

// 다항식
public class Poly {
	private int element_Num; // 다항식의 항의 개수
	private Term termArray[]; // Term타입의 1차원 배열
	private int MAX; // 다항식 항의 최대갯수

	public Poly() {
		element_Num = 0;
		MAX = 50;
		termArray = new Term[MAX]; // Term의 배열
	}

	public boolean isEmpty() { // 현재 식이 존재하는지 안하는지 표현
		if (element_Num == 0) // 다항식의 항의개수가 0이면
			return true; // empty

		else
			return false;
	}

	// coef : 계수 / Exp : 지수
	public void addTerm(int coef, int Exp) { // 항 삽입
		Term e1 = new Term(coef, Exp);

		if (isEmpty() == true) { // 식이 존재하지않는다면 == 항이 아무것도 없다면
			termArray[element_Num++] = e1; // append작업 필요없이 그냥 배열에 추가 그리고 항개수 증가
		}

		else {

			for (int i = 0; i < element_Num; i++) { // 가지고 있는 항의 개수만큼 반복(== termArray[]의 크기만큼 반복 i의 마지막은 배열의 마지막index)
				// 입력받은 지수의 크기에 따라 배열의 위치가 정해짐
				if (termArray[i].getExp() < Exp) { // 입력받은 지수가 가지고있는 항의 지수보다 크다면 뒤로 하나씩 밀고, 그곳에 데이터 넣어주기!
					for (int j = element_Num; j > i; j--) { // 먼저 하나씩 뒤로 밀어주기
						termArray[j] = termArray[j - 1]; // 전에 있던 항들을 그 다음항으로 교체
					}
					termArray[i] = e1; // 모두 밀어주었으므로 그 곳에 데이터 넣기!
					element_Num++; // 데이터 추가하였으므로 항개수 증가

					return;
				}

				else if (termArray[i].getExp() == Exp) { // 지수가 같을경우 연산 후 저장
					termArray[i].setCoef(termArray[i].getCoef() + coef); // 가지고있는 계수와 지금입력받은 계수를 더함
					return;
				}
			}
			termArray[element_Num++] = e1; // 가지고 있는 항중 들어오는 지수가 가장 낮을 때 //가장 마지막(배열의 마지막)에 원소저장 후 다항식 개수 증가
		}
	}

	public void printPoly() { // 다항식 출력
		if (isEmpty() == true) { // 다항식이 있을경우 => 출력할 필요 x
			System.out.println("다항식이 없습니다.");
		} else { // 다항식이 있을경우 => 출력하자!
			for (int i = 0; i < element_Num; i++) { // 배열 처음부터 모두탐색하면서 각 객체들을 접근
				if (termArray[i].getExp() == 0) { // 지수가 없을 때, 양수일 때와 음수일 때를 구분
					if (termArray[i].getCoef() > 0) { // 계수가 양수일 때
						System.out.printf(" +%d", termArray[i].getCoef());
					}

					else if (termArray[i].getCoef() < 0) { // 계수가 음수일 때
						System.out.printf(" %d", termArray[i].getCoef());
					}

				} else { // 지수가 있을 때, 양수와 음수일 때를 구분
					if (termArray[i].getCoef() > 0) { // 계수가 양수일 때
						System.out.printf(" +%dx^%d", termArray[i].getCoef(), termArray[i].getExp());
					}

					else if (termArray[i].getCoef() < 0) { // 계수가 음수일 때
						System.out.printf(" %dx^%d", termArray[i].getCoef(), termArray[i].getExp());
					}

				}
			}

			System.out.println();
		}

	}

	public Term[] terms() {
		return termArray;
	}

	public Poly addPoly(Poly B) {
		Poly C = new Poly();

		int i = 0;
		int j = 0;

		while (i < this.element_Num && j < B.element_Num) { // 두항중 최대항이 더 작은 항까지 접근 // 인덱스를 하나씩 증가시키면서 비교
			if (termArray[i].getExp() > B.termArray[j].getExp()) { // 현재 접근한 항의 지수값이 접근한 B의 지수값보다 클경우
				C.addTerm(termArray[i].getCoef(), termArray[i].getExp()); // 더 큰 지수를 가지고있는 this의 항을 추가(두개의 Poly중 this의 항
																			// 하나만 복사)
				i++; // 현재항을 처리했으므로 다음인덱스로
			}

			else if (termArray[i].getExp() == B.termArray[j].getExp()) { // 같은 지수값을 가지고 있을경우 두개의 항의 계수를 더하기
				C.addTerm(termArray[i].getCoef() + B.termArray[j].getCoef(), termArray[i].getExp());
				i++;
				j++;
			}

			else { // 현재항이 가지고있는 지수값이 더 작을 경우
				C.addTerm(B.termArray[j].getCoef(), B.termArray[j].getExp());
				j++;
			}

			
		}
		
		for (int k = j; k < B.element_Num; k++) { // 위의 while문은 원소개수가 더 작은 Poly를 기준으로 종료되므로 나머지 항들에 대해 추가해주어야 함
			C.addTerm(B.termArray[j].getCoef(), B.termArray[j].getExp());
		}
		
		for (int k = i; k < element_Num; k++) {
			C.addTerm(termArray[i].getCoef(), termArray[i].getExp());
		}
		
		return C;

	}
	
	public Poly multiTerm(int coef, int exp) {
		Poly x = new Poly();
		for (int i = 0; i < element_Num; i++) { //현재 항을 기준으로 완전탐색하면서 계수는 서로 곱하고 지수는 서로 더하기
			x.addTerm(termArray[i].getCoef()*coef, termArray[i].getExp()+exp);
		}
		x.element_Num = this.element_Num;
		return x;
	}
	
	public Poly multiPoly(Poly A) {
		Poly Total = new Poly();
		for(int i = 0; i < element_Num; i++) {
			for(int j = 0; j < A.element_Num; j++) { // 이중 FOR문 multiTerm
				Total.addTerm(termArray[i].getCoef()*A.termArray[j].getCoef(), termArray[i].getExp() + A.termArray[j].getExp());
			}
			
			
			/*Poly temp = new Poly();
			temp = A.multiTerm(termArray[i].getCoef(), termArray[i].getExp());
			Total = Total.addPoly(temp);*/
		}
		
		return Total;
	}
}
