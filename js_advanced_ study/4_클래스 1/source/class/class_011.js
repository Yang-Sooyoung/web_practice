// 자바스크립트 클래스 - Object.create 상속
// class 문법 지원이 추가되기 이전에 자바스크립트에서 객체지향을 구현하기 위해 사용된 방식 --> Object.create()
// Object.create() 방식이 없던 시절에도 상당히 복잡하게 클래스적인 구현을 흉내냈었지만 지금은 그런 방식까지 알 필요는 X.


// [1] : Object.create()
// 1. Object.create( 부모객체.prototype );
//					- 첫번째 인자(부모객체)로 들어온 해당 객체(부모)의 "프로토타입 객체"를 복제.
//					- 이렇게 복제된 것을 --> "자식객체.prototype" 에 할당.

// 2. 그러나 여전히 복제된 "프로토타입 객체"는 부모 객체를 가리키고 있기 때문에 이것을 자식 객체를 가리키도록 바꿔줘야 한다.
//					- "자식객체.prototype.constructor = 자식객체" 를 할당해서 연결 고리를 맞춰준다.

// 3. 마지막으로 하나 더 할게 남았는데..
//					- new 키워드를 통해서 인스턴스(객체)를 생성시 자식 객체의 this가 부모 객체까지 전달되도록 해줘야 한다. (super)
//					- 이를 해주기 위해서 --> 부모객체.call(=apply)(this, 인자값) --> 이렇게 해줘야 한다.
//					- class의 super 역할이라고 보면 된다.

// 정리
// class 에서는 상속을 extends 와 super를 통해서 구현하고 있다면,
// class 이전에는 위와 같이 Object.create()와 prototype, call 등을 이용해서 구현하고 있다.


// 부모 클래스
function ParentClass( name, age ) {
	this.name = name;
	this.age = age;
}

ParentClass.prototype.sayHello = function() {
	console.log( `Hello, ${ this.name }` );
}

// 자식 클래스
function ChildClass( name, age, power ) {
	ParentClass.call( this, name, age );  // class의 super 역할.
	this.power = power;
}

ChildClass.prototype = Object.create( ParentClass.prototype );
ChildClass.prototype.constructor = ChildClass;
ChildClass.prototype.move = function() {
	console.log( `${ this.name } is moving...` );
}

// 사용
const b1 = new ChildClass( 'batman', 20, 900 );
console.log( b1 );
console.log( b1.name );		// batman
console.log( b1.age );		// 20
console.log( b1.power );		// 900
b1.sayHello();
b1.move();
console.log( '--------------------------------------' );

const s1 = new ChildClass( 'superman', 30, 1500 );
console.log( s1 );
console.log( s1.name );		// superman
console.log( s1.age );		// 30
console.log( s1.power );		// 1500
s1.sayHello();
s1.move();
console.log( '--------------------------------------' );

console.log( b1.__proto__ );									// (자식) 프로토타입 객체
console.log( b1.__proto__.__proto__ );							// (부모) 프로토타입 객체
console.log( b1.__proto__.__proto__.__proto__ );				// Object
console.log( b1.__proto__.__proto__.__proto__.__proto__ );		// null

































