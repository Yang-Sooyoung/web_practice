// 자식 클래스로 생성하는 객체를 부모의 타입으로 받아서 객체를 생성하면 사용범위가 어떻게 되는지 말해보시오.
// 이 문제는 다형성의 관계에서 부모, 자식 클래스 자원을 어떻게 쓸 수 있는지를 묻는 문제이다.


class Person11 {
	String str1 = "난 부모 클래스";
	void method1() { System.out.println( "에이에이에이" ); }
	void ppp() { System.out.println( "ppp" ); }
}

class Student11 extends Person11 {
	String str2 = "난 자식 클래스";
	void method1() { System.out.println( "오버라이딩 - AAA" ); }
	void sss() { System.out.println( "sss" ); }
}

public class Java100_oop_Polymorphism3 {
	public static void main(String[] args) {
		
		
		// [3] : 객체 생성
		Person11 aaa = new Person11();
		aaa.method1();					// 에이에이에이
		// aaa.sss();						// Err
		
		
		// [2] : 객체 생성 --> 범위는 부모의 자원만을 쓸 수 있다.(?)
		System.out.println( "---------------------------" );
		Person11 s6 = new Student11();
		System.out.println( s6.str1 );
		// System.out.println( s6.str2 );  	// Err --> 자식의 자원은 쓸 수 없다.
		s6.ppp();							// ppp
		// s6.sss();						// Err --> 자식의 자원은 쓸 수 없다.
		s6.method1();					// 오버라이딩 - AAA --> 오버라이딩한거는 자식의 메서드로 실행.
		
		// [ ! ] : 그런데 말이죠.. --> 자식의 메서드를 바로 호출하고 싶다면? --> ???


		// [1] : 객체 생성 --> 부모 + 자식 클래스의 모든 자원을 다 쓸 수 있다.
		System.out.println( "---------------------------" );
		Student11 s5 = new Student11();
		System.out.println( s5.str1 );
		System.out.println( s5.str2 );
		s5.method1();					// 오버라이딩 - AAA
		s5.sss();							// sss
		s5.ppp();							// ppp
		
		// [ ! ] : 그런데 말이죠.. --> 자식 클래스에서 오버라이딩된 부모 클래스의 원본 메서드를 호출하고 싶다면? --> ???
		
		
		// [4] : 객체 생성
		// Student11 bbb = new Person11();	// Err
		
		
	}
}





















