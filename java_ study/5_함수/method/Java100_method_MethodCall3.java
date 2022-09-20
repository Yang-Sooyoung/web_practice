// Call by value 메서드 호출을 Call by reference 방식으로 바꿔서 코드를 구현하시오.
// 이 문제는 앞서 다뤘던 문제의 Call by value 방식을 Call by reference 방식으로 수정해서 보내라는 의미다.
// a 값이 같은 결과가 나오도록 코드를 수정해보시오.
// 단, 이 문제는 클래스와, Wrapper, 객체 생성에 대한 개념이 필요하므로 관련 공부를 하고 문제도 풀어본 후 보는 것이 이해하는데 도움이 된다.


class TestNumber {
	int num;
	TestNumber(int num) { this.num = num; }
}

public class Java100_method_MethodCall3 {
	
	public static void sum( TestNumber a ) {
		System.out.println( "sum() 메서드안에서의 a 값 --> "+a );  //--- a 값(TestNumber 주소)을 출력해보면 주소가 들어있음을 알 수 있다 --;;
		System.out.println( a.num );  // 100
		a.num = a.num + 400;
		System.out.println( a.num );  // 500
	}
	
	public static void main(String[] args) {
		
		// [1] : 객체 변수 선언
		TestNumber a = new TestNumber(100);
		sum( a );
		System.out.println( "-----------------------------" );
		System.out.println( a.num );  // 100 --> 500
		
	}
	
}




