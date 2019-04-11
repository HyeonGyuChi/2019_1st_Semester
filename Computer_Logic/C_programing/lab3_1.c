#include <stdio.h>

void lab3_1()
{
	signed char a = 10; // 00001010 / signed char 이므로 1byte = 8bit 표현정수범위 : -(2의 7승) ~ 2의 7승 - 1
	signed char b = 15; // 00000111
	signed char result;

	result = a & b;
	printf("a AND b 연산 : %d\n", result); 
	/* a = 00001010
	   b = 00001111 &
	   ------------
  result = 00001010
		
		result = 10
	   &는 모두 1일경우에만 1, 하나라도 0이면 0
	   */
	

	result = a | b;
	printf("a OR b 연산 : %d\n", result);
	/* a = 00001010
	   b = 00001111 |
	   ------------
  result = 00001111

	   result = 15
	   |는 하나라도 1이면 1
	   */

	result = a ^ b;
	printf("a XOR b 연산 : %d\n", result);
	/* a = 00001010
	   b = 00001111 ^
	   ------------
  result = 00000101

	   result = 5
	   ^는 서로 다르면 1, 서로같으면 0
	   */


	result = ~a;
	printf("NOT a 연산 : %d\n", result);
	/* a = 00001010 ~
	   ------------
  result = 11110101
	   
	   result = -11
	   ~은 0->1 1->0으로 바꿈

	   signed char이므로 2의보수 표현법을 사용한다. 그러므로 msb의 값이 1이므로 음수
	   양수->음수를 바꿀 때 2의보수를 사용했으므로
	   음수->양수로 바꿀때는 위 방법의 반대로 진행한다.
	   먼저 -1 : 11110100
	   1의보수 : 00001011 -> 11
		   
	   음수->양수로 변환한 값이 11이므로 result = -11
	   */

	
}