// 수치 연산자를 사용한 연산에서 소숫점 결과가 예상과 다르게 나오는 것에 대해서 설명해보시오.
// 이 문제는 자바의 기본적인 수치 연산자에 대해서 알고 있는지를 묻는 문제이다.


public class Java100_operator_ArithmeticOperators2 {
	public static void main(String[] args) {
		
		// [ ! ] : 연산의 결과 --> 정수끼리라도 나누기의 경우 소숫점 형태가 나올 수 있음.
		int a=60, b=8;
		int rst1; double rst2, rst3, rst4;
		
		rst1 = a / b;
		System.out.println( rst1 );					// 7.5가 아니라 7이 출력. --> 타입이 정수형이므로 --> 실수형으로 변환.
		System.out.println( (double)rst1 );		// 이러면 7.5가 아니라 7.0 --> 리턴 받는 변수를 실수형으로 하더라도 원하는 결과를 얻지는 못한다.
		
		rst2 = (double)a / b;							// 어느 한쪽의 값을 double 타입으로 변환.
		System.out.println( rst2 );					// 7.5
		
		rst3 = 100 / (double)3;
		rst4 = 250 / 3.0;
		System.out.println( rst3 );
		System.out.println( rst4 );
		System.out.printf( "세 과목의 평균은 %.1f 입니다. %n", rst4 );
		
	}
}



















