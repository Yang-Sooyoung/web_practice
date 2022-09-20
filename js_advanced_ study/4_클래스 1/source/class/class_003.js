// 자바스크립트 클래스(Class) - 호이스팅(Hoisting)


// [1] : 함수 레벨 스코프 vs 블록 레벨 스코프
var a = 111;			// 전역 변수
console.log( a );		// 111

function myA() {
	var a = 333;		// 전역 변수 --> 함수 레벨 스코프, var 키워드는 중복이 허용(선언이 가능), 호이스팅 O. 함수가 아닌 변수 선언은 모두 전역.
}
console.log( a );		// 333 --> 111이 출력되게끔 하려면?


// [2] : 호이스팅이란?
// Hoisting 사전적의미 --> 끌어 올리기(scope) --> 국기 게양식
// 자바스크립트는 기본적으로 모든 선언문(var, let, const, function, class)을 --> 호이스팅.
// 호이스팅 == 스코프 안의 어디에서든 변수 선언은 최상위에서 선언한 것과 --> 동일.
// var 키워드와 let, const 키워드로 선언한 변수가 차이가 있다.


console.log( 'testA 값은 = ' + testA );  // undefined
var testA;

console.log( 'testB 값은 = ' + testB );  // Err
let testB;




















