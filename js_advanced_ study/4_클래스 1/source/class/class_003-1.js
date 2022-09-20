// 자바스크립트 클래스(Class) - 클래스 호이스팅(Hoisting)


// [1] : 함수 레벨 스코프 vs 블록 레벨 스코프
// var a = 111;			// 전역 변수
// console.log( a );		// 111

// function myA() {
	// var a = 333;		// 전역 변수 --> 함수 레벨 스코프, var 키워드는 중복이 허용(선언이 가능), 호이스팅 O. 함수가 아닌 변수 선언은 모두 전역.
// }
// console.log( a );		// 333 --> 111이 출력되게끔 하려면?


// [2] : 호이스팅이란?
// Hoisting 사전적의미 --> 끌어 올리기(scope) --> 국기 게양식
// 자바스크립트는 기본적으로 모든 선언문(var, let, const, function, class)을 --> 호이스팅.
// 호이스팅 == 스코프 안의 어디에서든 변수 선언은 최상위에서 선언한 것과 --> 동일.
// var 키워드와 let, const 키워드로 선언한 변수가 차이가 있다.


// console.log( 'testA 값은 = ' + testA );  // undefined
// var testA;

// console.log( 'testB 값은 = ' + testB );  // Err
// let testB;


// [3] : 클래스 호이스팅
// class Person {}
// console.log( Person );

// const p1 = new Person();
// console.log( p1 );


// var vs let, const == class 호이스팅 에러 비교.
// console.clear();
// let str1 = 'Hello, World';

// const testFun = function() {

	// console.log( str1 );
	// let str1 = 'Hello, Korea';
	
// };

// testFun();  // 이 함수의 실행 결과는 --> Err


// 클래스 상속
class Parent {}
class Child extends Parent {}		// 이렇게 상속하면 문제 없음.

class Child2 extends Parent2 {}	// 에러 발생 --> 유형? --> 초기화 Reference Error(참조 에러) 발생.
class Parent2 {}








































