// 논리 연산자에 대해서 설명해보시오.
// 이 문제는 자바의 기본적인 논리 연산자에 대해서 알고 있는지를 묻는 문제이다.


public class Java100_operator_LogicalOperators {
	public static void main(String[] args) {
		
		// [ ! ] : 논리 연산자 --> &&, ||(이항 연산자)	!(단항 연산자)
		// &&(and)		||(or)		!(not)
		// 관계 연산자와 마찬가지로 결과로써 나오는 값은 참(true), 거짓(false)으로 나오므로 결과를 받는 타입은 boolean.
		// A && B 		--> A 그리고 B가 모두 참이어야만 참.
		// A || B 			--> A 또는 B가 하나라도 참이면 참.
		// !A 				--> 반대로.. A가 참이면 거짓으로, 거짓이면 참으로.
		int a=10, b=20, c=30;
		
		boolean rst1 = a < b && c > b;
		System.out.println( rst1 );			// true
		
		boolean rst2 = a < b || c < b;
		System.out.println( rst2 );			// true
		
		boolean rst3 = a > c || b != c;
		System.out.println( rst3 );			// true
		
		boolean rst4 = !rst3;
		System.out.println( rst4 );			// false
		System.out.println( !rst4 );			// true
		
	}
}























