// getter, setter가 포함된 클래스의 상속을 코드로 구현해보시오.
// 이 문제는 클래스의 상속을 구현시 getter, setter의 개념과 용도를 알고 있는지를 묻는 문제이다.
// 부모 클래스 --> Person4, 자식 클래스 --> Villain4, Hero4


class Person4 {
	// Field
	private String name4;
	private int age4;
	private int height4;
	private int weight4;
	
	// Constructor
	
	// Method
	public String getName() { return name4; }
	public void setName( String name4 ) { this.name4 = name4; }
	
	public int getAge4() { return age4; }
	public void setAge4( int age4 ) { this.age4 = age4; }
	
	public int getHeight() { return height4; }
	public void setHeight( int height4 ) { this.height4 = height4; }
	
	public int getWeight4() { return weight4; }
	public void setWeight4( int weight4 ) { this.weight4 = weight4; }
}

class Villain4 extends Person4 {}

class Hero4 extends Person4 {}

public class Java100_oop_InheritanceSample5 {
	public static void main(String[] args) {
		
		// [1] : 객체 생성
		Person4 p1 = new Person4();
		p1.setName( "홍길동" );
		System.out.println( p1.getName() );
		
	}
}





