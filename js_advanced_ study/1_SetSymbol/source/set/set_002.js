// ES6 set() 자료구조 - 생성시 추가와 Spread(펼침) 연산자 출력


// [1] : 생성시 값을 추가하는 방법
let ar = new Set().add( 'X' ).add( 'Y' );
console.log( ar );  // X, Y

// 추가
ar.add( 'A' );
ar.add( 'B' );
ar.add( 'C' );

console.log( ar );  		// X, Y, A, B, C
console.log( ar.size );	// 5


// [2] : 출력 --> Spread 연산자 사용 --> 이터러블 객체(Iterable Object)의 요소를 하나씩 분리하여 전개 --> 펼침 연산자
let testArr = 'korea';

console.log( ...testArr );  // k, o, r, e, a
console.log( [...testArr] );

console.log( [...'hello'] );

console.log( ...ar );
console.log( [...ar] );





















