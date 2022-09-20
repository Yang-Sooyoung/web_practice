// 문자열을 숫자로 바꿔서 연산해보시오.
// 이때, 인자값으로 진수를 지정해서 출력해보시오.
// 이 문제는 자바 프로그래밍시 문자열을 숫자로 변환시키는 것에 대해서 아는지를 묻는 문제이다.


// [ ! ] : 왜 변환이 필요한가?
// 1+2 숫자끼리의 연산은 3이지만, 문자열끼리의 연산은 12가 되기 때문에 숫자로 변환 후 연산을 수행해야 한다.
// 문자열을 숫자로 변환시키는 방법 --> Integer.parseInt() 사용.
// parseInt() --> Integer 클래스의 static으로 지정 --> 따라서, 객체의 생성없이 바로 "클래스명.parseInt()"로 직접 사용이 가능.


public class Java100_oop_ParseInt {
	public static void main(String[] args) {
		
		// [1] : 숫자끼리의 연산
		int a = 1;
		int b = 2;
		int c = a + b;
		System.out.println( "a + b = " + c );		// 3
		
		// [2] : 문자열끼리의 연산
		String a1 = "1";
		String b1 = "2";
		String c1 = a1 + b1;
		System.out.println( "a1 + b1 = " + c1 );	// 12
		System.out.println( c1.getClass().getName() );
		
		// [3] : 문자열 --> 숫자로 변환 후 연산
		int a2 = Integer.parseInt( a1 );
		int b2 = Integer.parseInt( b1 );
		System.out.println( a2 + b2 );			// 3
		
	}
}























