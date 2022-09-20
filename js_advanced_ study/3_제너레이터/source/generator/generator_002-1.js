// 계속 증가하는 값을 clearInterval 사용하여 중지


// [1] : 실습
// let cnt = 0;

// let tid = setInterval( () => {
	// console.log( tid );  // 1
	// cnt++;
	// console.log( cnt );
	// if( cnt == 500 ) clearInterval( tid );
// } );


// [2] : 실습 --> 2초 단위로 흘러가는 시계를 출력하시오.
function myClock() {
	
	let clock = document.getElementById( "clock" );
	let d = new Date();
	
	// 월 return 값 --> number, 월, 0~11, 0부터 시작 --> 주의!!
	clock.innerText = `현재 시각은 ${ d.getMonth()+1 }월 ${ d.getDate() }일 ${ d.getHours() }시 ${ d.getMinutes() }분 ${ d.getSeconds() }초 입니다.`;
	
	setTimeout( myClock, 2000 );
	
}

// HTML 로딩 완료되면 함수 호출
window.onload = () => myClock();
// window.onload = setTimeout( () => myClock(), 2000 );
// window.onload = setInterval( () => myClock(), 2000 );























