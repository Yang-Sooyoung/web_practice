// 자바스크립트 클래스 - 이터러블 객체와 이터레이터 객체


// [1] : 이터러블 규약과 이터레이터 규약
// 이터러블 규약
// for .. of 반복 구문을 사용하여 객체(반복 가능한 객체)를 반복할 때 --> 값이 열거되고 --> 내부에는 --> @@iterator 메서드가 구현되어 있어야 한다.
// Symbol.iterator() == @@iterator
// 자바스크립트 내장 객체 --> Array, String, Map, Set, arguments 등이 이 이터러블 규약을 따름.
// 이를 "반복 가능한 객체", "이터러블 객체" 등으로 부른다.

// 결국, 이터러블 객체라면 for .. of 구문으로 반복시키면서 값의 열거가 가능. --> 이때, 각 객체별로 열거되는 방식에는 차이가 있다.
// 예를 들면,
//				- 문자열(String)의 경우 --> 한 글자씩 따로 열거.
//				- 배열(Array)의 경우 --> 요소 단위로 하나씩 열거를 수행.

// 결국, 이러한 차이를 공통화하기 위해서 --> 이터러블 객체는 --> 내부적으로 @@iterator 메서드를 구현한다.
// 이때, @@iterator 메서드는 객체의 속성이나 또는 체이닝상의 객체 중 하나가 속성으로 Symbol.iterator 키를 가져야만 한다.





// [2] : 이터러블 객체의 생성
// 기본적으로 이터러블 객체(반복 가능한 객체)라면 Symbol.iterator 키를 가진다.
const str1 = "KOREA";
const iterator = str1[Symbol.iterator]();
// console.log( iterator );	// 이터레이터 객체는 --> "이터레이터 규약"에 따라 --> 내부의 next() 메서드를 통해 하나씩의 값을 순차적으로 열거.
							// 이때, 열거는 객체이며 --> 속성으로 --> value, done 2가지 속성을 가짐.
							// value(값), done(열거가 끝이면 true이고, 이때 value는 undefined, 반대로 끝이 아니면 false)

// console.log( iterator.next() );  // K, done: false
// console.log( iterator.next() );  // O, done: false
// console.log( iterator.next() );  // R, done: false
// console.log( iterator.next() );  // E, done: false
// console.log( iterator.next() );  // A, done: false
// console.log( iterator.next() );  // undefined, done: true
// console.log( iterator.next() );  // undefined, done: true

for( let value of iterator ) {
	console.log( value );
}


// Array
console.clear();
const ar1 = [ 'seoul', 'pusan', 'kwangju', 'jeju', 'dokdo' ];
const iter = ar1[Symbol.iterator]();
console.log( iter );

// console.log( iter.next() );  // seoul, done: false
// console.log( iter.next() );  // pusan, done: false
// console.log( iter.next() );  // kwangju, done: false
// console.log( iter.next() );  // jeju, done: false
// console.log( iter.next() );  // dokdo, done: false
// console.log( iter.next() );  // undefined, done: true
// console.log( iter.next() );  // undefined, done: true
console.log( '------------------------------------' );

for( let value of iter ) {
	console.log( value );
}





















