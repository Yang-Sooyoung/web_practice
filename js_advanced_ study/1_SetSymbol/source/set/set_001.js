// ES6 set() 자료구조


// [ ! ]
// ES6에서 새롭게 도입한 데이터 자료구조 --> map, set
// map은 key와 value를 한 쌍으로 묶는다는 점에서 객체(Object)와 비슷하고, set은 중복을 허용하지 않는다는 특징을 빼면 --> 배열과 유사.


// [1] : set
// set --> 집합 --> key, value의 쌍이 있다면 value들의 집합 또는 컬렉션.
// 파이썬 학습자 --> 파이썬의 set을 연상.


// [2] : 특징
// 배열(array)은 같은 값을 가질 수 있지만, set(집합)은 같은 값을 중복해서 가질 수 없다.
// 중복해서 같은 값을 추가해봤자 추가되지 X --> 그래서, 이러한 성질을 이용하여 중복을 제거하는 용도로도 많이 쓰임.
// 예↓
// let ar2 = [ 1, 2, 3, 4, 5, 5 ];
// console.log( ar2 );  		// 1, 2, 3, 4, 5, 5
// console.log( ar2[4] );		// 5
// console.log( ar2[5] );		// 5


// [3] : set 사용법
// 생성 --> new
// 추가 --> add
// 삭제 --> delete


// 생성
let ar3 = new Set();  	// 비어있는 set(집합)을 하나 생성. 
// alert( ar3 );	// object set 객체를 반환.


// 추가
ar3.add( 'A' );
ar3.add( 'B' );
ar3.add( 'C' );
console.log( ar3[0] );  // A ??? --> undefined --> 뭔가 배열과는 틀리구나.. 라는 것을 알 수 있음.


// 사이즈
console.log( "ar3 사이즈는 = " + ar3.size );  // 3


// 삭제
ar3.delete( 'C' );
console.log( ar3 );  // A, B


// 삭제 --> 한꺼번에 모두 삭제 --> clear()
ar3.clear();
console.log( ar3 );























