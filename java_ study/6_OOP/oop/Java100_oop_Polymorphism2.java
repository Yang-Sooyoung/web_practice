// 다음중 객체 생성 방법이 틀린 것을 골라보시오.
// 앞서 다형성(polymorphism)의 개념에 대해서 살펴봤는데 코드를 통해서 실습해보는 문제이다.


// [ ! ] : 핵심 정리
// 부모 클래스 Person이 있고, 이를 상속받은 자식 클래스 Student가 있다.
// 정리하면, 하위 클래스의 인스턴스(객체)는 보다 위인 상위 클래스의 인스턴스(객체)로도 사용될 수 있다.
// 그런데, 그 반대는 안된다.
// 따라서, 상위(부모) 클래스의 인스턴스(객체)는 하위(자식) 클래스의 인스턴스(객체)로 사용될 수 없다.


class Person {}
class Student extends Person {}

public class Java100_oop_Polymorphism2 {
	public static void main(String[] args) {
		
		// [1] : 객체 생성
		Student s1 = new Student();	// 지극히 정상 --> 에러날 이유가 하나도 없다.
		
		// [2] : 객체 생성 --> 타입은 부모 타입으로 생성
		Person s2 = new Student();  	// 이것도 정상 --> 하위(자식) 클래스로 객체를 만들면서 타입은 상위(부모) 타입을 쓰는 것이 가능 --> 다형성
		
		// [3] : 객체 생성
		Person aaa = new Person();	// 지극히 정상
		
		// [4] : 객체 생성 --> 상위(부모) 클래스로 객체를 생성하면서 타입은 하위(자식) 타입을 쓰는 경우 --> Err
		// Student bbb = new Person();	// Err
		
	}
}





















