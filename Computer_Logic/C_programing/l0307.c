#include <stdio.h>
#include <limits.h> //정수형 데이터타입의 최소값(MIN) 최대값(MAX) 상수 제공 라이브러리
#include <float.h> //실수형 데이터 최소 최대값

void a1() {
	//영역잡고 컨트롤 k c 하면 주석
	short num1 = 2;
	int num2 = 4;
	long num3 = 4;
	float num4 = 1.4;
	double num5 = 2.5;
	char c1;

	printf("-----------자료형과 변수의 메모리 크기---------\n");
	printf("char\t 자료형의 크기 = %dbyte\t메모리 크기 = %dbyte\n", sizeof(char), sizeof(c1));
	printf("short\t 자료형의 크기 = %dbyte\t메모리 크기 = %dbyte\n", sizeof(char), sizeof(num1));
	printf("int\t 자료형의 크기 = %dbyte\t메모리 크기 = %dbyte\n", sizeof(int), sizeof(num2));
	printf("long\t 자료형의 크기 = %dbyte\t메모리 크기 = %dbyte\n", sizeof(long), sizeof(num3));
	printf("float\t 자료형의 크기 = %dbyte\t메모리 크기 = %dbyte\n", sizeof(float), sizeof(num4));
	printf("double\t 자료형의 크기 = %dbyte\t메모리 크기 = %dbyte\n", sizeof(double), sizeof(num5));
}

void a2() {
	printf("char\t의 최소값\t%d, 최대값\t%d\n", CHAR_MIN, CHAR_MAX);
	printf("short\t의 최소값\t%d, 최대값\t%d\n", SHRT_MIN, SHRT_MAX);
	printf("int\t의 최소값\t%d, 최대값\t%d\n", INT_MIN, INT_MAX);
	printf("long\t의 최소값\t%d, 최대값\t%d\n", LONG_MIN, LONG_MAX);
}

void a3() {
	printf("float\t\t의 최소값\t%Le, 최대값\t%Le\n", FLT_MIN, FLT_MAX);
	printf("double\t\t의 최소값\t%Le, 최대값\t%Le\n", DBL_MIN, DBL_MAX);
	printf("long double\t의 최소값\t%Le, 최대값\t%Le\n", LDBL_MIN, LDBL_MAX);
}

void a4() {
	printf("unsugined char의 최대값 %d\n", UCHAR_MAX);
	printf("unsugined short의 최대값 %d\n", USHRT_MAX);
	printf("unsugined int의 최대값 %d\n", UINT_MAX);
	printf("unsugined long의 최대값 %d\n", ULONG_MAX);
}

void a5() {
	signed char char1 = 130; //-128~127 / (+3만큼)
	unsigned char char2 = 130; //0~255 
	printf("------ over flow ----- \n"); 
	printf("%d\n", char1);
	printf("%d\n", char2);

	char1 = 127;
	char2 = -1; //underflow(-1만큼)

	printf("------ under flow ----- \n");
	printf("%d\n", char1);
	printf("%d\n", char2);

}

void a6() {
	signed char char1 = -129; //(under flow -1만큼)
	signed char char2 = 128; //(overflow +2만큼)
	printf("%d\n", char1);
	printf("%d\n", char2);
	
	char1 = -130; //under flow(-2만큼)
	char2 = 129; //over flow(+2만큼)
	printf("%d\n", char1);
	printf("%d\n", char2);
}