// 반복문(for)을 사용하여 객체 배열을 생성하고 출력해보시오.
// 이 문제는 객체의 주소를 저정하고 있는 객체 배열을 반복문을 사용하여 만들 수 있는지를 묻는 문제이다.


class Person15 {
	// Field
	private String name10;
	private int age10;
	
	// Constructor
	Person15() {}
	Person15( String name10, int age10 ) {
		this.name10 = name10;
		this.age10 = age10;
	}
	
	// Method
	public String getName() { return name10; }
	public void setName( String name10 ) { this.name10 = name10; }
	
	public int getAge10() { return age10; }
	public void setAge10( int age10 ) { this.age10 = age10; }
}

public class Java100_oop_ObjArray2 {
	public static void main(String[] args) {
		
		// [1] : 객체 생성
		Person15[] pa2;				// Person15 타입의 객체 배열 변수 pa2 선언.
		pa2 = new Person15[5];		// Person15 객체의 참조값을 원소로 가지는 배열 공간을 5개 생성 --> 5명 객체 생성할테니 주소 저장해라.
		
		// [2] : 반복문(for)을 돌면서 Person15() 객체 생성
		for( int i=0; i < pa2.length; i++ ) {
			pa2[i] = new Person15( i+"번 후보자", i+20 );  // i만 입력하면 안되나 문자열을 붙이면 문자열로 전달.
			
			// [2-1] : getter, setter 메서드 사용해서 출력
			System.out.println( pa2[i].getName() + " --> 나이 : " + pa2[i].getAge10() );
			
			// [2-2] : 배열 인덱스 사용해서 출력 --> 단, 이렇게 쓰려면 private 선언을 삭제하고 써야함.
			// System.out.println( pa2[i].name10 + "의 나이는 " + pa2[i].age10 + "살 입니다." );
			
			// [2-3] : printf()
			// System.out.printf( "%s의 나이는 %d살 입니다.%n", pa2[i].name10, pa2[i].age10 );
		}
		
	}
}
















