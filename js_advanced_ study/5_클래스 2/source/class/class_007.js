// 자바스크립트 클래스 - 체크문제


// [1]
class Animal {
	constructor( name ) {
		this.name = name;
	}
	cry() {
		console.log( this.name + '가 웁니다.' );
	}
	move() {
		console.log( this.name + '가 이동합니다.' );
	}
}

const ani1 = new Animal( '호랑이' );
console.log( ani1.name );
ani1.cry();
ani1.move();
console.log( '------------------------------------' );


// [2] : 아래 예상되는 결괏값을 말해보시오.
// 1. 클래스 타입체크?
console.log( typeof Animal );  // function ( 클래스 == 함수 )


// 2. 속성과 메서드 추가?
Animal.prototype.age = 4;
Animal.prototype.run = function() { console.log( this.name + '가 뛰어갑니다.' ); };
console.log( ani1.age );  // 4
ani1.run();


// 3. 클래스의 이름은?
console.log( Animal.name );  // Animal
console.log( Animal === Animal.prototype.constructor );  // true


// 4. Animal 프로토타입 객체의 멤버들을 모두 보고 싶다면?
console.log( Object.getOwnPropertyNames(Animal.prototype) );  // [ "constructor", "cry", "move", "age", "run" ]






























