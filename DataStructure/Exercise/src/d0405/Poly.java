package d0405;

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
	public void addTerm(float coef, int Exp) { // 항 삽입
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
						System.out.printf(" +%.1f", termArray[i].getCoef());
					}

					else if (termArray[i].getCoef() < 0) { // 계수가 음수일 때
						System.out.printf(" -%.1f", termArray[i].getCoef());
					}

				} else { // 지수가 있을 때, 양수와 음수일 때를 구분
					if (termArray[i].getCoef() > 0) { // 계수가 양수일 때
						System.out.printf(" +%.1fx^%d", termArray[i].getCoef(), termArray[i].getExp());
					}

					else if (termArray[i].getCoef() < 0) { // 계수가 음수일 때
						System.out.printf(" %.1fx^%d", termArray[i].getCoef(), termArray[i].getExp());
					}

				}
			}

			System.out.println();
		}

	}

	public Term[] terms() {
		return termArray;
	}
}
