package Chap_1;

public class CalFormula {
	private String exp; // 수식
	private int expSize; // 수식의 길이
	private char symbol; // 여는 괄호
	private char pairs; // 닫는 괄호

	public boolean parenTest(String exp) {
		ListStack stack = new ListStack();

		this.exp = exp;
		expSize = this.exp.length();

		for (int i = 0; i < expSize; i++) {
			symbol = exp.charAt(i);
			switch (symbol) {
			case '(':
			case '{':
			case '[':
				stack.push(symbol); // 열린괄호는 push
				break;
			case ')':
			case '}':
			case ']':
				if (stack.isEmpty()) // 더이상 pop할께 없음 == 닫힌괄호가 더 많음
					return false;
				else {
					pairs = stack.pop(); // 짝 검사 == 닫힌괄호는 pop

					if ((pairs == '(') && (symbol == ')'))
						break;
					else if (pairs == '[' && (symbol == ']'))
						break;
					else if (pairs == '{' && (symbol == '}'))
						break;
					else
						return false;
				}
			}
		}
		if (stack.isEmpty()) // 열린괄호가 더 있을 경우 check
			return true;
		else
			return false;
	}

// 후기 표기식 변환을 위한 우선순위
	public int PIS(char y) {
		int n = 0;
		if (y == '*' || y == '/')
			n = 2;
		else if (y == '+' || y == '-')
			n = 1;
		else if (y == '(')
			n = 0;
		else if (y == '^')
			n = 3;
		return n;
	}

	public int PIE(char y) {
		int n = 0;
		if (y == '*' || y == '/')
			n = 2;
		else if (y == '+' || y == '-')
			n = 1;
		else if (y == '(')
			n = 4;
		else if (y == '^')
			n = 3;
		return n;
	}

	/*
	 * 수식을 만날때 pop 과 push를 결정 지금당장 처리해야 할 때 == pop // 연산자를 계속 push하다 당장처리해야할때에 따라
	 * pop 스택의우선순위 >= 수식의우선순위 다중에 처리해야 할 때 == push
	 * 
	 * ps. '('의 경우 push 하고 ')'로 닫힐 때 안에있는 식 계산 == ')'만나면 '('까지 pop
	 * 
	 * 모든식이 끝나면 stack모두 pop
	 * 
	 */
	public void convPostfix(String exp) {
		ListStack stack = new ListStack();

		char symbol;
		this.exp = exp;
		expSize = exp.length();

		for (int i = 0; i < expSize; i++) {
			symbol = exp.charAt(i);

			switch (symbol) {
			case '0':
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
				System.out.print(symbol);
				break;
			case '(':
			case '+':
			case '-':
			case '*':
			case '/':
				while (PIS(stack.peek()) >= PIE(symbol)) // '('in stack = 0이므로 무조건 push ')'
					System.out.print(stack.pop());
				stack.push(symbol);
				break;
			case ')':
				while (stack.peek() != '(')
					System.out.print(stack.pop());
				stack.delete(); // '('를 제거
				break;
			}
		}

		while (!stack.isEmpty()) { // 중위식 끝
			System.out.print(stack.pop());
		}
	}

}
