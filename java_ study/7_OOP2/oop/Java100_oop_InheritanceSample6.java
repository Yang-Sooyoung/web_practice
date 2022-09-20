// getter, setter가 포함된 클래스의 상속을 코드로 구현해보시오.
// 이 문제는 클래스의 상속을 구현시 getter, setter의 개념과 용도를 알고 있는지를 묻는 문제이다.
// 부모 클래스 --> Person5, 자식 클래스 --> Villain5, Hero5


class Person5 {
	// Field
	private String name5;
	private int age5;
	private int height5;
	private int weight5;
	
	// Constructor
	Person5() {}
	Person5( String name5, int age5, int height5, int weight5 ) {
		this.name5 = name5;
		this.age5 = age5;
		this.height5 = height5;
		this.weight5 = weight5;
	}
	
	// Method
	public String getName() { return name5; }
	public void setName( String name5 ) { this.name5 = name5; }
	
	public int getAge5() { return age5; }
	public void setAge5( int age5 ) { this.age5 = age5; }
	
	public int getHeight7() { return height5; }
	public void setHeight7( int height5 ) { this.height5 = height5; }
	
	public int getWeight() { return weight5; }
	public void setWeight( int weight5 ) { this.weight5 = weight5; }
	
	public void move() {
		System.out.println( "이동중.." );
	}
}

class Villain5 extends Person5 {
	// Field
	private String unique_key5;
	private int weapon5;			// 1~9 숫자로 무기 분류 --> 1: 창, 2: 방패, 3: 총..
	private double power5;
	
	// Constructor
	Villain5() {}
	Villain5( String name5, int age5, int height5, int weight5, String unique_key5, int weapon5, double power5 ) {
		super( name5, age5, height5, weight5 );
		this.unique_key5 = unique_key5;
		this.weapon5 = weapon5;
		this.power5 = power5;
	}
	
	// Method
	public String getUnique_key() { return unique_key5; }
	public void setUnique_key( String unique_key5 ) { this.unique_key5 = unique_key5; }
	
	public int getWeapon() { return weapon5; }
	public void setWeapon( int weapon5 ) { this.weapon5 = weapon5; }
	
	public double getPower() { return power5; }
	public void setPower( double power5 ) { this.power5 = power5; }
	
	// printPerson()
	public void printPerson() {
		System.out.println( "---------------------------------" );
		System.out.println( "악당 이름 : " + getName() );
		System.out.println( "악당 나이 : " + getAge5() );
		System.out.println( "악당의 키 : " + getHeight7() );
		System.out.println( "악당 체중 : " + getWeight() );
		System.out.println( "악당 넘버 : " + getUnique_key() );
		System.out.println( "악당 무기 : " + getWeapon() );  // 숫자(1~9) --> 1: 창, 2: 방패, 3: 총..
		System.out.println( "악당 파워 : " + getPower() );
		System.out.println( "---------------------------------" );
	}
}

class Hero5 extends Person5 {}

public class Java100_oop_InheritanceSample6 {
	public static void main(String[] args) {
		
		// [1] : 객체 생성
		Villain5 v1 = new Villain5( "좀비", 20, 180, 80, "15001231", 1, 99.5 );
		v1.printPerson();
		
	}
}

















