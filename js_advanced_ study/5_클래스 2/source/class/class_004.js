// 자바스크립트 클래스 - 표현식 정의


// [1] : 무명 표현식
// const Person = class {
	// constructor( name, age ) {
		// this.name = name;
		// this.age = age;
	// }
// };

// const p1 = new Person( '홍길동', 20 );
// console.log( p1.name );
// console.log( p1.age );
// console.log( '-------------------------------------------' );
// console.log( Person.name );  // Person --> 클래스명이 없으므로 암묵적으로 변수명이 name 속성의 값이 된다.


// [2] : 유명 표현식
const Person = class namedPerson {
	constructor( name, age ) {
		this.name = name;
		this.age = age;
	}
};

const p1 = new Person( '이순신', 30 );
console.log( p1.name );
console.log( p1.age );
console.log( '-----------------------------------------' );
console.log( Person.name );  // namedPerson --> 클래스명이 있으므로 name 속성의 값은 클래스명이 된다.


// const p2 = new namedPerson( '강감찬', 40 );  // Err





















