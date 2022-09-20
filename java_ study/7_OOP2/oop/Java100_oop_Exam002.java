// FarmMachine의 속성과 동작들을 가지는 클래스를 코드로 구현하고 객체를 생성하여 동작시켜보시오.
// 이 문제는 어떤 사물에 대한 클래스를 실제 코드로 구현할 수 있는지를 묻는 문제이다.


// [1] : 클래스는 왜 나왔을까?
// 클래스 없이도 객체의 특징(속성)들은 변수로 정의할 수 있을 것이고, 동작은 함수로 정의할 수 있을 것이다.
// 그러나 프로그램의 규모가 커지고 여러 사람이 협업을 하는 과정에서 좀더 체계적이고 분업화된 시스템으로 개발하고 확장해나갈 필요성이 있다.
// 그런 일련의 과정에서 OOP(객체 지향 프로그래밍)가 만들어지고 발전해왔다.
// 거의 모든 프로그래밍 언어에서 OOP 문법을 지원하고 있고 하나의 언어로 OOP 문법을 공부하면 다른 언어에서도 거의 동일하다.
// 즉, 자바 언어로 OOP를 배운 사람은 python, php를 공부할 때 거의 거저먹기 수준이 된다.
// 다만, 프로그래밍 언어마다 OOP를 구현하는 방법은 제각각 틀리기 때문에 이런 부분을 공부하는 시간은 필요하다.


// [2] : 클래스 만들기
// 객체의 특징 --> 속성(attribute)
// 객체의 동작 --> 메서드(method)
class FarmMachine {
	
	// [1] : 속성(특징)
	int price;			// 가격
	int year;			// 연식
	String color;		// 색상
	
	// [2] : 동작/기능/행동(method) --> 농기계 마다 동작이 다양할 것이므로 처음에는 공통적인 동작을 생각해본다. 
	void move() {
		System.out.println( "Farm-machine is moving." );
	}
	
	void dig() {
		System.out.println( "Fram-machine is digging." );
	}
	
	void grind() {
		System.out.println( "Farm-machine is grinding." );
	}
	
}

public class Java100_oop_Exam002 {
	public static void main(String[] args) {
		
		// [1] : 객체 생성
		FarmMachine fm = new FarmMachine();
		System.out.println( fm );
		
		// [2] : 생성된 객체에 속성 값 입력하기
		fm.price = 1000000;
		fm.year = 2020;
		fm.color = "red";
		
		// [3] : 속성 값 출력하기
		System.out.println( fm.price );
		System.out.println( fm.year );
		System.out.println( fm.color );
		
		// [4] : 동작 수행하기
		fm.move();
		fm.dig();
		fm.grind();
 		
	}
}






































