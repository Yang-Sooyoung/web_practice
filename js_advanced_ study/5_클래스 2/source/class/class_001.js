// 자바스크립트 클래스(Class)


// [1] : 클래스의 지원
// 기존에는 자바스크립트 언어에 클래스 문법이란 존재하지 않았다.
// 그럼에도 불구하고, 프로토타입 체인으로 객체 지향 언어의 상속과 캡슐화(은닉화) 등의 OOP 문법을 구현할 수 있었다.
// 따라서, 자바스크립트 언어는 --> 클래스가 필요없는 프로토타입 기반의 OOP(객체 지향) 언어.


// [2] : 프로토타입 기반의 OOP 문법은 너무 어렵다.
// 타언어 경험이 없는 초보자 --> 너무 어렵다.
// 타언어 경험이 있는 경험자 --> 조금 어렵다. 생소하다. --> 불만(?)


// [3] : ES5, 6 --> 거치면서 --> 클래스 문법을 지원 --> 보다 편리하고 쉽게 OOP 문법을 구현할 수 있도록 지원.
// 기존 프로토타입 기반의 OOP 문법이 없어지고 새로운 Class 문법을 지원하는 것은 X.


// [4] : 클래스 선언과 객체 생성
class Person {
	
	// 생성자(Constructor)
	constructor( name, age ) {
		this.name = name;
		this.age = age;
	}
	
	// testHello()
	testHello() {
		console.log( `안녕하세요~ ${ this.name }(${ this.age }) 회원님~ ^_^;;` );
	}
	
}

// 객체 생성 --> 인스턴스 생성
const p1 = new Person( "홍길동", 20 );
console.log( p1.name );  		// 홍길동
console.log( p1.age );  		// 20
p1.testHello();				// 안녕하세요~ 홍길동(20) 회원님~ ^_^;;

console.log( '----------------------------------------------' );

const p2 = new Person( "이순신", 30 );
console.log( p2.name );
console.log( p2.age ); 
p2.testHello();	

console.log( '----------------------------------------------' );

console.log( p1 instanceof Person );  // true
console.log( p2 instanceof Person );  // true





















