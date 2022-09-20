// 다형성(polymorphism)을 활용한 객체 생성시 배열과 반복문을 사용하여 객체를 생성해보시오.
// 반복문은 향상된 for문으로도 출력해본다.
// 이 문제는 다형성을 이용한 객체 생성시 배열과 for문을 통해서 자동으로 객체를 생성할 수 있는지를 묻는 문제이다.


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

public class Java100_oop_Polymorphism6 {
	public static void main(String[] args) {

		// [1] : 배열 길이가 3인 Car 객체 배열 선언
		// Car[] cars = new Car[3];
		// System.out.println( cars[0] );  // null --> 각 배열에는 아직 null 값만 존재.
		// cars = new Car[]{ new Ambulance(), new Cultivator(), new SportsCar() };  // cars 배열 초기화
	
		// [2] : 1번 방법 말고 --> 자식 클래스로 객체 생성 --> 타입은 부모 타입으로 --> 이렇게 생성된 객체들로 바로 배열 초기화 --> 다형성 덕분.
		Car[] cars = { new Ambulance(), new Cultivator(), new SportsCar() };
		
		// [3] : 반복문 돌면서 각 객체의 run() 메서드 호출
		for( int i=0; i < cars.length; i++ )
			// System.out.println( cars[i] );  // 각 객체가 생성된 메모리 공간의 주소 값을 출력.
			cars[i].run();
		
		// [4] : 향상된 for문
		System.out.println( "--------------------------" );
		for( Car obj : cars )
			// System.out.println( obj );
			obj.run();
		
	}
}


















