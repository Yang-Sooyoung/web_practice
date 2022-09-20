// setTimeout vs setInterval - 두번째 이야기
// 비동기 처리에는 다양한 방법들이 존재 --> Promise와 Generator 함수를 이용한 비동기 처리


// [-] : 호출 스케쥴링 함수 --> setTimeout(), setInterval()
// setTimeout												setInterval
// 일정 시간 "후에" 함수를 한번만 실행.							일정 시간 "마다" 함수를 주기적으로 실행.
// clearTimeout												clearInterval


// setTimeout 예1
// function testHello() {
	// console.log( 'Hello~' );
// }
// testHello();						// 그냥 호출
// setTimeout( testHello, 2000 );		// 지연 호출 --> 시간 단위는 밀리세컨드(millisecond, 1000 = 1초). 기본값은 0.


// setTimeout 예2
// function testHello2( t ) {
	// console.log( t );
// }
// setTimeout( testHello2, 3000, 'Hello, World~' );  // 주의! --> 함수를 호출하지 말고 함수명만 기재.


// setTimeout 예3
// const tid = setTimeout( (a) => console.log(a), 4000, '안녕하세요~' );
// console.log( 'setTimeout 예3 tid 값은 = ' + tid );  // 3


// setTimeout 예4
// const tid2 = setTimeout( () => console.log('abccccccccccccccccccccccccc'), 4000 );
// console.log( 'setTimeout 예4 tid 값은 = ' + tid2 );  // 4


// 호출 스케쥴링 취소 --> clearTimeout
// setTimeout 호출 --> 타이머 식별자 반환. --> 숫자(number)

// const ti = setTimeout( (a) => console.log(a), 2000, 'aaa' );
// console.log( ti );  // 1

// const ti2 = setTimeout( (b) => console.log(b), 4000, 'bbb' );
// console.log( ti2 );  // 2

// clearTimeout( ti );





// setInterval
// setTimeout과의 차이점 --> setTimeout은 함수를 한번만 실행 --> setInterval은 함수를 주기적으로 실행.
// 주기적인 실행을 중단 --> clearInterval 사용.

// 1초 간격으로 문자열 출력
// const tid = setInterval( () => console.log( 'korea' ), 1000 );
// console.log( tid );  // 1

// 위와 같은 상황에서 주기적인 실행을 중지.
// const myStop = ( tid ) => {
	// clearInterval( tid );
// }
// setTimeout( myStop, 5000, tid );
// setTimeout( () => myStop(tid), 5000 );


// setInterval 동작
// setTimeout( () => console.log( 'setTimeout' ), 300 );  		// 1번만 출력.
// setInterval( console.log( 'setInterval' ), 600 );				// 1번만 출력.
// setInterval( () => console.log( 'setInterval' ), 1000 );		// 함수 안에 있을 때 --> 지정된 시간 간격으로 반복 실행.
setInterval( function() { console.log( 'setInterval' ) }, 1000 );










































