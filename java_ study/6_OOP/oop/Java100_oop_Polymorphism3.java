// 자식 클래스로 생성하는 객체를 부모의 타입으로 받아서 객체를 생성하면 사용범위가 어떻게 되는지 말해보시오.
// 이 문제는 다형성의 관계에서 부모, 자식 클래스 자원을 어떻게 쓸 수 있는지를 묻는 문제이다.


class Person {
	String str1 = "난 부모 클래스";
	void method1() { System.out.println( "에이에이에이" ); }
	void ppp() { System.out.println( "ppp" ); }
}

class Student extends Person {
	String str2 = "난 자식 클래스";
	void method1() { System.out.println( "오버라이딩 - AAA" ); }
	void sss() { System.out.println( "sss" ); }
}

public class Java100_oop_Polymorphism3 {
	public static void main(String[] args) {
		
		
		// [3] : 객체 생성
		Person aaa = new Person();
		aaa.method1();					// 에이에이에이
		// aaa.sss();						// Err
		
		
		// [2] : 객체 생성 --> 범위는 부모의 자원만을 쓸 수 있다.(?)
		System.out.println( "---------------------------" );
		Person s2 = new Student();
		System.out.println( s2.str1 );
		// System.out.println( s2.str2 );  	// Err --> 자식의 자원은 쓸 수 없다.
		s2.ppp();							// ppp
		// s2.sss();						// Err --> 자식의 자원은 쓸 수 없다.
		s2.method1();					// 오버라이딩 - AAA --> 오버라이딩한거는 자식의 메서드로 실행.
		
		// [ ! ] : 그런데 말이죠.. --> 자식의 메서드를 바로 호출하고 싶다면? --> ???


		// [1] : 객체 생성 --> 부모 + 자식 클래스의 모든 자원을 다 쓸 수 있다.
		System.out.println( "---------------------------" );
		Student s1 = new Student();
		System.out.println( s1.str1 );
		System.out.println( s1.str2 );
		s1.method1();					// 오버라이딩 - AAA
		s1.sss();							// sss
		s1.ppp();							// ppp
		
		// [ ! ] : 그런데 말이죠.. --> 자식 클래스에서 오버라이딩된 부모 클래스의 원본 메서드를 호출하고 싶다면? --> ???
		
		
		// [4] : 객체 생성
		// Student bbb = new Person();	// Err
		
		
	}
}





















