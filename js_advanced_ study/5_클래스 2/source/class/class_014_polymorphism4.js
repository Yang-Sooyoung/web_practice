// 자바스크립트 클래스 - 다형성 예
// 다형성을 구현하기 위한 기본적인 OOP 문법.
// 1. 부모/자식간의 계층적인 구조 --> 상속 관계.
// 2. 메서드 재정의 --> 오버라이딩.
// 3. 재정의된 메서드 호출 --> 프로토타입 체이닝상에서 제일 먼저 찾게되는 메서드 호출.


// [1]
class Animal {
	constructor( name ) {
		this._name = name;
	}
	bark() { return `짖다.`; }
}

class Dog extends Animal {
	constructor( name, age ) {
		super( name );
		this._age = age;
	}
	bark() { return `${ this._age }살 짜리 ${ this._name }가 짖다. --> 멍멍~`; }
}

class Cat extends Animal {
	constructor( name, age ) {
		super( name );
		this._age = age;
	}
	bark() { return `${ this._age }살 짜리 ${ this._name }가 짖다. --> 야옹야옹~`; }
}

class Bull extends Animal {
	constructor( name, age ) {
		super( name );
		this._age = age;
	}
	bark() { return `${ this._age }살 짜리 ${ this._name }가 짖다. --> 음메~`; }
}


// [2] : 사용
// const d1 = new Dog( '개', 2 );
// console.log( d1.bark() );  // 멍멍~

// const c1 = new Cat( '고양이', 4 );
// console.log( c1.bark() );  // 야옹야옹~

// const b1 = new Bull( '소', 8 );
// console.log( b1.bark() );  // 음메~

// 배열
const animals = [ new Dog( '개', 2 ), new Cat( '고양이', 4 ), new Bull( '소', 8 ) ];

// for .. of
for( let v of animals ) {
	console.log( v.bark() );
}











































