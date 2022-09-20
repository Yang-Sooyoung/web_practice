// 자바스크립트 클래스 - 접근 제한자
// 자바스크립트에는 전통적인 다른 OOP에서와 같은 접근자( private, public, protected )가 없고 --> 기본적으로 모두 public 이다.
// 즉, 해당 클래스의 인스턴스(객체)를 통해 --> 외부에서 항상 '참조'가 가능.
// 그래서 생성자 메서드내에서 속성명 앞에 '_"를 임의로 붙여 "이것은 private 이에요.."라고 암묵적으로 표시. --> this._name
// private --> 최신 브라우저 위주로 지원.


// [1] : Property
class Person {
	age = 20;
	power = 900;
	#finger = 10;			// private --> 외부에서 직접 접근할 수 없다.
	#toe = 10;				// private
}

const p1 = new Person();
console.log( p1 );			// {age:20, power: 900}
console.log( p1.age );		// 20
console.log( p1.power );		// 900
p1.age = 10;
console.log( p1.age );		// 10
console.log( '--------------------------------------' );
console.log( p1.finger );		// undefined
// console.log( p1.#finger );	// Private Error!
// console.log( p1.#toe );		// Private Error!


// [2] : Method
console.clear();
class Animal {
	#age = 4;
	bark() {
		this.#age = 8;  // 클래스 내부에서의 접근은 가능.
		return `${ this.#age }살 짜리 개가 짖고 있다. 멍멍~`;
	}
}

const ani1 = new Animal();
// console.log( ani1.#age );		// Private Error!
console.log( ani1.bark() );		


// [3] : Method
console.clear();
class Animal2 {
	#age = 4;
	bark() {
		this.#age = 8;
		return `${ this.#age }살 짜리 개가 짖고 있다. 멍멍~`; 
	}
	#privateMethod() {
		return `Hello, Private Method`;
	}
	getPrivateMethod() {
		return this.#privateMethod();
	}
}

const ani2 = new Animal2();
// console.log( ani2.#privateMethod() );		// Private Error! --> get 메서드를 만들어서 접근.
console.log( ani2.getPrivateMethod() );		// Hello, Private Method


// [4] : Private static method
console.clear();
class Animal3 {
	static #privateStaticMethod() {
		return 'Hello, Private Static Method~';
	}
	static getPrivateStaticMethod() {
		return this.#privateStaticMethod();
	}
	static getPrivateStaticMethod_ClassName() {
		return Animal3.#privateStaticMethod();
	}
}

// const ani3 = new Animal3();
// console.log( Animal3.#privateStaticMethod() ); 	// Private Error!
console.log( Animal3.getPrivateStaticMethod() );
console.log( Animal3.getPrivateStaticMethod_ClassName() );










































