// getter, setter가 포함된 클래스의 상속을 코드로 구현해보시오.
// 이 문제는 클래스의 상속을 구현시 getter, setter의 개념과 용도를 알고 있는지를 묻는 문제이다.
// 부모 클래스 --> Person5, 자식 클래스 --> Villain5, Hero4


class Person5 {
	// Field
	private String name6;
	private int age6;
	private int height6;
	private int weight6;
	
	// Constructor
	Person5() {}
	Person5( String name6, int age6, int height6, int weight6 ) {
		this.name6 = name6;
		this.age6 = age6;
		this.height6 = height6;
		this.weight6 = weight6;
	}
	
	// Method
	public String getName() { return name6; }
	public void setName( String name6 ) { this.name6 = name6; }
	
	public int getAge6() { return age6; }
	public void setAge6( int age6 ) { this.age6 = age6; }
	
	public int getHeight6() { return height6; }
	public void setHeight6( int height6 ) { this.height6 = height6; }
	
	public int getWeight6() { return weight6; }
	public void setWeight6( int weight6 ) { this.weight6 = weight6; }
	
	public void move() {
		System.out.println( "이동중.." );
	}
}

class Villain5 extends Person5 {
	// Field
	private String unique_key6;
	private int weapon6;			// 1~9 숫자로 무기 분류 --> 1: 창, 2: 방패, 3: 총..
	private double power6;
	
	// Constructor
	Villain5() {}
	Villain5( String name6, int age6, int height6, int weight6, String unique_key6, int weapon6, double power6 ) {
		super( name6, age6, height6, weight6 );
		this.unique_key6 = unique_key6;
		this.weapon6 = weapon6;
		this.power6 = power6;
	}
	
	// Method
	public String getUnique_key() { return unique_key6; }
	public void setUnique_key( String unique_key6 ) { this.unique_key6 = unique_key6; }
	
	public int getWeapon() { return weapon6; }
	public void setWeapon( int weapon6 ) { this.weapon6 = weapon6; }
	
	public double getPower() { return power6; }
	public void setPower( double power6 ) { this.power6 = power6; }
	
	// printPerson()
	public void printPerson() {
		System.out.println( "---------------------------------" );
		System.out.println( "악당 이름 : " + getName() );
		System.out.println( "악당 나이 : " + getAge6() );
		System.out.println( "악당의 키 : " + getHeight6() );
		System.out.println( "악당 체중 : " + getWeight6() );
		System.out.println( "악당 넘버 : " + getUnique_key() );
		System.out.println( "악당 무기 : " + getWeaponName( getWeapon() ) );  // 숫자(1~9) --> 1: 창, 2: 방패, 3: 총..
		System.out.println( "악당 파워 : " + getPower() );
		System.out.println( "---------------------------------" );
	}
	
	// getWeaponName()
	public String getWeaponName( int a ) {
		String weapon6;
		switch( a ) {
			case 1: 
				weapon6 = "창";
				break;
			case 2:
				weapon6 = "방패";
				break;
			case 3:
				weapon6 = "총";
				break;
			default:
				weapon6 = "---";
				break;
		}
		return weapon6;
	}
}

class Hero5 extends Person5 {}

public class Java100_oop_InheritanceSample7 {
	public static void main(String[] args) {
		
		// [1] : 객체 생성
		Villain5 v1 = new Villain5( "좀비", 20, 180, 80, "15001231", 2, 99.5 );
		v1.printPerson();
		System.out.print( v1.getName() + " " );
		v1.move();  // 부모 클래스의 move() 메서드를 호출.
		
		// [2] : 객체 생성
		Villain5 v2 = new Villain5( "도깨비", 30, 175, 70, "11001121", 1, 77.5 );
		v2.printPerson();
		System.out.print( v2.getName() + " " );
		v2.move();

		// [3] : 객체 생성
		Villain5 v3 = new Villain5( "몽달귀신", 40, 150, 40, "10001010", 3, 27.5 );
		v3.printPerson();
		System.out.print( v3.getName() + " " );
		v3.move();
		
	}
}

















