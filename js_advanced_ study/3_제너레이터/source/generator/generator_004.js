// Promise와 Generator 함수를 이용한 비동기 처리 - Generator로 변환


// 실습
const calc = ( x, y ) => {
	setTimeout(
		() => {
			iter.next( x * y );
		},
		1000
	);
};

function* testGen() {

	const a = yield calc( 1, 10 );  		// 10
	console.log( a );

	const b = yield calc( a, 20 );		// 200
	console.log( b );

	const c = yield calc( b, 30 );		// 6000
	console.log( c );

	const d = yield calc( c, 40 );		// 240000
	console.log( d );

};

const iter = testGen();
iter.next();

// function* testGen() {
// 	const a = yield 1;  		// 10
// 	console.log( a );

// 	const b = yield 2;		// 200
// 	console.log( b );

// 	const c = yield 3;		// 6000
// 	console.log( c );

// 	const d = yield 4;		// 240000
// 	console.log( d );
// };

// const iter = testGen();
// iter.next();
// iter.next(10);  		// 10
// iter.next(200);  		// 200
// iter.next(6000);  	// 6000
// iter.next(240000);  	// 240000









