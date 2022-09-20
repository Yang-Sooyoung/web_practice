// 자바스크립트 클래스 - 클래스와 프로토타입


// [1] : 클래스를 타입체크해보면? --> function
class Person {
	
	constructor( name, age ) {
		this.name = name;
		this.age = age;
	}
	
	testHello() {
		console.log( this.name, this.age );
	}
	
}

// 타입체크
console.log( typeof Person );  // function


// [2] : 함수도 객체
function myMultiplication( a, b ) {
	return a * b;
}

// 이 함수에 ret 속성을 추가.
myMultiplication.ret = myMultiplication( 10, 10 );
console.log( myMultiplication.ret );  // 100


// [3] : 어떻게 클래스가 타입체크를 했을 때 function으로 찍힐 수 있는걸까?

// 클래스 선언문은 아래와 같은 내부동작을 수행.
// 1. Person 이름의 함수를 생성.
// 2. 이 함수의 본문은 class의 constructor를 그대로 가져온다. 만약, constructor가 없으면 빈 함수를 생성.
// 3. 메서드는 같은 이름의 Person.prototype(프로토타입 객체)에 추가.
// 4. 결국 "프로토타입 객체"쪽에 클래스내에 정의한 메서드들을 추가해놓는 것이기 때문에, 
//	 해당 클래스의 인스턴스(객체)가 생성되면 추가된 메서드를 자유롭게 이용할 수 있는 것이다. --> 프로토타입 이해가 필요!












































































