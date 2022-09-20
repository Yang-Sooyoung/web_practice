// 자바의 인터페이스 문법을 예제 코드로 구현해보시오.
// 이 문제는 자바 문법중 인터페이스에 대한 개념과 어떻게 사용하는지에 대해서 아는지를 묻는 문제이다.


class Person {
	// Field
	String name7;
	int age7;
	int weight7;
	
	// Constructor
	Person() {}
	Person( String name7, int age7, int weight7 ) {
		this.name7 = name7;
		this.age7 = age7;
		this.weight7 = weight7;
	}
	
	// Method
	void wash() { System.out.println( "씻다." ); }
	void study() { System.out.println( "공부하다." ); }
	void play() { System.out.println( "놀다다." ); }
}

interface Allowance {
	// Abstract Method
	abstract void in( int price, String name7 );
	abstract void out( int price, String name7 );
}

interface Train {
	// Abstract Method
	abstract void train( int training_pay, String name7 );
}

class Student extends Person implements Allowance, Train {
	// Field
	
	// Constructor
	Student() {}
	Student( String name7, int age7, int weight7 ) {
		super( name7, age7, weight7 );
	}
	
	// Method
	public void in( int price, String name7 ) { System.out.printf( "%s 에게서 %d원 용돈을 받았습니다.", name7, price ); }
	public void out( int price, String name7 ) { System.out.printf( "%d원 금액을 지출했습니다. [지출용도 --> %s]", price, name7 ); }
	public void train( int training_pay, String name7 ) { System.out.printf( "[%s --> %d원 입금완료]", name7, training_pay ); }
}

public class Java100_oop_Interface3 {
	public static void main(String[] args) {
		
		// [1] : 객체 생성
		Student s1 = new Student( "홍길동", 20, 85 );
		
	}
}



























