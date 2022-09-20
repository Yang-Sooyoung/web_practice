// 클로저(Closure) - 1씩 증가하는 클로저 카운터를 구현하시오.
// 이때, 웹페이지로 버튼을 만들어 구현하시오.


// [1] : 클로저 카운팅
const btnView2 = document.getElementById( 'btnView' );
const cntView2 = document.getElementById( 'cntView' );

const out = () => {
	let cnt = 0;
	let internal = () => ++cnt;
	return internal;
}

const out2 = out();

btnView2.onclick = () => {
	cntView2.innerText = out2();
};























































