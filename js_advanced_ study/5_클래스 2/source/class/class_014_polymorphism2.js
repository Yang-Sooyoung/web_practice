// 자바스크립트 클래스 - 다형성(2)
// for .. of 반복 vs toString() 메서드
// 일반적으로 '다형성' 하면 보통 앞서 설명한 개념. --> 다형성의 한 예.


// [1] : for .. of
// 1. 다양한 자료구조에서 사용할 수 있다. --> 반복 가능한 객체( Array, String, Map, Set .. )
// 2. 반복문내에서 배열이나 문자열에서 동작하는 --> 특정 인터페이스가 지원되는 자료구조를 사용하기 때문.
// 3. 컬렉션 객체가 [Symbol.iterator] 속성을 가지고 있어야만.
// 4. 이 말은 내가 만든 사용자 정의 객체의 경우에도 --> 이러한 특정 인터페이스 규격을 맞춰준다면 --> 사용이 O.

// Array
const fruits = [ 'apple', 'banana', 'pear', 'watermelon', 'orange' ];

for( let value of fruits ) {
	console.log( value );
}

// String
const str = "KOREA";

for( let value of str ) {
	console.log( value );
}

// Number --> 반복 가능한 것이 아니므로 Error!
const num = 12345;

// for( let i of num ) {
	// console.log( i );
// }

// Map
const map1 = new Map( [["seoul", 1], ["pusan", 2], ["jeju", 3]] );

for( let city of map1 ) {
	console.log( city );
}

for( let [key, value] of map1 ) {		// 구조분해 할당( Destructuring assignment )
	console.log( key, value );
}





// [2] : toString() 메서드
// 모든 객체에는 객체를 텍스트 형식으로 출력시키고자 할 때 자동으로 호출되는 toString() 메서드가 존재.
// 즉, 객체를 나타내는 문자열을 반환. --> Object에서 파생된 모든 객체에 상속.
// 이 메서드가 사용자 정의 객체에서 재정의되면 --> 해당 재정의된 toString() 메서드가 적용. --> 그냥 사용하면 --> [object Object]
console.clear();

// Date
const dateObj = new Date( 2030, 5, 25, 20, 40, 8 );
strObj = dateObj.toString();
console.log( strObj );
console.log( typeof strObj );

// Array
const arObj = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ];
console.log( arObj.toString() );  // join 처럼..
console.log( typeof arObj.toString() );

// Object
const obj = new Object();
console.log( obj.toString() );  // [object Object]

// toString() 메서드 재정의 --> 목적 --> 보다 객체의 정보를 잘 보여주기 위해서.
console.clear();

function Person( name, age, hp, gender ) {
	this.name = name;
	this.age = age;
	this.hp = hp;
	this.gender = gender;
}

const p1 = new Person( '홍길동', 20, '010-1234-5678', '남성' );

console.log( p1.toString() );

Person.prototype.toString = function() {
	let result = `객체정보 --> 이름: ${ this.name }, 나이: ${ this.age }, 핸드폰: ${ this.hp }, 성별: ${ this.gender }`;
	return result;
}

console.log( p1.toString() );



// String.prototype.toString 재정의
console.clear();

String.prototype.getLength = function() { 
	return this.length;
}
String.prototype.toString = function() {
	return "나의 좌우명 --> " + this.valueOf();
}

let testObj = new String( "일단 해보고 안되면 다시 또 해보자!" );

// console.log( testObj.getLength() );  		// 20
// console.log( testObj );						// 일단 해보고 안되면 다시 또 해보자!
// console.log( testObj.toString() );			// 나의 좌우명 --> 일단 해보고 안되면 다시 또 해보자!

alert( testObj );

























































