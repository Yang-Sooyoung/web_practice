// 클래스의 상속을 코드로 구현해보시오.
// 이 문제는 자바 OOP 문법에서 상속에 대한 개념과 그것을 코드로 구현할 수 있는지를 묻는 문제이다.


class Person1 {
	// Field
	int gender1;
	int power1;
	
	// Constructor
	Person1() {
		this.gender1 = 1;		// 1: 남성, 2: 여성
		this.power1 = 100;	// 기본파워
	}
	
	// Method
	void walk() {
		System.out.println( "걸어가고 있어요~" );
	}
}

class Hero1 extends Person1 {
	// Field
	String name2;
	int age2;
	
	// Constructor
	Hero1() {}
	Hero1( String name2, int age2 ) {
		this.name2 = name2;
		this.age2 = age2;
	}
	
	// Method
	// void walk() {
		// System.out.println( "2배로 빨리 걸어가고 있어요~" );
	// }
	
	void eat() {
		System.out.println( "밥먹고 있어요~" );
	}
	
	void displayPerson() {
		System.out.println( "이름 : " + name2  + ", 나이 : " + age2 + ", 성별 : " + gender1 + ", 파워 : " + power1 );
	}
}

class Villain1 {}

public class Java100_oop_InheritanceSample2 {
	public static void main(String[] args) {
		
		// [1] : 객체 생성
		Person1 p1 = new Person1();
		p1.walk();
		// p1.eat(); // Err
		
		// [2] : 상속을 통한 슈퍼맨 객체 생성
		Hero1 h1 = new Hero1( "슈퍼맨", 20 );
		System.out.println( h1.name2 );
		System.out.println( h1.age2 );
		System.out.println( h1.gender1 );	// 부모 클래스 필드(변수)
		System.out.println( h1.power1 );	// 부모 클래스 필드(변수)
		
	}
}


























