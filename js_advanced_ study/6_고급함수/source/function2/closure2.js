// 클로저(Closure) - 1초 단위로 1씩 증가하는 클로저 카운터를 구현하시오.
// 이때, 자동으로 1초씩 증가하면서 콘솔에 값을 출력하시오.


// [1] : 클로저
const out = () => {
	let cnt = 0;
	let internal = () => ++cnt;
	return internal;
};

const out2 = out();

setInterval( () => console.log( out2() ), 1000 );





























































