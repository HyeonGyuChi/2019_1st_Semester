package d0405;

import java.util.Arrays;

public class List {

	private char[] items;
	private int size;

	public List() {
		items = new char[100];
		size = 0;
	}

	public boolean isEmpty() {
		if (size == 0)
			return true;

		else
			return false;
	}

	public int length() {
		return size;
	}

	public char retrieve(int i) {
		return items[i];
	}

	public void append(char c) {
		items[size] = c;
		size++;
	}

	public void insert(char c, int i) {
		for (int j = size; j > i; j--) {
			items[j] = items[j - 1];
		}

		items[i] = c;
		size++;
	}

	public void replace(char c, int i) {
		items[i] = c;
	}

	public void delete(int i) {
		for (int j = i; j < size; j++) {
			items[j] = items[j + 1];
		}
		size--;
		items[size] = ' '; //char 초기화 == 일반적으로 공백 or 기본값인 '\u0000' char타입의 널문자로 초기화
	}

	public int index(char c) {
		int index = 0;
		for (char ch : items) {
			if (ch == c) {
				return index;
			}
			index++;
		}

		return -1;
	}

	public void print() {
		System.out.println("Array =" + Arrays.toString(items));
		System.out.println("size = " + length());

	}

}
