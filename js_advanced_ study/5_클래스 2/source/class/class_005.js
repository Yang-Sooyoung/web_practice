// 자바스크립트 클래스 - 2가지 방식


// [1] : 생성자 함수
function Person( name, age ) {
	this.name = name;
	this.age = age;
}

Person.prototype.say = function() { console.log( '안녕하세요~' ); };

const p1 = new Person( '홍길동', 20 );
console.log( p1.name );
p1.say();


// [2] : class
class Person2 {
	constructor( name, age ) {
		this.name = name;
		this.age = age;
	}
	say() {
		console.log( '안녕~' );
	}
}

const p2 = new Person2( '이순신', 30 );
console.log( p2.name );
p2.say();


// 클래스는 기본적으로 엄격 모드(use strict) --> 자동 적용.
// 클래스 메서드는 열거 대상이 X. --> 클래스와 같은 이름의 "프로토타입 객체"의 속성에 추가된 메서드들 열거 X.
for( let i in p2 ) {
	console.log( i );  // name, age
}






















