// 추상 클래스와 상속을 사용하여 다형성 예제를 만들어보시오.
// 이 문제는 추상 클래스와 상속의 개념을 이해하고 이를 활용하여 다형성을 구현할 수 있는지를 묻는 문제이다.


abstract class Car {
	abstract void run();
}

class Ambulance extends Car {
	void run() { System.out.println( "앰블런스 지나가요~ 삐뽀삐뽀~" ); }
}

class Cultivator extends Car {
	void run() { System.out.println( "경운기 지나가요~ 덜컹덜컹~" ); }
}

class SportsCar extends Car {
	void run() { System.out.println( "스포츠카 지나가요~ 씽~" ); }
}

public class Java100_oop_Polymorphism5 {
	public static void main(String[] args) {
		
		// [1] : 객체 생성
		Car c1 = new Ambulance();	// 정상
		Car c2 = new Cultivator();	// 정상
		Car c3 = new SportsCar();	// 정상
		
		// [2] : run() 메서드 호출
		c1.run();
		c2.run();
		c3.run();
		
	}
}



















