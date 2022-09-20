// 프로토타입 객체의 속성(2)


// [1] : constructor 속성
// 이 속성은 함수(예: Animal)를 가리킨다. --> 참조 --> 즉, 참조를 값으로 가지는 속성.


// [2] : 서로가 참조 --> 이 말은 --> 서로가 연결고리 역할. ★
// 생성자 함수(Animal)	<------------------------------------------------>		(Animal) 프로토타입 객체
// + prototype																			+ constructor
function Animal( name, age ) {
	this.name = name;
	this.age = age;
}
Animal.prototype.aaa = function() { console.log( 'aaa' ); }

function Animal2( name, age ) {
	this.name = name;
	this.age = age;
}
Animal2.prototype.bbb = function() { console.log( 'bbb' ); }

let a1 = new Animal( 'tiger', 20 );
a1.aaa();  // aaa

a1.__proto__ = Animal2.prototype;
a1.bbb();  // bbb


// [3] : new 연산자에 의해 새롭게 생성된 객체 --> 인스턴스
// 생성자 함수(Animal) <--> new 객체(tiger, lion)
// 이 둘의 관계는 딱히 없는데 중요한(?)게 있다면 --> new 연산자가 생성자 함수를 이용해서 새로운 객체를 생성.
// 하지만, 이렇게 생성된 객체들(tiger, lion)의 원형(부모)은 "(Animal) 프로토타입 객체".
// 프로토타입 체인이 어떻게 연결되는지를 잘 기억하는게 중요!!


// [4] : 인스턴스(new 객체)가 어떤 생성자 함수로 생성된 것인지를 알아내는 방법이 있나?
// 위에서 말한 --> "(Animal) 프로토타입 객체"
//				   + constructor <-- 이게 생성자 함수를 가리키고 있으므로 이 값을 확인하면 됨.

// new 연산자로 새롭게 만들어진 인스턴스(객체)는 자신의 부모격인 원형(프로토타입 객체)에서 특성(속성, 메서드)을 상속 받으므로, 
// 당연히 "(Animal) 프로토타입 객체"의 constructor 속성을 참조 가능.


// [5] : 예
console.clear();
function A() {}

const testObj = new A();

console.log( testObj.constructor );  		// 무엇을 가리키는가? --> function A() {}
console.log( A.prototype.__proto__ );		// 무엇을 가리키는가? --> Object( Object.prototype ) --> null


// testObj 인스턴스(객체)가 A로 생성된 것인지를 판별??? --> instanceof 연산자 사용.
// 사용법 --> 객체명 instanceof 생성자 함수명
// instanceof 연산자 --> 객체와 생성자 2개가 필요하므로 --> 이항 연산자.
console.log( '------------------------------------ instanceof' );

// 객체 리터럴
const testObj2 = {
	name: '홍길동',
	age: 20
};

console.log( testObj instanceof A );  			// true
console.log( testObj2 instanceof A );			// false
console.log( testObj2 instanceof Object );	// true
console.log( testObj2 );


// 정리
// instanceof 연산자는 특정 객체가 그 객체와 연결된 즉, 프로토타입 체인에 연결(포함)되어 있는지를 체크하는 방법중 하나.
// 이 외에도 --> isPrototypeOf() 메서드를 이용하는 방법도 있다.















