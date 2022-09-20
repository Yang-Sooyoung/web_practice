// 1000000원을 가진 변수를 천단위로 콤마를 찍어서 출력시켜보시오.
// 이 문제는 천단위로 콤마(,)를 찍는 문제인데 여러가지 방법중 손쉽게 할 수 있는 방법으로 풀어본다.
// 아래는 앞서의 FarmMachine 클래스 문제인데 가격을 천단위로 콤마 찍어서 출력해보세요.


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
		System.out.println( "Fram-machine is grinding." );
	}
	
}

public class Java100_oop_Exam003 {
	public static void main(String[] args) {
		
		// [1] : 객체 생성
		FarmMachine fm = new FarmMachine();
		
		// [2] : 생성된 객체에 속성 값 입력하기
		fm.price = 1000000;
		fm.year = 2020;
		fm.color = "red";
		
		// [3] : 속성 값 출력하기
		// String fm_price = String.format( "%,d", 1000000 );
		System.out.println( String.format( "%,d", fm.price ) );
		System.out.println( fm.year );
		System.out.println( fm.color );
		
		// [4] : 동작 수행하기
		fm.move();
		fm.dig();
		fm.grind();
		
	}
}




















