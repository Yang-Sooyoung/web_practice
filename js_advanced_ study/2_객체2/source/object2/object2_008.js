// 생성자 함수와 내부에서 처리되는 동작들


// [1] : 객체 리터럴
const animal = {
	name: 'tiger',
	age: 20
}

console.log( animal.name, animal.age );  // tiger, 20

// 위와 비슷한 객체의 동물을 수십, 수백개 만들어야 하는 상황이라면?
// 이런 상황을 대비하여 --> 위와 같은 비슷한 객체를 생성해주는 생성자 함수를 만들어놓고 사용.


// [2] : 생성자 함수
// 첫 글자는 관례적으로 대문자로 작성 --> Animal
// 새롭게 생성되는 객체 자신을 가리키는 것 --> this를 사용.
// new 연산자를 사용해서 새로운 객체 --> 생성 --> 만약 new를 안붙이면 undefined 처리 --> 객체 생성시에는 new 연산자를 꼭 사용!
function Person( name, age ) {
	this.name = name;
	this.age = age;
}

let p1 = new Person( '홍길동', 20 );
let p2 = new Person( '이순신', 30 );
let p3 = new Person( '강감찬', 40 );

console.log( p1 );
console.log( p2 );
console.log( p3 );

// 정리 : 생성자 함수 --> 비슷한 객체를 만들어내는 '공장' 이라고 생각하자!


// [3] : 생성자 함수의 내부 실행 과정
function Person( name, age ) {
	
	// this = {};  // this라는 빈 객체를 하나 생성한 후에 속성을 추가.
	this.name = name;
	this.age = age;
	// return this;
	
}

// 정리 : new 연산자를 사용하여 새로운 객체를 생성시에는 생성자 함수 내부에서 위와 같은 처리로 새로운 객체가 생성.















































