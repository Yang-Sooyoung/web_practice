// 클로저(Closure)


// 클로저란 무엇인가?
// 자바스크립트 언어만의 고유한 개념은 X.
// 정의				--> 외부에 있는 변수가 내부에 있는 함수와 함수 호출한 후에도 종료되지 않고 계속 참조하는 것.
//					--> 외부의 변수와 내부의 함수가 끊기지 않고 연결고리가 계속 이어져 있는 것.


// [1] : 클로저 코드1 --> 바깥쪽에 있는 함수의 변수를 내부 함수가 참조하는 것.
const external = () => {
	let number = 65;  // 아스키코드 65 --> A
	let internal = () => {
		let char_ = String.fromCharCode( number );
		console.log( char_, number++ );  // internal 함수 내부에서는 number가 없으므로 상위로 올라가서 number를 찾음.
		// console.log( number );  // 66
	};
	internal();
};
external();		// A 	65
external();		// A 	65
external();		// A		65
external();		// A		65
console.log( '---------------------------------------' );


// [2] : 클로저 코드2
const external2 = () => {
	let number = 65;
	let internal = () => {
		let char_ = String.fromCharCode( number );
		return `${ char_ } : ${ number++ }`;  // 함수형 프로그래밍에서는 자꾸 return을 해주는게 좋다.
	};
	return internal();
};
console.log( external2() );	// A		65
console.log( external2() );	// A		65
console.log( external2() );	// A		65
console.log( external2() );	// A		65
console.log( '---------------------------------------' );


// [3] : 클로저 코드3
const out = function() {
	let number = 64;
	let internal = function() {
		let char_ = String.fromCharCode( ++number );
		return `${ char_ } : ${ number }`;
	};
	return internal;  // 함수의 실행 결과가 아닌 함수 자체(internal)를 반환하면 외부와 연결고리가 계속 남게 된다.
};

// 위 경우는 함수의 종료가 깔끔하게 끝나지 않고 계속 연결고리가 남은 상태.
// 마치, 일상에서 어떤 비즈니스 거래를 하고나서 깔끔하게 돈 받고 거래가 끝나면 되는데, 돈이 아닌 어음을 받는 그런 상황.
// 결론적으로, 연결고리가 계속 남게 함수 자체를 리턴시켜버리고, 그 함수를 받은 변수(out2)가 받아서 out2를 계속해서 재실행.

const out2 = out();		// 가장 중요한 부분!
						// out 외부함수를 실행하여 out2 변수에 할당하면 out 외부함수가 internal 내부함수를 반환했기 때문에
						// out2 변수가 반환된 함수인 internal 내부함수를 계속 참조하게 됨.
						// 결국, 가비지 컬렉터(Garbage Collector)는 변수가 참조하고 있는 함수는 수집을 하지 않으므로 수집대상에서 제외.
						// 여전히 internal 내부함수는 out2 변수에 의해 호출될 수 있는 것이다.

console.log( out2() );	// A 	65
console.log( out2() );	// B 	66
console.log( out2() );	// C 	67
console.log( out2() );	// D 	68
console.log( out2() );	// E 	69




























































