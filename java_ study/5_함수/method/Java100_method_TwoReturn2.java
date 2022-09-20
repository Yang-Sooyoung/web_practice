// 반환값이 2개 있는 메서드를 구현해보시오.
// 메서드는 ( "korea", "USA" ) 입력시 소문자는 대문자로 대문자는 소문자로 출력되도록 구현한다.
// 이 문제는 자바의 메서드 작성시 리턴되는 반환값이 2개일 때 처리하는 방법을 아는지에 대해서 묻는 문제이다.


import java.util.Arrays;

public class Java100_method_TwoReturn2 {
	
	public static String[] capitalMethod( String a, String b ) {
		String a_ = a.toUpperCase();
		String b_ = b.toLowerCase();
		
		// 리턴값 2개를 저장할 배열 변수 선언
		String[] ret = { a_, b_ };
		return ret;
	}
	
	public static void main(String[] args) {
		
		// [1] : 반환값 --> O 		받는 인자값 --> O 
		// 반환값이 있다는 것 --> 메서드(호출) 호출에 따른 리턴값이 있다는 것 --> 호출부에서 리턴값을 받는 변수 정의.
		String[] result = capitalMethod( "korea", "USA" );
		
		// [2] : 출력
		// System.out.println( result );  	//--- 주소 값 출력
		System.out.println( result[0] );  	// KOREA
		System.out.println( result[1] );  	// usa
		System.out.println( result[0] +" - "+ result[1] );
		System.out.println( Arrays.toString(result) );
		
	}
	
}







