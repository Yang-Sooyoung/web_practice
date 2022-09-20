// 자바스크립트 클래스 - 이터러블 객체와 이터레이터 객체


// [1] : 이터러블 규약과 이터레이터 규약

// [2] : 이터러블 객체의 생성
// 기본적으로 이터러블 객체(반복 가능한 객체)라면 Symbol.iterator 키를 가진다.

// [3] : 이터레이터 객체 직접 구현
let testIterObj = {
	i: 1,
	[Symbol.iterator]: function() {
		return this;
	},
	next: function() {
		// 리턴시 next() 메서드는 객체를 리턴한다.
		if( this.i < 5 )
			return { value: this.i++, done: false };
		else
			return { value: undefined, done: true };
	}
}
// const str = "KOREA";
// const iter = testIterObj[Symbol.iterator]();
// console.log( testIterObj.next() );  // value: 1, done: false
// console.log( testIterObj.next() );  // value: 2, done: false
// console.log( testIterObj.next() );  // value: 3, done: false
// console.log( testIterObj.next() );  // value: 4, done: false
// console.log( testIterObj.next() );  // value: undefined, done: true
// console.log( testIterObj.next() );  // value: undefined, done: true

const iter = testIterObj[Symbol.iterator]();
for( let value of iter ) {
	console.log( value );  // 1, 2, 3, 4
}










































