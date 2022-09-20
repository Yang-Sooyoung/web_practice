// 자바스크립트 클래스 - getOwnPropertyNames()
// 어떤 객체를 다룰 때 --> 그 객체의 모든 특성을 보고자 한다면 --> getOwnPropertyNames() 메서드 사용.
// 정적 메서드	 --> Object.getOwnPropertyNames(객체명)
//				 --> Object.getPrototypeOf() --> 지정된 객체의 내부 Prototype 속성값을 반환.


// [1]
const p1 = {
	eat() {},
	run() {},
	rest() {}
};

class Person2 {
	constructor( name, age ) {
		this.name = name;
		this.age = age;
	}
	eat() {}
	run() {}
	rest() {}
}
const p2 = new Person2( '홍길동', 20 );


// [2]
// 열거 대상 X --> 메서드가 보이지 X.
for( let i in p2 ) {
	console.log( 'p2의 멤버들 = ' + i );  // name, age (eat, run, rest)
}

console.log( '---------------------------------------------' );
console.log( p1 ); 
console.log( p2 );  // Person2 {} --> 메서드는 보이지 X.


// [3]
console.log( '---------------------------------------------' );
console.log( Object.keys(p1) );												// ["eat", "run", "rest"]
console.log( Object.getPrototypeOf(p2) );									// 지정된 객체의 내부 Prototype 속성값을 반환.
console.log( Object.keys(Object.getPrototypeOf(p2)) );						// []

console.log( '---------------------------------------------' );
console.log( Object.getOwnPropertyNames(p1) );							// ["eat", "run", "rest"]
console.log( Object.getOwnPropertyNames(Object.getPrototypeOf(p2)) );	























