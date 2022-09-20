// 문자열을 숫자로 변환시 진수를 지정해서 출력해보시오.
// 이 문제는 Integer.parseInt()의 두 번째 인자값으로 진수를 지정하여 출력하는 것에 대해서 묻는 문제이다.


// [ ! ] : 왜 변환이 필요한가?
// 1+2 숫자끼리의 연산은 3이지만, 문자열끼리의 연산은 12가 되기 때문에 숫자로 변환 후 연산을 수행해야 한다.
// 문자열을 숫자로 변환시키는 방법 --> Integer.parseInt() 사용.
// parseInt() --> Integer 클래스의 static으로 지정 --> 따라서, 객체의 생성없이 바로 "클래스명.parseInt()"로 직접 사용이 가능.
// 두 번째 인자 값으로 진수를 지정 --> 해당 진수에 맞는 값이 됨 --> Integer.parseInt( "1000", 2 );


public class Java100_oop_ParseInt2 {
	public static void main(String[] args) {
		
		// [1] : 숫자끼리의 연산
		int a5 = 1;
		int b5 = 2;
		int c5 = a5 + b5;
		System.out.println( "a5 + b5 = " + c5 );		// 3
		
		// [2] : 문자열끼리의 연산
		String a6 = "1";
		String b6 = "2";
		String c6 = a6 + b6;
		System.out.println( "a6 + b6 = " + c6 );	// 12
		System.out.println( c6.getClass().getName() );
		
		// [3] : 문자열 --> 숫자로 변환 후 연산
		int a7 = Integer.parseInt( a6 );
		int b7 = Integer.parseInt( b6 );
		System.out.println( a7 + b7 );			// 3
		
		// [4] : 진수 지정
		System.out.println( "-----------------------------[진수 지정]" );
		
		System.out.println( Integer.parseInt( "2022" ) );							// 2022
		System.out.println( Integer.parseInt( "2022", 10 ) );						// 2022
		System.out.println( Integer.parseInt( "1", 2 ) );								// 1
		System.out.println( Integer.parseInt( "1001", 2 ) );							// 9
		System.out.println( Integer.parseInt( "1004", 8 ) );							// 516
		System.out.println( Integer.parseInt( "A", 16 ) );							// 10
		System.out.println( Integer.parseInt( "D", 16 ) );							// 13
		System.out.println( Integer.parseInt( "FF", 16 ) );							// 255
		
		System.out.println( "-----------------------------[진수 지정]" );
		
	}
}























