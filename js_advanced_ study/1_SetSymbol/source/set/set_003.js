// ES6 set() 자료구조 - 반복


// [ ! ] 
let ar = [ 'a', 'b', 'c', 'd', 'e' ];


// [1] : 전통적인 for 반복문
for( let i=0; i < ar.length; i++ ) {
	console.log( ar[i] );
}
console.log( '---------------------------------' );


// [2] : forEach() 메서드를 사용한 반복
ar.forEach( val => console.log( val ) );


// [3] : Set의 다양한 메서드 --> keys(), values()
let testSet3 = new Set( [ "tiger", "lion", "dog", "cat" ] );
testSet3.add( "hippo" );

console.log( testSet3 );

let arr = [...testSet3];

console.log( arr[0] );  // tiger
console.log( arr[4] );  // hippo
console.log( '--------------------------------- keys()' );


// keys() 메서드 --> Iterator(반복자) 객체를 반환 --> next() 메서드
const key_itr = testSet3.keys();

console.log( key_itr.next().value );  // tiger
console.log( key_itr.next().value );  // lion
console.log( key_itr.next().value );  // dog
console.log( key_itr.next().value );  // cat
console.log( '--------------------------------- values()' );


// values() 메서드 --> Iterator(반복자) 객체를 반환 --> next() 메서드
const val_itr = testSet3.values();

console.log( val_itr.next().value );  // tiger
console.log( val_itr.next().value );  // lion
console.log( val_itr.next().value );  // dog
console.log( val_itr.next().value );  // cat
console.log( '---------------------------------' );

// [4] : for .. of 반복문으로 출력
for( let i of testSet3 ) {
	console.log( i );
}
console.log("--------------------------------- of");

// [5] : entries() 메서드
let testSet5 = new Set();

testSet5.add( '홍길동' );
testSet5.add( '이순신' );
testSet5.add( '강감찬' );

const entries = testSet5.entries();

for( let i of entries ) {
	console.log( i );
}

// 삽입 순으로 Set 요소 각각에 대해서 [ value, value ] 배열 형식으로 새로운 객체를 반환.

































