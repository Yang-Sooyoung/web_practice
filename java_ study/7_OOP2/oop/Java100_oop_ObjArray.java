// 객체에 대한 참조값을 요소로 가지는 객체 배열 코드를 구현하시오.
// 이 문제는 기본형 타입이 아닌 참조형 타입의 객체가 원소인 객체 배열을 구현할 수 있는지를 묻는 문제이다.


class Person14 {
	// Field
	private String name9;
	private int age9;
	
	// Constructor
	Person14() {}
	Person14( String name9, int age9 ) {
		this.name9 = name9;
		this.age9 = age9;
	}
	
	// Method
	public String getName() { return name9; }
	public void setName( String name9 ) { this.name9 = name9; }
	
	public int getAge9() { return age9; }
	public void setAge9( int age9 ) { this.age9 = age9; }
}

public class Java100_oop_ObjArray {
	public static void main(String[] args) {
		
		// [1] : 객체 생성
		int[] ar1 = { 1, 2, 3, 4, 5 };
		char[] ar2 = { 'A', 'B', 'C', 'D', 'E' };	
		Person14[] pa = new Person14[5];
		pa[0] = new Person14( "홍길동", 20 );
		pa[1] = new Person14( "박길동", 21 );
		pa[2] = new Person14( "김길동", 22 );
		pa[3] = new Person14( "장길동", 23 );
		pa[4] = new Person14( "고길동", 24 );		
		
		// [2] : 출력
		for( int i=0; i < pa.length; i++ ) {
			// System.out.print( pa[i].name9 + "\t\t" );
			System.out.print( pa[i].getAge9() + "\t\t" );
		}
		System.out.println();
		
	}
}















